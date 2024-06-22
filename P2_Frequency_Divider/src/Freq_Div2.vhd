----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2024 10:15:37 AM
-- Design Name: 
-- Module Name: Freq_Div2 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Freq_Div2 is
 Port ( clk : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC);
end Freq_Div2;

architecture Behavioral of Freq_Div2 is
SIGNAL cnt: STD_LOGIC_VECTOR(3 downto 0) := (OTHERS => '0');
begin

process(clk)
begin
if(rising_edge(clk)) then
    cnt <= cnt +1;
end if;
end process;

with Sel select
    Q <=    cnt(0) when "00",   
            cnt(1) when "01",
            cnt(2) when "10",
            cnt(3) when others;        

end Behavioral;
