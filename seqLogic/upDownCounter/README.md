# Up/Down 4-bit Synchronous Counter

## Description
This project implements a 4-bit synchronous up/down counter using Verilog. The counter increments or decrements its value based on a control input, providing a simple example of sequential logic design. It is designed for educational purposes and can be used as a building block in more complex digital systems.

## File Structure
- `counter4.v` : Verilog source file containing the 4-bit up/down counter module.
- `tb_counter.v` : Verilog testbench for simulating the counter.
- `README.md` : This documentation file.

## Module Functionality
The `counter4` module has the following ports:
- `clk` : Clock input (synchronous).
- `reset` : Asynchronous reset input (active high).
- `up_down` : Control input to select counting direction (`1` for up, `0` for down).
- `count` : 4-bit output representing the current counter value.

On each rising edge of the clock, if reset is not asserted, the counter increments or decrements based on the `up_down` signal.

## Testbench Instructions
A Verilog testbench (`tb_counter.v`) is provided to simulate the counter's behavior. It applies clock, reset, and up/down signals to verify correct counting functionality.

To simulate using Verilog simulators (e.g., Icarus Verilog):
```bash
iverilog -o tb_counter.vvp counter4.v tb_counter.v
vvp tb_counter.vvp
```


## Waveform Viewing
The testbench generates a waveform file (`tb_counter.vcd`) during simulation. To view the waveform:

1. Launch GTKWave:
```bash
gtkwave tb_counter.vcd
```

2. Use GTKWave's GUI to inspect the signals and verify the counter operation.

## Author
Diego Verdin  
