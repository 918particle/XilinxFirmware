----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Mahshid
-- 
-- Create Date:    17:50:22 06/27/2012 
-- Design Name: 
-- Module Name:    DataOut - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: send data out when is asked to solve conjunction between SD and FPGA 
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


entity DataOut is
	port(
	sel : in std_logic;
	Idataout : in std_logic;
	Odataout : out std_logic
	);
end DataOut;

architecture Behavioral of DataOut is
begin
	Odataout <= Idataout when (sel = '1') else 'Z';
end Behavioral;

