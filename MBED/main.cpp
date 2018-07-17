#include "mbed.h"
#include "MODSERIAL.h"
#include <stdint.h>

// our serial-usb port to the CPU
MODSERIAL cpu( USBTX, USBRX );

//
// MBED PINS (ordered by number)
//
// leds (for debugging)
DigitalOut mled1(LED1);
DigitalOut mled2(LED2);
DigitalOut mled3(LED3);
DigitalOut mled4(LED4);

// Added by Stuart 
// Set up power pins
// Note that it's Zero for "on"
DigitalOut turn_on_system(p17);
DigitalOut turn_on_amps(p25);
// End Added by Stuart

// Setup SPI pins
SPI spi( p5, p6, p7 );
// Activate/select chip by falling edge
DigitalOut ADC_CS( p9 );
// clock signal to activate PLA setting
DigitalOut PLA_cs(p10);
// To force a trigger
DigitalOut forceTrigger(p11);  //modification
// To suppress thermal triggers
DigitalOut enableThermTrig(p12);
// Restart clock on all FPGAs.
DigitalOut DoNotRestartAllClocks( p13 );
// This tells the DFPGAs to store the data on motherboard FPGA and
// read it out.
DigitalIn a_sf_clk( p14 );
DigitalIn rst_a_sf(p15);
// Lock daughter card registeres (during data readout).
DigitalOut lockRegisters( p20 );
// Majority logic pins
DigitalOut MajLogHiBit(p22);
DigitalOut MajLogLoBit(p23);
// Tell FPGA to be ready to accept DAC values
DigitalOut start_fpga(p26); 
// Two bits to the select the daughter card for readout
DigitalOut selCardHiBit( p29 );
DigitalOut selCardLoBit( p30 );
// To launch a heartbeat pulse
DigitalOut heartbeat(p24);

void SetChanNumBits(const unsigned char ch,
                    DigitalOut* hibit, DigitalOut* lobit) {
    // ch = 0,1,2,3
    // extract its bits
    *hibit = (ch & 0x2) >> 1;
    *lobit = (ch & 0x1);
}

//
// globals
//
static Ticker     gForceTicker;
static bool       gFirstEvt    = true;
static bool       gReadingOut  = false;

//
// constants
//
static const unsigned char kNchans       = 4;
static const unsigned char kNfpgaDacs    = 4;
static const unsigned char kNplas        = 2; // TODO: up to 72 when FPGA code is ready for it
static const unsigned char kNsamps       = 128;
static const unsigned char kTotDacs      = kNchans*kNfpgaDacs;
static const short         kDefFpgaDac   = 3072;
static const short         kDefPlaVal    = 0x7FFF; // HAAAAAAA, bits R->L (TODO: change if FPGA code changes)
static const unsigned char kForceTrigBit = 0;
static const unsigned char kThermTrigBit = 1; // unused (TODO)
static const unsigned char kExtrnTrigBit = 2; // unused (TODO)
// flags for talking to the CPU
//static const char          kSoftTrgFlag  = 'S';
static const char          kConfigFlag   = 'C';
static const char          kOKFlag       = 'K';
static const int           kWriteCPUWait = 1000; // microseconds

//
// utilities for reading/writing bytes
//
#define BIT(n)               (1ULL << (n))
static const int kShrtsInInt = sizeof(int)/sizeof(short);
static const int kCharsInInt = sizeof(int)/sizeof(char);
union IntShrtChar_t {
    int   i;
    short s[kShrtsInInt]; // s[2]
    char  c[kCharsInInt]; // c[4]
};
IntShrtChar_t tmp;
char  ReadCharFromCPU() {
    return cpu.getc();
}
short ReadShortFromCPU();
int   ReadIntFromCPU();
int   WriteCharToCPU(const char a) {
    return cpu.putc(a);
}
int   WriteShortToCPU(const short a);
int   WriteIntToCPU(const int a);
bool  WaitForCPU(const char handshake, const int waitMS);
bool  WaitCPUWriteable(const int timeoutUS);


