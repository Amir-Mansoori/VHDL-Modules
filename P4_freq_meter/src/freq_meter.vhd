----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/30/2024 09:16:33 PM
-- Design Name: 
-- Module Name: freq_meter - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_meter_0 is
    Port ( clk : in STD_LOGIC;
           freq : in STD_LOGIC;
           en : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (15 downto 0));
end freq_meter_0;

architecture Behavioral of freq_meter_0 is
signal cnt_1s: integer range 0 to 100000000:=0;
signal tmp: STD_LOGIC_VECTOR(15 downto 0):=x"0000";
signal flag_1s: STD_LOGIC:='0';
signal flag_DONE: STD_LOGIC:='0';
signal sig_en: STD_LOGIC:='0';
begin

p1_freq_count: process(freq)

    begin
    if(rising_edge(freq)) then
        flag_DONE <= '0';            
        tmp<=tmp+1;     
        if(flag_1s = '1') then
            tmp <= (others => '0');
            flag_DONE <= '1';
        end if;     
     end if; 

    end process;

p2_count_1s: process(clk)
    begin
    if(rising_edge(clk)) then
        sig_en <= '0';
        cnt_1s<=cnt_1s+1;
        if(cnt_1s = 99999999) then
           sig_en <= '1';
           flag_1s<= '1'; 
           cnt_1s<=0;
        end if;
        if(flag_DONE='1') then
            flag_1s<='0';
        end if;
    end if;
    
    end process;

en <= sig_en;
count <= tmp;

end Behavioral;
