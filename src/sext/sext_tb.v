// verilog_format: off
//
// Testbench for SIGN EXTENSION module.
//
`timescale 1ns / 1ns
`include "sext.v"

module sext_tb;

    reg [15:0] in_8, in_4;
    wire [15:0] out_8, out_4;

    // instantiate module w/N=8
    sext #(8) sext_test_8 ( .in(in_8), .out(out_8) );

    // N=4
    sext #(4) sext_test_4 ( .in(in_4), .out(out_4) );

    initial begin
        $display("8 BIT SIGN EXTENSION");
        #5 in_8 = 8'b10000000;
        #5 $display("IN: %b, OUT: %b", in_8, out_8);

        #5 in_8 = 8'b01111111;
        #5 $display("IN: %b, OUT: %b", in_8, out_8);

        $display("4 BIT SIGN EXTENSION");
        #5 in_4 = 4'b1000;
        #5 $display("IN: %b, OUT: %b", in_4, out_4);

        #5 in_4 = 4'b0111;
        #5 $display("IN: %b, OUT: %b", in_4, out_4);
    end
endmodule
