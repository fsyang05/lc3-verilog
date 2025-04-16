// TESTBENCH FOR REGFILE
//
// verilog_format: off
`timescale 1ns / 1ns
`include "regFile.v"

module regFile_tb;
    // input regs
    reg clk;
    reg [15:0] inputData;
    reg [ 2:0] DR, SR1, SR2;

    // output wire
    wire [15:0] outputData1, outputData2;

    // instantiate regFile
    regFile regFileTest (
        .clk(clk),
        .inputData(inputData),
        .DR(DR),
        .SR1(SR1),
        .SR2(SR2),
        .outputData1(outputData1),
        .outputData2(outputData2)
    );

    // clk gen (since clocked)
    always #5 clk = ~clk;

    initial begin
        // initial state
        clk = 0;
        inputData = 0;
        DR = 0;
        SR1 = 0;
        SR2 = 0;

        // TEST1: Write 1 to R0, SR1 = R1, SR2 = R2
        // NOTE: PASSED
        #10 inputData = 1;
        DR = 0;
        SR1 = 1;
        SR2 = 2;
        $display("\nTEST1\n");
        #5 $display("TEST1: outputData1: %d, outputData2: %d", outputData1, outputData2);

        // TEST2: SR1 = R0, SR2 = R0, Write 500 to R0
        // EXPECTED: PRE-WRITE: outputData1: 0, outputData2: 0
        // PASSED
        // EXPECTED: POST_WRITE: outputData1: 500, outputData2: 500
        // NOT PASSED
        #10 inputData = 500;
        DR = 0;
        SR1 = 0;
        SR2 = 0;
        $display("\nTEST2\n");
        $display("PRE-WRITE: outputData1: %d, outputData2: %d", outputData1, outputData2);
        #10 $display("POST-WRITE: outputData1: %d, outputData2: %d", outputData1, outputData2);

        // TEST3: Write 300 to ALL registers, SR1 = SR2 = 0
        $display("\nTEST3\n");
        #10 inputData = 300;
        DR = 0;
        SR1 = 0;
        SR2 = 0;

        #10 DR = 1;
        #10 DR = 2;
        #10 DR = 3;
        #10 DR = 4;
        #10 DR = 5;
        #10 DR = 6;
        #10 DR = 7;
        #10 $display("ALL REGISTERS WRITTEN");
        #10 $finish;
   end
endmodule
