----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/18/2024 10:21:10 PM
-- Design Name: 
-- Module Name: prescaler_tb - Behavioral
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

entity prescaler2_tb is
--  Port ( );
end prescaler2_tb;

architecture Behavioral of prescaler2_tb is

component Freq_Div2 is
    Port ( clk : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC);
end component;

constant clk_period : time := 10 ns;
Signal clk: STD_LOGIC := '0';
Signal Q: STD_LOGIC;
Signal Sel: STD_LOGIC_VECTOR(1 downto 0):=(others => '0');

begin


u1: Freq_Div2 Port map(

    clk => clk,
    Sel => Sel,
    Q => Q

);

clk_proc: process
begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;

stim_proc: process
begin
    --hold reset state for 100 ns
    wait for 100 ns;
    wait for clk_period*10;
    
    -- insert stimulus here
    sel <= "00";
    wait for 40 ns;
    
    sel <= "01";
    wait for 100 ns;
    
    sel <= "10";
    wait for 200 ns;
    
    sel <= "11";
    wait for 100 ns;
    
    wait;
end process;


end Behavioral;