//
// Data storage (to / from CPU)
//
int           dCpuConfTime;              // cpu config time
int           dMbedEvtTime;              // mbed event time
short         dTrigBits;                 // trigger bits
short         dDAC[kNchans][kNfpgaDacs]; //[card id][dac id] values should be 0-4095 here (not checked tho)
short         dPLA[kNplas];              //[pattern id] (same for each card)
unsigned char dNumCardsMajLog;           // number of cards participating in the MajLogic trigger (1 to 4)
bool          dEnableThermTrig;          // whether or not to allow thermal triggers
int           dForceTrigPeriod;          // number of seconds between force triggers
short         dEvent[kNchans][kNsamps];  //[card id][sample id] values 0-4095.. the actual waveform sample data!
uint32_t      dCRC32;                    // a 32 bit crc of the event data

//
// Config functions
//
void ClearConfig();
void GetConfigFromCPU();
void SetConfigVals();
uint8_t binToGray(const uint8_t x) {
    return (x >> 1u) ^ x;
}


//
// Readout functions
//
void procForceTrigger();
void WaitTrigAndSendClock( const bool firstEvt );
void ReadAllRegisters();
void ReadRegister(const unsigned char chan, short* dev);
void SendEventToCPU( const bool calcCRC );
void ClearEvent();


