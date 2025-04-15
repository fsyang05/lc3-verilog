// TESTBENCH FOR REGFILE
//
// verilog_format: off
`timescale 1ns / 1ns
`include "regFile.v"

module regFile_tb;
    // input regs
    reg clk;
    reg [15:0] indata;
    reg [2:0] write_reg, out_reg;

    // output wire
    wire [15:0] outdata;

    // instantiate regFile
    regFile regFileTest (
        .clk(clk),
        .indata(indata),
        .write_reg(write_reg),
        .out_reg(out_reg),
        .outdata(outdata)
    );

    // clk gen (since clocked)
    always #5 clk = ~clk;

    initial begin
        // initial state
        clk = 0;
        indata = 0;
        write_reg = 0;
        out_reg = 0;

        // wait
        #10;

        // write reg idx to each reg, verify reg written
        indata = 16'h0;
        write_reg = 3'h0;
        out_reg = 3'h0;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        #10
        indata = 16'h1;
        write_reg = 3'h1;
        out_reg = 3'h1;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        #10
        indata = 16'h2;
        write_reg = 3'h2;
        out_reg = 3'h2;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        #10
        indata = 16'h3;
        write_reg = 3'h3;
        out_reg = 3'h3;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        #10
        indata = 16'h3;
        write_reg = 3'h3;
        out_reg = 3'h3;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        #10
        indata = 16'h4;
        write_reg = 3'h4;
        out_reg = 3'h4;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        #10
        indata = 16'h5;
        write_reg = 3'h5;
        out_reg = 3'h5;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        #10
        indata = 16'h6;
        write_reg = 3'h6;
        out_reg = 3'h6;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        #10
        indata = 16'h7;
        write_reg = 3'h7;
        out_reg = 3'h7;
        $display("WRITE: %d -> R%d, OUT: %d", indata, write_reg, outdata);

        $display("CHECK MAINTAIN STATE");

        #10
        out_reg = 3'h0;
        $display("READ: R%d -> %d", out_reg, outdata);
        $finish;
        // check registers maintain state
    end
endmodule
