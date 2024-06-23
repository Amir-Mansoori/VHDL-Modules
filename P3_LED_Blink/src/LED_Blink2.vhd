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

-- Blinking LED: TON seconds ON , (1-TON) seconds OFF
-- TON is increased 0.1 seconds every 2 seconds => 20 seconds 
-- Zynq PL frequency is set to 100 MHz
-- 1 second = 100,000,000
-- 0.1 second = 10,000,000

architecture Behavioral of LED_Blink is
signal cnt : integer range 0 to 200000000 := 0;
signal cnt_2s : integer range 0 to 200000000 := 0;
signal TON: integer range 0 to 100000000:=0;
signal sled: std_logic:='0';
begin
p1: process(clk) -- generating clk 1 s
begin

if(rising_edge(clk)) then
    cnt <= cnt + 1;
    if(cnt = 99999999) then --- every 1 second
        cnt<=0;
        sled<='1';           
    end if;
    if(cnt = TON) then
        sled <= '0';
    end if;
end if;

end process;

p2: process(clk) -- Increasing TON in 100ms step every 1 seconds
begin

    if(rising_edge(clk)) then
    
        cnt_2s<=cnt_2s+1;
        if(cnt_2s = 199999999) then
            cnt_2s<=0;
            TON <= TON + 10000000; -- increasing TON 0.1 seconds (100 ms)
            if(TON=90000000) then -- 1 second / 0.1 second = 10 -> (10-1) * 10,000,000 = 90,000,000 
                TON <= 0;
            end if;
        end if;
    
    end if;

end process;

LED <= sled;

end Behavioral;