/*******************************************************************\
*   CRC code "borrowed" from:                                       *
*   http://mbed.org/users/jpelletier/programs/CRC/lje513            *
*   Library         : lib_crc                                       *
*   File            : lib_crc.c                                     *
*   Author          : Lammert Bies  1999-2008                       *
*   E-mail          : info@lammertbies.nl                           *
*   Language        : ANSI C                                        *
\*******************************************************************/
const uint32_t crc_tabxfer_normal[] = {
    0x00000000, 0x000000AF, 0x0000015E, 0x000001F1, 0x000002BC, 0x00000213, 0x000003E2, 0x0000034D, 
    0x00000578, 0x000005D7, 0x00000426, 0x00000489, 0x000007C4, 0x0000076B, 0x0000069A, 0x00000635, 
    0x00000AF0, 0x00000A5F, 0x00000BAE, 0x00000B01, 0x0000084C, 0x000008E3, 0x00000912, 0x000009BD, 
    0x00000F88, 0x00000F27, 0x00000ED6, 0x00000E79, 0x00000D34, 0x00000D9B, 0x00000C6A, 0x00000CC5, 
    0x000015E0, 0x0000154F, 0x000014BE, 0x00001411, 0x0000175C, 0x000017F3, 0x00001602, 0x000016AD, 
    0x00001098, 0x00001037, 0x000011C6, 0x00001169, 0x00001224, 0x0000128B, 0x0000137A, 0x000013D5, 
    0x00001F10, 0x00001FBF, 0x00001E4E, 0x00001EE1, 0x00001DAC, 0x00001D03, 0x00001CF2, 0x00001C5D, 
    0x00001A68, 0x00001AC7, 0x00001B36, 0x00001B99, 0x000018D4, 0x0000187B, 0x0000198A, 0x00001925, 
    0x00002BC0, 0x00002B6F, 0x00002A9E, 0x00002A31, 0x0000297C, 0x000029D3, 0x00002822, 0x0000288D, 
    0x00002EB8, 0x00002E17, 0x00002FE6, 0x00002F49, 0x00002C04, 0x00002CAB, 0x00002D5A, 0x00002DF5, 
    0x00002130, 0x0000219F, 0x0000206E, 0x000020C1, 0x0000238C, 0x00002323, 0x000022D2, 0x0000227D, 
    0x00002448, 0x000024E7, 0x00002516, 0x000025B9, 0x000026F4, 0x0000265B, 0x000027AA, 0x00002705, 
    0x00003E20, 0x00003E8F, 0x00003F7E, 0x00003FD1, 0x00003C9C, 0x00003C33, 0x00003DC2, 0x00003D6D, 
    0x00003B58, 0x00003BF7, 0x00003A06, 0x00003AA9, 0x000039E4, 0x0000394B, 0x000038BA, 0x00003815, 
    0x000034D0, 0x0000347F, 0x0000358E, 0x00003521, 0x0000366C, 0x000036C3, 0x00003732, 0x0000379D, 
    0x000031A8, 0x00003107, 0x000030F6, 0x00003059, 0x00003314, 0x000033BB, 0x0000324A, 0x000032E5, 
                                                                                              
    0x00005780, 0x0000572F, 0x000056DE, 0x00005671, 0x0000553C, 0x00005593, 0x00005462, 0x000054CD, 
    0x000052F8, 0x00005257, 0x000053A6, 0x00005309, 0x00005044, 0x000050EB, 0x0000511A, 0x000051B5, 
    0x00005D70, 0x00005DDF, 0x00005C2E, 0x00005C81, 0x00005FCC, 0x00005F63, 0x00005E92, 0x00005E3D, 
    0x00005808, 0x000058A7, 0x00005956, 0x000059F9, 0x00005AB4, 0x00005A1B, 0x00005BEA, 0x00005B45, 
    0x00004260, 0x000042CF, 0x0000433E, 0x00004391, 0x000040DC, 0x00004073, 0x00004182, 0x0000412D, 
    0x00004718, 0x000047B7, 0x00004646, 0x000046E9, 0x000045A4, 0x0000450B, 0x000044FA, 0x00004455, 
    0x00004890, 0x0000483F, 0x000049CE, 0x00004961, 0x00004A2C, 0x00004A83, 0x00004B72, 0x00004BDD, 
    0x00004DE8, 0x00004D47, 0x00004CB6, 0x00004C19, 0x00004F54, 0x00004FFB, 0x00004E0A, 0x00004EA5, 
    0x00007C40, 0x00007CEF, 0x00007D1E, 0x00007DB1, 0x00007EFC, 0x00007E53, 0x00007FA2, 0x00007F0D, 
    0x00007938, 0x00007997, 0x00007866, 0x000078C9, 0x00007B84, 0x00007B2B, 0x00007ADA, 0x00007A75, 
    0x000076B0, 0x0000761F, 0x000077EE, 0x00007741, 0x0000740C, 0x000074A3, 0x00007552, 0x000075FD, 
    0x000073C8, 0x00007367, 0x00007296, 0x00007239, 0x00007174, 0x000071DB, 0x0000702A, 0x00007085, 
    0x000069A0, 0x0000690F, 0x000068FE, 0x00006851, 0x00006B1C, 0x00006BB3, 0x00006A42, 0x00006AED, 
    0x00006CD8, 0x00006C77, 0x00006D86, 0x00006D29, 0x00006E64, 0x00006ECB, 0x00006F3A, 0x00006F95, 
    0x00006350, 0x000063FF, 0x0000620E, 0x000062A1, 0x000061EC, 0x00006143, 0x000060B2, 0x0000601D, 
    0x00006628, 0x00006687, 0x00006776, 0x000067D9, 0x00006494, 0x0000643B, 0x000065CA, 0x00006565
};
uint32_t update_crc32_normal(const uint32_t *table, uint32_t crc, const char c );
uint32_t update_crc32_xfer( uint32_t crc, const char c );
uint32_t update_crc32_xfer_int( uint32_t crc, const int c);
uint32_t update_crc32_xfer_short( uint32_t crc, const short c);


