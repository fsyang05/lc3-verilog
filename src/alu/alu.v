// ALU
//
// Accepts opcode, a, b from decoder
// Performs ALU bitwise ADD, AND, NOT
//
// opcode   :   inst
// 0001     :   ADD
// 0101     :   AND
// 1001     :   NOT
// verilog_format: off
// TODO: testbench

module alu (
    input clk,
    input   [15:0]  a, b,
    input   [ 3:0]  opcode,
    output  [15:0]  out,
    output  [ 2:0]  nzp
);
    reg [15:0] alu_out;
    assign out = alu_out;
    assign nzp[1] = !(^out); // unary xnor
    assign nzp[2] = out[15]; // MSB
    assign nzp[0] = !out[15];

    always @(posedge clk)
    begin
        case (opcode)
            4'b0001 :   alu_out = a + b;
            4'b0101 :   alu_out = a & b;
            4'b1001 :   alu_out = ~a;
            default :   alu_out = 16'b0; // should create error code
        endcase
    end
endmodule
