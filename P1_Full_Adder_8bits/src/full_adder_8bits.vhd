----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/18/2024 08:22:57 PM
-- Design Name: 
-- Module Name: full_adder_8bits - Behavioral
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

entity full_adder_8bits is
   Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end full_adder_8bits;

architecture Behavioral of full_adder_8bits is

component full_adder_4bits is 

    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);

end component;

SIGNAL csig : STD_LOGIC;
begin

c1: full_adder_4bits Port map (

    a => a(3 downto 0),
    b => b(3 downto 0),
    c => c,
    s => s(3 downto 0),
    cout => csig
);

c2: full_adder_4bits Port map (

    a => a(7 downto 4),
    b => b(7 downto 4),
    c => csig,
    s => s(7 downto 4),
    cout => cout
);


end Behavioral;
