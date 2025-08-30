# 4-Bit Adder Project

## Description
This project implements a 4-bit binary adder using Verilog. The adder takes two 4-bit inputs and produces a 5-bit output, which includes the sum and carry-out. A C++ testbench is provided to simulate and verify the functionality of the Verilog design.

## File Structure
- `adder_4bit.v` : Verilog source code for the 4-bit adder module.
- `tb_adder_4bit.cpp` : C++ testbench to simulate and verify the 4-bit adder.
- `README.md` : This file, containing project information and instructions.

## Build and Run Instructions
1. Ensure you have Verilator and a C++ compiler installed.
2. To compile and run the testbench with Verilator, use the following commands:
   ```
   verilator --cc adder_4bit.v --exe tb_adder_4bit.cpp --build
   ./obj_dir/Vadder_4bit
   ```
3. This will compile the Verilog code and the C++ testbench, run the simulation, and generate output files including the waveform.

## Viewing Waveforms
- The simulation will generate a waveform file (e.g., `dump.vcd`).
- You can view the waveform using a waveform viewer such as GTKWave:
  ```
  gtkwave dump.vcd
  ```

## Author
Diego Verdin  
