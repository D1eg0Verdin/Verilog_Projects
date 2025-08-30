#include "Vgates.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <iostream>

int main(int argc, char **argv, char **env) {
    //comand line settings
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    Vgates* top = new Vgates; //convert gates.v to c++ 
    VerilatedVcdC* tfp = new VerilatedVcdC; //tracing suppert

    top->trace(tfp, 99);
    tfp->open("gates.vcd"); //tracing file

    vluint64_t time = 0; //time counter

    //iterate through all possible inputs
    for(int a = 0; a <= 1; a++) {
        for(int b = 0; b <= 1; b++) {
            top->a = a;
            top->b = b;
            top->eval();

            std::cout << "a=" << a << " b=" << b
                      << " | AND=" << (int)top->y_and
                      << " OR=" << (int)top->y_or
                      << " XOR=" << (int)top->y_xor << std::endl;

            tfp->dump(time++);
        }
    }

    tfp->close();
    delete top;
    delete tfp;

    return 0;
}