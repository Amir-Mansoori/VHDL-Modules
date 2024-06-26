# LED Blink 
## LED_Blink.vhd
In this section, we want to turn on an LED in ZedBoard every 0.5 seconds.
The LED that we use is connected to the pin T22 from the Zynq-SoC and it must be included in the constraint file (physical.xdc).
The block diagram of the design is shown bellow:

<img align="center" src="https://github.com/Amir-Mansoori/VHDL-Modules/blob/main/Images/LED.png" width="500" height="400">

Note that we used the clk frequency of 100 MHZ generated by Zynq for the PL, so to blink LED every 0.5 seconds, we need a counter to count 50,000,000 positive clk edges.

## LED_Blink2.vhd
In this section we implement the previous blinking LED program with the addition of variable ON time (TON).

The LED is turned ON for TON seconds and turns of for (1-TON) seconds.
TON is increased by 0.1 seconds every 2 seconds.
Therefore, the LED blinks 2 times with the same TON, and then TON is increased by 0.1 seconds.
