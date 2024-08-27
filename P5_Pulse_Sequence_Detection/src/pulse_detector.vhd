----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/03/2024 11:27:42 AM
-- Design Name: 
-- Module Name: pulse_detector - Behavioral
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

entity pulse_detector is
    Port ( clk : in STD_LOGIC;
           pulse_in : in STD_LOGIC;
           out_LED : out STD_LOGIC);
end pulse_detector;
--- Hw measurement using ARM -> PL clk freq is 50286482 Hz (50 MHz) instead of 100 MHz 
architecture Behavioral of pulse_detector is
constant CNT_150_MIN : integer := 14925000; --15000000 -0.5 %
constant CNT_150_MAX : integer := 15075000; --15000000 +0.5 %
constant CNT_180_MIN : integer := 17910000; --18000000 - 0.5 %
constant CNT_180_MAX : integer := 18090000; --18000000 + 0.5 %
constant CNT_50_MIN : integer := 4975000;   -- 5000000 - 0.5 %
constant CNT_50_MAX : integer := 5025000;   -- 5000000 + 0.5 %
constant CNT_1S : integer := 100000000;  --freq = 50286482 Hz
type state is (wait_1, S_150, s_180, s_50, LED_ON);

signal current, nxt: state := wait_1;
signal cnt: integer range 0 to 50000:=0;

begin


p1: process(nxt)
begin
    current <= nxt;
end process;

p2: process(clk)
begin
    if(rising_edge(clk)) then

        case current is
        when wait_1 =>
            out_LED <= '0';
            if(pulse_in='1') then
                nxt <= S_150;
            else
                nxt <= wait_1;
            end if;            
        
        when S_150 =>
            if(pulse_in = '1' AND (cnt < CNT_150_MAX) ) then
                cnt<=cnt+1;
            elsif(pulse_in = '0') then
                if((cnt < CNT_150_MAX) AND (cnt > CNT_150_MIN)) then
                    cnt <= 0;
                    nxt <= S_180;                    
                else
                    cnt <= 0;
                    nxt <= wait_1;
                end if;
            end if;
        when S_180 =>
            if(pulse_in = '0' AND (cnt < CNT_180_MAX) ) then
                cnt <= cnt + 1;
            elsif(pulse_in = '1') then
                if((cnt < CNT_180_MAX) AND (cnt > CNT_180_MIN)) then
                    cnt <= 0;
                    nxt <= S_50;                    
                else
                    cnt <= 0;
                    nxt <= S_150;
                end if;
            end if;
        when S_50 =>
            if(pulse_in = '1' AND (cnt < CNT_50_MAX) ) then
                cnt<=cnt+1;
            elsif(pulse_in = '0') then
                if((cnt < CNT_50_MAX) AND (cnt > CNT_50_MIN)) then
                    cnt <= 0;
                    nxt <= LED_ON;                    
                else
                    cnt <= 0;
                    nxt <= wait_1;
                end if;
            end if;        
        when LED_ON =>
            out_LED <= '1';
            cnt <= cnt + 1;
            if(cnt=CNT_1S) then
                out_LED <= '0';
                cnt <= 0;
                nxt <= wait_1;
            end if;
                        
        end case;
    end if;
end process;


end Behavioral;
