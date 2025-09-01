module sequenceLock(
    input wire clk,
    input wire rst,
    input wire button,
    output reg unlock
);
    localparam S0 = 3'b000; //starting state
    localparam S1 = 3'b001; //first input right
    localparam S2 = 3'b010; //second input rigjht
    localparam S3 = 3b'011;//third input rigjht
    localparam S4 = 3b'100; //unlock

    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end
    always @(*) begin
        next_state = state;
        unlock = 0;
        case (state)
            S0: begin
                if(button) next_state = S1;
                else next_state = S0;
            end
            S1:begin
                if(!button) next_state = S2;
                else next_state = S0;
            end
            S2: begin
                if(button) next_state = S3;
                else next_state = S0;
            end
            S3: begin
                if(button) next_state = S4;
                else next_state = S0;
            end
            S4: begin
                next_state = S4;
                unlock = 1;
            end
        endcase
    end 
endmodule