//
// here we go!
//
int main( void )
{
    mled2=1; // turn on startup led
    
    // Added by Stuart
    // Turn on all power
    // Note that zero means "on"
    turn_on_system=0;
    turn_on_amps=0;
    // End added by Stuart
    
    // block (thermal) triggers during configuration
    enableThermTrig       = 0;
    ADC_CS                = 1;
    DoNotRestartAllClocks = 1;
    forceTrigger          = 0;
    wait_ms(20);
    
    // set up serial-usb port
    cpu.baud( 230400 );
    cpu.format( 8, Serial::None, 1 );
    cpu.txBufferFlush();
    cpu.rxBufferFlush();
        
    gForceTicker.detach();
    gFirstEvt = true;
    
    ClearConfig();
    
    spi.frequency( 10000000 );  // Max is 12.5 MHz
    
    // we're alive. send handshake to CPU
    WriteCharToCPU(kOKFlag);
    
    // wait 10 mins for handshake from CPU
    const bool gotcpu = WaitForCPU(kOKFlag,600000);
    
    // Receive config (patterns, DAC values, etc) from CPU 
    if (gotcpu) {
        
        const bool configIncoming = WaitForCPU(kConfigFlag, 20);
        if (configIncoming) {
            // get config
            GetConfigFromCPU();
            // pass config to FPGA
            SetConfigVals();
            // configs set. let CPU know.
            WriteCharToCPU(kOKFlag);
        }
        
    }
    
    spi.format( 16, 1 ); // change to data readout format
    spi.frequency( 10000000 );
    mled2=0; // turn off startup led
    
    // force a trigger every dForceTrigPeriod seconds
    gForceTicker.attach(&procForceTrigger, dForceTrigPeriod);
    
    // the main event loop. wait for triggers in SendClock
    while( true )
    {
        // in here, we wait for triggers from the MB-FPGA
        mled4 = !mled4;    // toggle event led
        lockRegisters = 0; // allow data to come from DFPGA
        WaitTrigAndSendClock( gFirstEvt );
        lockRegisters = 1; // block registers during readout

        // got trigger. read data from FPGA
        ReadAllRegisters();
        dMbedEvtTime = time(0);
        
        /*
        // TODO: Enable uSD.
        // Send data to microSD
        SendToSD( );
        */
    
        // Send data to CPU, calc CRC
        if (gotcpu) {
            bool nok = true;
            for (int tries=0; nok && tries<1; tries++) {
                SendEventToCPU( (tries==0) );
                // TODO: upgrade to receive & compare checksum of data from CPU ?
                nok = !(WaitForCPU(kOKFlag,500)); // nok = true if timed out
            }
        }
        
        // TODO:  Restart FPGAs and ATWDs ?
        
        gFirstEvt=false;
    }    
    return 0;
}

void procForceTrigger() {
    if (gReadingOut==false) {
        forceTrigger = 1;     // force a trigger
        dTrigBits   |= BIT(kForceTrigBit);
    }
}

//
// readout functions
//
void WaitTrigAndSendClock( const bool firstEvt )
{
    
    if (firstEvt==false) {
        DoNotRestartAllClocks    = 0;
        wait_us(1);
        DoNotRestartAllClocks    = 1;
        mled3 = !mled3; // toggle send clock led
    }
    
    //
    // wait for a trigger here.
    //
    gReadingOut = false; // this will allow forced triggers (see procForceTrigger())
    while ( a_sf_clk == 1 );
    forceTrigger=0;   // necessary for forced triggers, harmless for other triggers
    gReadingOut=true; // disallow new forced triggers
    
    // TODO: what if some card (set of channels) doesn't respond?
    // currently, will wait forever?
    // alos, if ch1 is dead, will wait forever (due to FPGA code)
    
    mled1=1; // turn on send clock led
    
    for( int i = 0; i < kNsamps; i++ )
    {
        if( a_sf_clk == 1 )
        {
            if( i == 0 )
                wait_us( 0.4 );

            ADC_CS = 0;
            spi.write( 0x00 );
            ADC_CS = 1;
        }
        else
            i--;
    }
    
        
    mled1=0;
}

void ReadAllRegisters() {
    for( int i = 0; i < kNchans; i++ )
    {
        ReadRegister( i, &(dEvent[i][0]) ); 
    }
}

void ReadRegister(const unsigned char chan, short* dev) {

    // Pick which register to read.
    SetChanNumBits(chan, &selCardHiBit, &selCardLoBit);

    for( int i = 0; i < kNsamps; i++, dev++ )
    {        
        *dev = spi.write(0x00) >> 1;
    }
    
}

