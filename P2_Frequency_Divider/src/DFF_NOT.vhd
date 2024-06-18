----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/18/2024 09:35:57 PM
-- Design Name: 
-- Module Name: DFF_NOT - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF_NOT is
    Port ( clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end DFF_NOT;

architecture Behavioral of DFF_NOT is

SIGNAL D: STD_LOGIC := '0';

begin


process(clk)
begin

if(rising_edge(clk)) then
    D <= NOT (D);      
end if;

end process;

Q <= D;

end Behavioral;
