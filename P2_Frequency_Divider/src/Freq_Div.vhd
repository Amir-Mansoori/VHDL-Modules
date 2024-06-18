----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/18/2024 10:09:42 PM
-- Design Name: 
-- Module Name: Freq_Div - Behavioral
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

entity Freq_Div is
    Port ( clk : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC);
end Freq_Div;

architecture Behavioral of Freq_Div is

SIGNAL clk_Div: STD_LOGIC_VECTOR(3 downto 0);

component DFF_NOT is

Port ( clk : in STD_LOGIC;
           Q : out STD_LOGIC);

end component;

component mux_4_1 is
 Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC);
end component;

begin

u1: DFF_NOT Port map (

    clk => clk,
    Q  => clk_Div(0)

);

u2: DFF_NOT Port map (

    clk => clk_Div(0),
    Q  => clk_Div(1)

);

u3: DFF_NOT Port map (

    clk => clk_Div(1),
    Q  => clk_Div(2)

);

u4: DFF_NOT Port map (

    clk => clk_Div(2),
    Q  => clk_Div(3)

);

u5: mux_4_1 Port map (

    I => clk_Div,
    sel => Sel,
    O => Q
);



end Behavioral;
