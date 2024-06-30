----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/30/2024 11:11:35 PM
-- Design Name: 
-- Module Name: freq_meter_new_tb - Behavioral
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

entity freq_meter_tb is
--  Port ( );
end freq_meter_tb;

architecture Behavioral of freq_meter_tb is
component freq_meter is 
Port ( clk : in STD_LOGIC;
           freq : in STD_LOGIC;
           en : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (15 downto 0));

end component;

signal clk: STD_LOGIC;
signal freq: STD_LOGIC;
signal  en : STD_LOGIC;
signal count : STD_LOGIC_VECTOR (15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant freq_period : time := 10 ms;

begin

u1: freq_meter port map (

clk => clk,
freq => freq,
en => en,
count => count
);

clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	freq_process :process
   begin
		freq <= '0';
		wait for freq_period/2;
		freq <= '1';
		wait for freq_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

end Behavioral;
