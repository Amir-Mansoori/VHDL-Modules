----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/18/2024 08:32:20 PM
-- Design Name: 
-- Module Name: full_adder_8bits_tb - Behavioral
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

entity full_adder_8bits_tb is
--  Port ( );
end full_adder_8bits_tb;

architecture Behavioral of full_adder_8bits_tb is


component full_adder_8bits is
Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end component;

SIGNAL a : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL b : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL c : STD_LOGIC;
SIGNAL s : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL cout : STD_LOGIC;

begin

g1: full_adder_8bits Port map
(

a => a,
b => b,
c => c,
s => s,
cout => cout

);

process
begin
a <= x"01";
b <= x"02";
c <= '0';
wait for 10 ns;
a <= x"05";
b <= x"07";
c <= '1';
wait for 10 ns;
a <= x"10";
b <= x"20";
c <= '1';
wait for 10 ns;
a <= x"AB";
b <= x"CD";
c <= '0';
wait for 10 ns;
a <= x"80";
b <= x"90";
c <= '1';

end process;


end Behavioral;
