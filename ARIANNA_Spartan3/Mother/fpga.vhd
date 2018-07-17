----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:50 08/04/2011 
-- Design Name: 
-- Module Name:    fpga - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fpga is
  port (

	clk : in std_logic;  -- from crystal
	cry_clk : out std_logic;		  -- cystal clk to daughter
 
   adc_mcs : in std_logic; 	
	adc_dcs : out std_logic; -- cs from m to d

	clk_adc_msck : in std_logic;  -- sck from mbed to f
	clk_adc_dsck : out std_logic;  -- sck from fpga to d

	clk_fdsf : in std_logic;  -- from first daughter to mbed
	clk_msf : out std_logic;  -- to mbed
	
	rst_fdsf : in std_logic; 	-- d1 to mbed
	rst_msf : out std_logic;  -- rst to mbed 

	START_FPGA_M : in std_logic; 		-- d2 to mbed
	START_FPGA_D: out std_logic;  -- rst to mbed 


	restart_mclk : in std_logic; 	-- to mbed 
	restart_dclk : out std_logic  -- from mbed to daughter 	
	

--	miso : out std_logic	  -- input data to mbed from daughters through FPGA pin 6
	

	);
end fpga;

architecture Behavioral of fpga is


begin
	      START_FPGA_D <= START_FPGA_M;
			clk_adc_dsck <= clk_adc_msck;
			cry_clk <= clk;
			clk_msf <= clk_fdsf;  	
			rst_msf <= rst_fdsf;			
		   restart_dclk <= restart_mclk;
		   adc_dcs <= adc_mcs;
end Behavioral;

