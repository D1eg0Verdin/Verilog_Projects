module tb_counter;
    reg clk;
    reg rst;
    reg up_down;
    wire [3:0] count;

    //instatiate the counter
    counter4  my_counter(
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .q(count)
    );

    //clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk ;
    end

    initial begin
        //start with reset to ensure counter is 0
        rst = 1;
        up_down = 1;
        #20
        rst = 0;
        #100
        up_down = 0; //swap counting directions
        #100
        $finish;
    end

    always @(posedge clk) begin
        $display("Time = %0t |rst=%b| up_down = %b | count = %b (%0d)", $time, rst, up_down, count, count);
    end

    //dump to vcd file
    initial begin
        $dumpfile("tb_counter.vcd");
        $dumpvars(0,tb_counter);
    end
endmodule
            
        