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
    output [15:0]  outputData1, outputData2
);

    // declare registers, writeEnable, initiate to 0
    reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
    reg [15:0] oD1, oD2;
    reg [ 7:0] writeEnable;

    initial begin
        {R0,R1,R2,R3,R4,R5,R6,R7} = 16'b0;
        writeEnable = 0;
    end

    // convert DR, SR1, SR2 to writeEnable, readVector
    integer intDR, intSR1, intSR2;
    assign outputData1 = oD1;
    assign outputData2 = oD2;

    // unclocked, simultaneous assignment
    always @(DR, SR1, SR2)
    begin
        // reset writeEnable
        writeEnable = 0;

        // integer conversion
        intDR = DR;
        intSR1 = SR1;
        intSR2 = SR2;
//        $display("intDR: %d", intDR);
        writeEnable[intDR] = 1'b1;

        // check DR, SR1, SR2, writeEnable update
//        $display("UPDATE DR: %d, SR1: %d, SR2: %d", DR, SR1, SR2);
//        $display("UPDATE writeEnable: %d %d %d %d %d %d %d %d",
//            writeEnable[0], writeEnable[1], writeEnable[2], writeEnable[3],
//            writeEnable[4], writeEnable[5], writeEnable[6], writeEnable[7]);
    end

    //
    // Combinational assignment. Update outputData if SR1, SR2
    // are changed. Else, leave as is.
    //
    always @(*)
    begin
        case (SR1)
            3'b000      :       oD1 = R0;
            3'b001      :       oD1 = R1;
            3'b010      :       oD1 = R2;
            3'b011      :       oD1 = R3;
            3'b100      :       oD1 = R4;
            3'b101      :       oD1 = R5;
            3'b110      :       oD1 = R6;
            3'b111      :       oD1 = R7;
            default     :
                begin
                    $display("ERROR: Invalid SR1 code.");
                    oD1 = 0;
                end
        endcase

        case (SR2)
            3'b000      :       oD2 = R0;
            3'b001      :       oD2 = R1;
            3'b010      :       oD2 = R2;
            3'b011      :       oD2 = R3;
            3'b100      :       oD2 = R4;
            3'b101      :       oD2 = R5;
            3'b110      :       oD2 = R6;
            3'b111      :       oD2 = R7;
            default
                begin
                    $display("ERROR: Invalid SR2 code.");
                    oD2 = 0;
                end
        endcase
    end

    //
    // Update ALL registers on every clock cycle.
    // Use writeEnable as MUX select.
    //
    always @(posedge clk)
    begin
        // check writeEnable
//        $display("READ writeEnable: %d %d %d %d %d %d %d %d", writeEnable[0], writeEnable[1],
//            writeEnable[2], writeEnable[3], writeEnable[4], writeEnable[5], writeEnable[6],
//            writeEnable[7]);

        // update ALL registers, using writeEnable
        // doesn't matter if blocking or unblocking
        R0 <= writeEnable[0] ? inputData : R0;
        R1 <= writeEnable[1] ? inputData : R1;
        R2 <= writeEnable[2] ? inputData : R2;
        R3 <= writeEnable[3] ? inputData : R3;
        R4 <= writeEnable[4] ? inputData : R4;
        R5 <= writeEnable[5] ? inputData : R5;
        R6 <= writeEnable[6] ? inputData : R6;
        R7 <= writeEnable[7] ? inputData : R7;

        // display state
        $display("Registers: %d %d %d %d %d %d %d %d", R0, R1, R2, R3, R4, R5, R6, R7);
    end
endmodule
