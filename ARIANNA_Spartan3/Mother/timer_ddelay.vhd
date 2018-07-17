--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:29:05 09/24/2011
-- Design Name:   
-- Module Name:   C:/Users/Liang/Desktop/store_in_shiftreg2/timer_ddelay.vhd
-- Project Name:  store_in_shiftreg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: timer
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
 
ENTITY timer_ddelay IS
END timer_ddelay;
 
ARCHITECTURE behavior OF timer_ddelay IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT timer
    PORT(
         clk : IN  std_logic;
         ex_trigger_in : IN  std_logic;
         ex_trigger_out_PIN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ex_trigger_in : std_logic := '0';

 	--Outputs
   signal ex_trigger_out_PIN : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: timer PORT MAP (
          clk => clk,
          ex_trigger_in => ex_trigger_in,
          ex_trigger_out_PIN => ex_trigger_out_PIN
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      ex_trigger_in<='1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
