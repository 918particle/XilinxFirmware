----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:57 09/24/2011 
-- Design Name: 
-- Module Name:    DIVIDER - Behavioral 
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

entity DIVIDER is
        Port ( clk : in  STD_LOGIC;
		         REF_CLK : out  STD_LOGIC
				 );		  
end DIVIDER;


architecture Behavioral of DIVIDER is
signal divide_clk_count_REF: STD_LOGIC:='0';
signal REF_CLK_signal: STD_LOGIC:='1';

begin
   DIVIDE2_REF : process (clk)
     begin	  
    		if (clk'event and clk='1') then
--			if enable_handshake = '1' then
--			  if(rst_divider='0') then
			     if(divide_clk_count_REF='1') then
			        divide_clk_count_REF<=not divide_clk_count_REF;
				     REF_CLK_signal<='1';
			     elsif(divide_clk_count_REF='0') then
			        divide_clk_count_REF<=not divide_clk_count_REF;
			        REF_CLK_signal<='0';
			     else
			        divide_clk_count_REF<=not divide_clk_count_REF;
           
			     end if;
			  else
			     REF_CLK_signal<=REF_CLK_signal;
			  end if; 
			  
 --        end if;	
--	 end if;
	 end process;
	 
	 
REF_CLK <=REF_CLK_signal;

end Behavioral;

