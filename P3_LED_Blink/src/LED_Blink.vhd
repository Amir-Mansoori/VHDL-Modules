----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2024 10:41:06 AM
-- Design Name: 
-- Module Name: LED_Blink - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_Blink is
    Port ( clk : in STD_LOGIC;
           LED : out STD_LOGIC);
end LED_Blink;

-- Blinking LED every 0.5 seconds
-- Zynq PL frequency is set to 100 MHz
-- 1 second = 100,000,000
-- 0.5 second = 50,000,000

architecture Behavioral of LED_Blink is
signal cnt : integer range 0 to 50000000 := 0;
signal sled: std_logic:='0';
begin
process(clk)
begin

if(rising_edge(clk)) then
    cnt <= cnt + 1;
    if(cnt = 49999999) then
        cnt<=0;
        sled <= NOT sled;
    end if;
end if;

end process;

LED <= sled;

end Behavioral;
