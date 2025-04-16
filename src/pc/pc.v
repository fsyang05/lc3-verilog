// PROGRAM COUNTER
//
// INPUTS: clk, reset
// OUTPUTS: PC
//
// Increments PC by 1 every clock cycle and initalizes PC when reset is high
//
//
module pc (
    input clk,
    input reset,
    output reg [15:0] PC,
    output reg [1:0] nextPC
);

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            PC <= 16'h3000;
            nextPC <= 16'h3001;
        else
            PC <= nextPC;
            nextPC <= PC + 1;
    end
endmodule