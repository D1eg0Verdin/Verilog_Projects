#include "VsequenceLock.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <iostream>
int main(int argc, char **argv, char **env) {
    //comand line settings
    Verilated::commandArgs(argc, argv);

    VsequenceLock* top = new VsequenceLock;

}

auto tickClk(){
    
}