// REGISTER FILE
//
// INPUTS: newdata, write_reg
// OUTPUTS: regdata
//
// ONE read/write per cycle.

// verilog_format: off
// TODO: testbench
module regFile (
    input clk,
    input [15:0]  inputData,
    input [ 2:0]  DR, SR1, SR2,
    output [15:0]  outputData
);

    // declare registers, writeEnable, initiate to 0
    // TODO: initiate readVector
    reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
    reg [7:0] writeEnable;
    reg [7:0] readEnable;

    initial begin
        {R0,R1,R2,R3,R4,R5,R6,R7} = 16'b0;
        writeEnable = 0;
    end

    // convert DR, SR1, SR2 to writeEnable, readVector
    integer tempDR, tempSR1, tempSR2;
    assign writeEnable[temp] = 1;

    always @(DR, SR1, SR2)
    begin
        tempDR = DR;
        tempSR1 = SR1;
        tempSR2 = SR2;
    end

    // TODO: fix this
    always @(posedge clk)
    begin
        in_select <= write_reg;
        write[in_select] <= 1;
        $display("WRITE_REG: %d", write_reg);
        $display("IN_SELECT: %d", in_select);

        case (out_select)
            3'h0    :   outreg = R0;
            3'h1    :   outreg = R1;
            3'h2    :   outreg = R2;
            3'h3    :   outreg = R3;
            3'h4    :   outreg = R4;
            3'h5    :   outreg = R5;
            3'h6    :   outreg = R6;
            3'h7    :   outreg = R7;
            default :   outreg = 0;
        endcase

//        $display("WRITEENABLE: %d %d %d %d %d %d %d %d", write[0], write[1], write[2], write[3], write[4], write[5], write[6], write[7]);

        R0 <= write[0]? indata : R0;
        R1 <= write[1]? indata : R1;
        R2 <= write[2]? indata : R2;
        R3 <= write[3]? indata : R3;
        R4 <= write[4]? indata : R4;
        R5 <= write[5]? indata : R5;
        R6 <= write[6]? indata : R6;
        R7 <= write[7]? indata : R7;

        // reset write
        write = 0;

//        $display("Data written");
    end
endmodule

module registers (
    input   clk,
    input   [15:0] iR0, iR1, iR2, iR3, iR4, iR5, iR6, iR7,
    output  [15:0] oR0, oR1, oR2, oR3, oR4, oR5, oR6, oR7
);
    always @(posedge clk)
    begin
        oR0 <= iR0;
        oR1 <= iR1;
        oR2 <= iR2;
        oR3 <= iR3;
        oR4 <= iR4;
        oR5 <= iR5;
        oR6 <= iR6;
        oR7 <= iR7;
    end
endmodule
