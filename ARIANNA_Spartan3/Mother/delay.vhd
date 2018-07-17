----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:11 11/26/2010 
-- Design Name: 
-- Module Name:    timer - Behavioral 
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

Library UNISIM;
use UNISIM.vcomponents.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
      port (clk : in  STD_LOGIC;
		      ex_trigger_in : in  STD_LOGIC;
		      ex_trigger_out_PIN: out  STD_LOGIC
		 );

end timer;

architecture Behavioral of timer is
signal timer_count1 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
signal timer_count2 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";

signal counter : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal ex_trigger_out:  STD_LOGIC:= '0';
signal ex_trigger_handshake:  STD_LOGIC:= '0';
begin
     
      process(clk)
		 begin
		 if (clk'event and clk='1') then
		   if(ex_trigger_in='1') then
			  ex_trigger_handshake<='1';
			end if;
		   if(ex_trigger_out='1' and ex_trigger_in='0') then
			 if(counter<="1000") then
			   counter<=counter+1;
			   ex_trigger_handshake<=ex_trigger_handshake;
			 else
			   ex_trigger_handshake<='0';
			end if;
		  end if;
		 end if;
		end process;

      process(clk)
		 begin
		 if (clk'event and clk='1') then
		   if(ex_trigger_handshake='1') then
		    if(timer_count1<"000000000000001") then
			    
            if(timer_count2<"000000000111") then 	
              timer_count2<=timer_count2+1;
            else
				  timer_count1<=timer_count1+1;			   			
				  timer_count2<="000000000000";
			   end if;
		    else
			  	timer_count1<="000000000000000";
				 ex_trigger_out<='1';
          end if;
			else
			  timer_count1<="000000000000000";
			  timer_count2<="000000000000";
			  ex_trigger_out<='0';
        end if;
		  end if;
		 end process; 
		 		 
       ex_trigger_out_PIN<=ex_trigger_out;
		 
		 
end Behavioral;


















