----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/15/2024 10:48:57 PM
-- Design Name: 
-- Module Name: full_adder_2bits - Behavioral
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

entity full_adder_4bits is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end full_adder_4bits;

architecture Behavioral of full_adder_4bits is

component full_adder is
Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal csig1, csig2, csig3 : STD_LOGIC;
begin

c1: full_adder port map(
    a => a(0),
    b => b(0),
    c => c,
    s => s(0),
    cout => csig1
);

c2: full_adder port map(
    a => a(1),
    b => b(1),
    c => csig1,
    s => s(1),
    cout => csig2 );
    
c3: full_adder port map(
    a => a(2),
    b => b(2),
    c => csig2,
    s => s(2),
    cout => csig3 );

c4: full_adder port map(
    a => a(3),
    b => b(3),
    c => csig3,
    s => s(3),
    cout => cout );

end Behavioral;
