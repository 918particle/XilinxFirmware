--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:33:30 08/10/2011
-- Design Name:   
-- Module Name:   C:/Users/Liang/Desktop/mahshid/au10fpga/ntb.vhd
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
 
ENTITY ntb IS
END ntb;
 
ARCHITECTURE behavior OF ntb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fpga
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         cry_clk : OUT  std_logic;
         adc_mcs : IN  std_logic;
         adc_dcs : OUT  std_logic;
         clk_adc_msck : IN  std_logic;
         clk_adc_dsck : OUT  std_logic;
         clk_fdsf : IN  std_logic;
         clk_sdsf : IN  std_logic;
         clk_msf : OUT  std_logic;
         rst_fdsf : IN  std_logic;
         rst_sdsf : IN  std_logic;
         rst_msf : OUT  std_logic;
         START_FPGA_M : IN  std_logic;
         START_FPGA_D : OUT  std_logic;
         restart_mclk : IN  std_logic;
         restart_dclk : OUT  std_logic;
         fflag : OUT  std_logic;
         sflag : OUT  std_logic;
         sel : IN  std_logic;
         clk_msck : IN  std_logic;
         adc_fdmiso : IN  std_logic;
         adc_sdmiso : IN  std_logic;
         --regfdc : OUT  std_logic;
         regfdd : OUT  std_logic;			
         regfdcs : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal adc_mcs : std_logic := '0';
   signal clk_adc_msck : std_logic := '0';
   signal clk_fdsf : std_logic := '0';
   signal clk_sdsf : std_logic := '0';
   signal rst_fdsf : std_logic := '0';
   signal rst_sdsf : std_logic := '0';
   signal START_FPGA_M : std_logic := '0';
   signal restart_mclk : std_logic := '0';
   signal sel : std_logic := '0';
   signal clk_msck : std_logic := '0';
   signal adc_fdmiso : std_logic := '0';
   signal adc_sdmiso : std_logic := '0';

 	--Outputs
   signal cry_clk : std_logic;
   signal adc_dcs : std_logic;
   signal clk_adc_dsck : std_logic;
   signal clk_msf : std_logic;
   signal rst_msf : std_logic;
   signal START_FPGA_D : std_logic;
   signal restart_dclk : std_logic;
   signal fflag : std_logic;
   signal sflag : std_logic;
   -- signal regfdc : std_logic;
   signal regfdd : std_logic;
   signal regfdcs : std_logic;
	

 -- Clock period definitions
 --  constant clk_period : time := 10 ns;
 --  constant cry_clk_period : time := 10 ns;
   constant clk_adc_msck_period : time := 10 ns;
   constant clk_adc_dsck_period : time := 10 ns;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fpga PORT MAP (
          reset => reset,
          clk => clk,
          cry_clk => cry_clk,
          adc_mcs => adc_mcs,
          adc_dcs => adc_dcs,
          clk_adc_msck => clk_adc_msck,
          clk_adc_dsck => clk_adc_dsck,
          clk_fdsf => clk_fdsf,
          clk_sdsf => clk_sdsf,
          clk_msf => clk_msf,
          rst_fdsf => rst_fdsf,
          rst_sdsf => rst_sdsf,
          rst_msf => rst_msf,
          START_FPGA_M => START_FPGA_M,
          START_FPGA_D => START_FPGA_D,
          restart_mclk => restart_mclk,
          restart_dclk => restart_dclk,
          fflag => fflag,
          sflag => sflag,
          sel => sel,
          clk_msck => clk_msck,
          adc_fdmiso => adc_fdmiso,
          adc_sdmiso => adc_sdmiso,
    --    regfdc => regfdc,
          regfdd => regfdd,			 
          regfdcs => regfdcs
        );

   -- Clock process definitions
 
   clk_adc_msck_process :process
   begin
		clk_adc_msck <= '0';
		wait for clk_adc_msck_period/2;
		clk_adc_msck <= '1';
		wait for clk_adc_msck_period/2;
   end process;
 
   clk_adc_dsck_process :process
   begin
		clk_adc_dsck <= '0';
		wait for clk_adc_dsck_period/2;
		clk_adc_dsck <= '1';
		wait for clk_adc_dsck_period/2;
   end process;
 
   
   -- Stimulus process
   stim_proc: process
   begin		
      --hold reset state for 100 ns.
		adc_fdmiso <= '1';
	   --adc_sdmiso <= '0';
		--sel <= '0';
		adc_mcs <= '0';
		rst_fdsf <= '1';
		rst_sdsf <= '0';
		restart_mclk <= '1';
		clk_sdsf <= '1';
		clk_fdsf <= '1';		
      wait for clk_adc_msck_period*8;	
		--sel <= '1';		
		adc_fdmiso <= '0';
		--adc_sdmiso <= '1';	
		adc_mcs <= '0';
		rst_fdsf <= '0';
		rst_sdsf <= '0';
		clk_sdsf <= '1';
		clk_fdsf <= '0';			
      wait for clk_adc_msck_period*8;
		adc_fdmiso <= '1';
	   --adc_sdmiso <= '0';
		--sel <= '0';
		adc_mcs <= '0';
		rst_fdsf <= '1';
		rst_sdsf <= '0';
		restart_mclk <= '1';
		clk_sdsf <= '1';
		clk_fdsf <= '1';		
      wait for clk_adc_msck_period*8;	
		--sel <= '1';		
		adc_fdmiso <= '0';
		--adc_sdmiso <= '1';	
		adc_mcs <= '0';
		rst_fdsf <= '0';
		rst_sdsf <= '0';
		clk_sdsf <= '1';
		clk_fdsf <= '0';			
      wait for clk_adc_msck_period*8;
      --wait;
   end process;

END;