void SendEventToCPU( const bool calcCRC )
{
    
    dCRC32 = 0ul;
    
    // send Mbed time
    WaitCPUWriteable(kWriteCPUWait);
    WriteIntToCPU(dMbedEvtTime);
    
    // write trigger bit word
    WaitCPUWriteable(kWriteCPUWait);
    WriteShortToCPU(dTrigBits);
    
    // write ADC values
    for (int i=0; i<kNchans; i++) {
        WaitCPUWriteable(kWriteCPUWait);
        for (int j=0; j<kNsamps; j++) {
            const short smp = dEvent[i][j];
//            WaitCPUWriteable(kWriteCPUWait);
            WriteShortToCPU(smp);
            if (calcCRC) {
                dCRC32 = update_crc32_xfer_short(dCRC32, smp);
            }
        }
    }
    
    // send the CRC
    WaitCPUWriteable(kWriteCPUWait);
    WriteIntToCPU(dCRC32);
    
    /*
    cpu.printf(">>> ON MBED <<<\n");
    for (int i=0; i<kNchans; i++) {
        for (int j=0; j<kNsamps; j++) {
            const short smp = dEvent[i][j];
            cpu.printf("%hd ",smp);
        }
    }
    cpu.printf("\n>>>>>>>><<<<<<<\n/");
    */
    
    ClearEvent();

    // TODO: do we need a wait here?
    
}

void ClearEvent() {
    for (int i=0; i<kNchans; i++) {
        for (int j=0; j<kNsamps; j++) {
            dEvent[i][j] = 0;
        }
    }
    
    dTrigBits=0;
}


//
// config functions
//

void ClearConfig() {
    for (int i=0; i<kNchans; i++) {
        for (int j=0; j<kNfpgaDacs; j++) {
            dDAC[i][j] = kDefFpgaDac;
        }
    }
    for (int k=0; k<kNplas; k++) {
        dPLA[k] = kDefPlaVal;
    }
}

void GetConfigFromCPU()
{
    mled3=1;
    static const int timeOut = 20;       // 20 ms

    Timer timer;
    timer.reset();
    timer.start();

    bool has_data = cpu.readable();

    while( !has_data && (timer.read_ms() < timeOut) )
    {        
        wait_ms( 1 );

        has_data = cpu.readable( );
    }
    
    if( has_data )
    {
        
        // get the cpu time, an integer
        dCpuConfTime = ReadIntFromCPU();
        //cpu.printf("got cputime=[%d]/",dCpuConfTime);
        set_time( dCpuConfTime );
        
        // get DAC values
        for (int i=0; i<kNchans; i++) {
            for (int j=0; j<kNfpgaDacs; j++) {
                dDAC[i][j] = ReadShortFromCPU();
                //cpu.printf("got dac=[%hd] ", dDAC[i][j]);
            }
        }
        //cpu.printf("/");
        
        // get PLA values
        for (int vi=0; vi<kNplas; vi++) {
            dPLA[vi] = ReadShortFromCPU();
            //cpu.printf("got pla=[%#hx] ", dPLA[vi]);
        }
        //cpu.printf("/");
        
        // get MajLog selection
        dNumCardsMajLog = ReadCharFromCPU();
        //cpu.printf("got NumMajLogic=%d/",dNumCardsMajLog);
        
        // get thermal trigger enabled
        dEnableThermTrig = ReadCharFromCPU();
        //cpu.printf("got therm trig enabled = %s/",dEnableThermTrig?"true":"false");
        
        // get force trigger period
        dForceTrigPeriod = ReadIntFromCPU();
        //cpu.printf("got force trig period = %d/",dForceTrigPeriod);
        
    }

    timer.stop();
    mled3=0;
}

