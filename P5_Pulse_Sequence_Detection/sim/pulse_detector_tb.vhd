----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/03/2024 12:14:02 PM
-- Design Name: 
-- Module Name: pulse_detector_tb - Behavioral
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

entity pulse_detector_tb is
--  Port ( );
end pulse_detector_tb;

architecture Behavioral of pulse_detector_tb is

   -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pulse_detector
    PORT(
         clk : IN  std_logic;
         pulse_in : IN  std_logic;
         out_LED : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal input : std_logic := '0';

 	--Outputs
   signal Out_LED : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pulse_detector PORT MAP (
          clk => clk,
          pulse_in => input,
          out_LED => Out_LED
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
      
      wait for 3 ns; -- making it asynchronous

      -- insert stimulus here 
		
		input<='1';
		wait for 150 ms;
		
		input<='0';
		wait for 180 ms;

		input<='1';
		wait for 50 ms;		

		input<='0';
		wait for 1100 ms;

		input<='1';
		wait for 200 ms;		
		input<='0';
		wait for 150 ms;		
		
		input<='1';
		wait for 150 ms;		
		
		input<='0';
		wait for 180 ms;		
		
		input<='1';
		wait for 50 ms;
		
		input<='0';
		wait for 1100 ms;
				
		input<='1';
		wait for 150 ms;

		input<='0';
		wait for 180 ms;		

		input<='1';
		wait for 50 ms;		
		
		input<='0';
		wait for 1100 ms;
		
		input<='1';
		wait for 180 ms;

		input<='0';
		wait for 180 ms;		

		input<='1';
		wait for 100 ms;		
		
		input<='0';
		wait for 10 ms;

      wait;
   end process;



end Behavioral;
