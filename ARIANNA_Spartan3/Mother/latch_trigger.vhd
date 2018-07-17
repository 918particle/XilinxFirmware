----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:53 11/06/2011 
-- Design Name: 
-- Module Name:    latch_trigger - Behavioral 
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

entity latch_trigger is
port(
	sh_tri : in std_logic; 
	clk : in std_logic;
	reset : in std_logic;
	th_tri : out std_logic
);
end latch_trigger;

architecture Behavioral of latch_trigger is
signal th_tri_out : std_logic := '0'; 
begin

	latch : process (clk)
	begin
		if (rising_edge (clk)) then 
			--if (sh_tri = '1') then 
				if (reset = '1') then 
					if (sh_tri = '1') then
						th_tri_out <= '1';
					end if;
				else 
					th_tri_out <= '0';	
				end if;
		end if;
	end process; 
	
	th_tri <= th_tri_out;
	
end Behavioral;

