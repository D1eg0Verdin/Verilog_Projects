# Combinational Logic Gates Simulation

This project contains a simple Verilog module implementing **AND, OR, and XOR gates**, along with a **C++ testbench** using Verilator to simulate and verify the design.
This was my first ever verilog project.

---

## **File Structure**

comblogic/
└── gates/
├── gates.v          # Verilog module implementing AND/OR/XOR
├── tb_design.cpp    # C++ testbench using Verilator
├── gates.vcd        # Waveform output (generated after simulation)
└── README.md        # This file
---

## **Module Description**

- `gates.v` defines a single module with inputs `a`, `b` and outputs:
  - `y_and` → a AND b
  - `y_or`  → a OR b
  - `y_xor` → a XOR b
- Outputs are combinational (`wire`) and update automatically when inputs change.

---

## **Testbench Description**

- `tb_design.cpp` is a C++ testbench that:
  - Instantiates the Verilog module as a C++ object (`Vgates`)
  - Loops through all possible input combinations
  - Prints output results to the terminal
  - Generates a `.vcd` waveform file for viewing in GTKWave

---

## **Requirements**

- [Verilator](https://www.veripool.org/verilator/) installed on your system
- C++ compiler (g++/clang++)
- [GTKWave](http://gtkwave.sourceforge.net/) (optional, for viewing waveforms)

---

## **Build and Run Instructions**

From the `gates` folder:

1. **Generate C++ simulation code:**

```bash
verilator -Wall --cc gates.v --exe tb_design.cpp --trace
```

2. **Build the simulation executable:**

```bash
make -C obj_dir -f Vgates.mk Vgates
```

3. **Run the Simulation:**

```bash
./obj_dir/Vgates
```

You should see the following output:

```
a=0 b=0 | AND=0 OR=0 XOR=0
a=0 b=1 | AND=0 OR=1 XOR=1
a=1 b=0 | AND=0 OR=1 XOR=1
a=1 b=1 | AND=1 OR=1 XOR=0
```

4. **View the waveform:**

```bash
gtkwave gates.vcd
```

Author: Diego Verdin

Date: 2025/08/30
