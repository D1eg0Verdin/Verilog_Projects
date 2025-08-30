//this module represents a full adder
module full_adder(
    input wire a,b, cin
    output wire sum, cout
);
    assign sum = a^b^cin;
    assign cout = a&b | a&c | b&c;
endmodule

module adder4(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [3:0] sum,
    output wire c_out
);
    wire c1,c2,c3; //carry wires
    full_adder fa0(.a(a[0]),.b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(c1));
    full_adder fa1(.a(a[1]),.b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    full_adder fa2(.a(a[2]),.b(b[2]), .cin(c2), .sum(sum[2]), .cout(c2));
    full_adder fa0(.a(a[3]),.b(b[3]), .cin(c3), .sum(sum[3]), .cout(c_out));
endmodule
