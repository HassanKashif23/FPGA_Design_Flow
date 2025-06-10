# FPGA_Design_Flow
A complete FPGA Design Flow using open source tool Yosys and NextPnR.
Verilog RTL for a Serial Adder using Moore FSM (which is an adder having 2 input sequences which adds into an output sequence and carry is handled internally).
Simulated and verified the Hardware using Verilog based Testbench covering test cases thoroughly.

Performed complete synthesis performing parsing, AST representation, Elaboration and optimization using Yosys — which converts high-level hardware design (Verilog) into a lower-level gate-level Net List.
Carried out placement and routing with Nextpnr — this step figures out where each logic gate or flip-flop goes on the FPGA chip, BRAM and DSP slice utilization (placement) using constraint file, and how they’re connected (routing)

