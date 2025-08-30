module counter4(
    input clk, 
    input rst, 
    input up_down, //clock, reset, 1 = up, 0 = down
    output reg [3:0] q
);
    always@(posedge clk) begin
        if(rst)
            q <= 4'b0000; //reset counter
        else if(up_down)
            q <= q+1;
        else
            q <= q-1;
    end
endmodule
