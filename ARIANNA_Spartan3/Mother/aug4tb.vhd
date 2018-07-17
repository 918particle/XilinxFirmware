--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:36:23 08/05/2011
-- Design Name:   
-- Module Name:   C:/Documents and Settings/MAHSHID/Desktop/Code/aug4fpga/aug4tb.vhd
-- Project Name:  aug4fpga
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fpga
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY aug4tb IS
END aug4tb;
 
ARCHITECTURE behavior OF aug4tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fpga
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         cry_clk : OUT  std_logic;
         adc_mcs : IN  std_logic;
         adc_dcs : OUT  std_logic;
         adc_msck : IN  std_logic;
         adc_dsck : OUT  std_logic;
         clk_fdsf : IN  std_logic;
         clk_sdsf : IN  std_logic;
         clk_msf : OUT  std_logic;
         rst_fdsf : IN  std_logic;
         rst_sdsf : IN  std_logic;
         rst_msf : OUT  std_logic;
         restart_mclk : IN  std_logic;
         restart_dclk : OUT  std_logic;
         fflag : OUT  std_logic;			
         sflag : OUT  std_logic;			
         sel : IN  std_logic;
			finish : OUT std_logic; 
         clk_msck : IN  std_logic;
         adc_fdmiso : IN  std_logic;
         adc_sdmiso : IN  std_logic;
         miso : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal adc_mcs : std_logic := '0';
   signal adc_msck : std_logic := '0';
   signal clk_fdsf : std_logic := '0';
   signal clk_sdsf : std_logic := '0';
   signal rst_fdsf : std_logic := '0';
   signal rst_sdsf : std_logic := '0';
   signal restart_mclk : std_logic := '0';
   signal sel : std_logic := '0';
   signal clk_msck : std_logic := '0';
   signal adc_fdmiso : std_logic := '0';
   signal adc_sdmiso : std_logic := '0';

 	--Outputs
   signal fflag : std_logic;
   signal sflag : std_logic;	
   signal cry_clk : std_logic;
   signal adc_dcs : std_logic;
   signal adc_dsck : std_logic;
   signal finish : std_logic;	
   signal clk_msf : std_logic;
   signal rst_msf : std_logic;
   signal restart_dclk : std_logic;
   signal miso : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant cry_clk_period : time := 10 ns;
   constant clk_msck_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fpga PORT MAP (
          reset => reset,
          clk => clk,
          cry_clk => cry_clk,
          adc_mcs => adc_mcs,
          adc_dcs => adc_dcs,
          adc_msck => adc_msck,
          adc_dsck => adc_dsck,
          clk_fdsf => clk_fdsf,
          clk_sdsf => clk_sdsf,
          clk_msf => clk_msf,
          rst_fdsf => rst_fdsf,
          rst_sdsf => rst_sdsf,
          rst_msf => rst_msf,
          restart_mclk => restart_mclk,
          restart_dclk => restart_dclk,
			 fflag => fflag,
			 sflag => sflag,
          sel => sel,
			 finish => finish,
          clk_msck => clk_msck,
          adc_fdmiso => adc_fdmiso,
          adc_sdmiso => adc_sdmiso,
          miso => miso
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   cry_clk_process :process
   begin
		cry_clk <= '0';
		wait for cry_clk_period/2;
		cry_clk <= '1';
		wait for cry_clk_period/2;
   end process;
 
 
   clk_msck_process :process
   begin
		clk_msck <= '0';
		wait for clk_msck_period/2;
		clk_msck <= '1';
		wait for clk_msck_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		adc_fdmiso <= '1';
		adc_sdmiso <= '0';
		sel <= '0';
		adc_mcs <= '0';
		rst_fdsf <= '1';
		rst_sdsf <= '0';
		restart_mclk <= '1';
		clk_sdsf <= '1';
		clk_fdsf <= '1';		
      wait for clk_msck_period*16;	
		sel <= '1';		
		adc_fdmiso <= '0';
		adc_sdmiso <= '1';	
		adc_mcs <= '0';
		rst_fdsf <= '0';
		rst_sdsf <= '0';
		clk_sdsf <= '1';
		clk_fdsf <= '0';			
      wait for clk_msck_period*16;
		sel <= '0';		
		adc_fdmiso <= '1';	
		adc_sdmiso <= '0';	
		clk_sdsf <= '1';
		clk_fdsf <= '1';			
      wait for clk_msck_period*16;
      -- insert stimulus here 

      wait;
   end process;

END;