void SetConfigVals() {
    
    // DAC values
    //
    // first 12 bits = DAC value
    // next 2 bits = DAC ID
    // last 2 bits = dFPGA ID
    spi.format( 16, 0 ); // change mode for DAC & PLA value setting
    spi.frequency( 10000000 );
    MajLogHiBit=1;
    MajLogLoBit=1;
    enableThermTrig=0;
    
    // Set PLA value(s)
    // TODO: send multiple values when FPGA code is ready for it
    // TODO: uncomment when using new version of FPGA code
    
    PLA_cs=1;
    wait(5); // remove
    for (int pi=0; pi<kNplas; pi++) {
        spi.write(dPLA[pi]);
    }
    wait(3);
    PLA_cs=0;
    
    wait(1); // remove
    
    // Follow "gray encoding" which means only 1 bit
    // can change at a time (of the last 4 bits). So even tho
    // the card/dac# is encoded, the order is also important
    // 0000 (dac0,card0), 0001 (dac0,card1), 0011 (dac0,card3), 0010 (dac0,card2),
    // 0110 (dac1,card2), 0111 (dac1,card3), 0101 (dac1,card1), etc.
    // This improved reliability.
    int dv=0;
    for (uint8_t i=0, gri=0; i<kTotDacs; i++) {
        // get the gray-codes for this iteration
        gri = binToGray(i);
        
        // build bit word
        dv   = static_cast<int>(dDAC[gri & 0x0003u][gri >> 2u]);
        dv <<= 4u;
        dv  |= gri;
        
        // send to FPGA
        start_fpga=1;
        wait(5); // remove
        spi.write(dv);
        wait(3); // remove
        start_fpga=0;
        //wait(1);
    }
        
    wait_ms(20);
    
    // Majority Logic Trigger selection (# of cards)
    const unsigned char mltword = dNumCardsMajLog - 1;
    SetChanNumBits(mltword, &MajLogHiBit, &MajLogLoBit);
    
    // Enable thermal trigger?
    enableThermTrig = dEnableThermTrig;
    
}



//
// CPU interaction functions
//

bool WaitForCPU(const char handshake, const int waitMS) {
    static Timer timer;
    timer.reset();
    timer.start();
    // wait for handshake from CPU
    while ( timer.read_ms()<waitMS ) { 
        if ( ReadCharFromCPU()==handshake) {
            return true;
        }
    }
    return false; // timeout
}

bool  WaitCPUWriteable(const int timeoutUS) {
    static Timer timr;
    timr.reset();
    timr.start();
    
    bool cpuRdy = cpu.writeable();

    while( !cpuRdy && (timr.read_us() < timeoutUS) )
    {
        //mled2=1; // TODO: remove
        wait_us( 1 );
        cpuRdy = cpu.writeable( );
    }
    timr.stop( );
    
    //mled2=0;
    
    return cpuRdy;
}

int ReadIntFromCPU() {
    for (int i=0; i<sizeof(int); i++) {
        tmp.c[i] = ReadCharFromCPU();
    }
    return tmp.i;
}

short ReadShortFromCPU() {
    for (int i=0; i<sizeof(short); i++) {
        tmp.c[i] = ReadCharFromCPU();
    }
    return tmp.s[0];
}

int WriteIntToCPU(const int a) {
    tmp.i = a;
    int b=0;
    for (int j=0; j<sizeof(int); j++) {
        b += WriteCharToCPU(tmp.c[j]);
    }
    return b;
}

int WriteShortToCPU(const short a) {
    tmp.s[0] = a;
    int b=0;
    for (int j=0; j<sizeof(short); j++) {
        b += WriteCharToCPU(tmp.c[j]);
    }
    return b;
}


//
// CRC functions
//
uint32_t update_crc32_normal(const uint32_t *table, uint32_t crc, const char c ) {
    uint32_t long_c;

    long_c = 0x000000ffL & (uint32_t) c;

    return (crc << 8) ^ table[((crc >> 24) ^ long_c) & 0xff];
}

uint32_t update_crc32_xfer( uint32_t crc, const char c ) {
    return update_crc32_normal(crc_tabxfer_normal,crc,c);
}

uint32_t update_crc32_xfer_int( uint32_t crc, const int c) {
    tmp.i = c;
    for (int i=0; i<sizeof(int); i++) {
        crc = update_crc32_xfer(crc, tmp.c[i]);
    }
    return crc;
}

uint32_t update_crc32_xfer_short( uint32_t crc, const short c) {
    tmp.s[0] = c;
    for (int i=0; i<sizeof(short); i++) {
        crc = update_crc32_xfer(crc, tmp.c[i]);
    }
    return crc;
}
