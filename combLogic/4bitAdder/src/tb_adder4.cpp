#include "Vadder4.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <iostream>
int main(int argc, char **argv, char **env) {
    //comand line settings
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    Vadder4* top = new Vadder4;
    VerilatedVcdC* tfp = new VerilatedVcdC;

    top->trace(tfp,99);
    tfp->open("adder4.vcd");

    vluint64_t time = 0;
    bool failed = false;

    for(int a = 0; a < 16; a++){
        for(int b = 0 ; b < 16; b++){
            top->a = a;
            top->b = b;
            top->eval();

            int expected_sum = (a+b) & (0xF);//expected first four bits
            int expected_cout = (a+b) >> 4; //expected carry out;

            tfp->dump(time++);

            if((int)top->sum != expected_sum || (int)top->c_out!= expected_cout){
                std::cerr<<"Test failed a= "<<a<<" b= "<<b<< " expected sum= "<<expected_sum <<" actual sum = "<<(int)top->sum<< " expected cout = "<<expected_cout<< " actual = "<<(int)top->c_out<<std::endl;
                failed = true;
                
            }
        }
    }

    tfp->close();
    delete top;
    delete tfp;
    if(failed){
        std::cerr<<"Testbench failed"<<std::endl;
        return 1;
    }
    std::cout<<"All tests passed!"<<std::endl;
    
    return 0;
}