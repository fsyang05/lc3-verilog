// Testbench for alu.v
// to use, run:
//
//    iverilog -o alu_tb.vvp alu_tb.v
//    vvp alu_tb.vvp

`timescale 1ns / 1ns
`include "alu.v"

module alu_tb;
    reg clk;
    reg [15:0] a, b;
    reg [3:0] opcode;
    wire [15:0] out;
    wire [2:0] nzp;

    // Instantiate ALU
    alu uut (
        .clk(clk),
        .a(a),
        .b(b),
        .opcode(opcode),
        .out(out),
        .nzp(nzp)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initalize
        clk = 0;
        a = 0;
        b = 0;
        opcode = 4'b0000;

        #10;

        // ADD test: 5 + 3 = 8
        a = 16'd5;
        b = 16'd3;
        opcode = 4'b0001; // ADD
        #10;
        $display("ADD: %d + %d = %d | nzp = %b", a, b, out, nzp);

        // AND test: b0101 & b0110 = b0100 
        // in decimal: 5 & 4 = 4
        a = 16'd5;
        b = 16'd4;
        opcode = 4'b0101; // AND
        #10;
        $display("AND: %d & %d = %d | nzp = %b", a, b, out, nzp);

        // Test NOT: ~b1101 = b0010
        // in decimal: ~-3 = 2 
        a = -16'd3;
        b = 16'd0;         // don't care
        opcode = 4'b1001;  // NOT
        #10;
        $display("NOT: ~%d = %d | nzp = %b", a, out, nzp);

        // Test Zero output
        a = 16'd2;
        b = -16'd2;
        opcode = 4'b0001; // 2 + (-2) = 0
        #10;
        $display("ADD (Zero Test): %d + %d = %d | nzp = %b", a, b, out, nzp);

        // Test Negative result
        a = -16'd3;
        b = -16'd4;
        opcode = 4'b0001; // ADD
        #10;
        $display("ADD (Negative Test): %d + %d = %d | nzp = %b", a, b, out, nzp);

        $finish;
    end
endmodule