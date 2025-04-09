// ALU
//
// Accepts opcode, a, b from decoder
// Performs ALU bitwise ADD, AND, NOT
//
// opcode   :   inst
// 0001     :   ADD
// 0101     :   AND
// 1001     :   NOT
//
// TODO: nzp, write bus to reg file

module alu (
    input   [15:0]  a, b,
    input   [ 3:0]  opcode,
    output  [15:0]  out,
    output  [ 3:0]  nzp
);
    reg [15:0] alu_out;
    assign out = alu_out;

    always @(*) begin
        case (op)
            4'b0001 :   alu_out = a + b;
            4'b0101 :   alu_out = a & b;
            4'b1001 :   alu_out = ~a;
            default :   0; // ?
        endcase
    end
endmodule

// ALU output bus
module alu_bus ();
endmodule

