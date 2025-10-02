module top(input a,b,clk,output y); reg q; always @(posedge clk) q<=a&b; assign y=q; endmodule
