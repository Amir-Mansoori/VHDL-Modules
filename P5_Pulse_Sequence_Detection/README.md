# Pulse Sequence Detection
In this section we want to detect a sequence of pulses that are sent from the ARM processing system of the Zynq SoC to the Programmable Logic.
The following shows the corresponding state machine of the system. If the PL detects the following pulses, it turns on an LED for 1 second:

1. Detect '1' for 150 ms
2. Detect '0' for 180 ms
3. Detect '1' for 50 ms

At the end, it returns to the initial state (wait-1).

<img align="center" src="https://github.com/Amir-Mansoori/VHDL-Modules/blob/main/Images/SM_Pulse_Seq_Det.png" width="500" height="400">
