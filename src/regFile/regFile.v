// REGISTER FILE
//
// INPUTS: newdata, write_reg
// OUTPUTS: regdata
//
// Accepts new data and writes to reg
// Outputs current reg data
// Fetch multiple reg?

// verilog_format: off
module regFile (
    input clk,
    input [15:0]  indata,
    input [ 2:0]  write_reg, out_reg,
    output [15:0]  outdata
);
    reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7, outreg;
    reg [7:0] write;               // reg select
    integer in_select;
    integer out_select;
    assign outdata = outreg;

    // init all reg = 0 at start
    initial begin
        {R0,R1,R2,R3,R4,R5,R6,R7} = 16'b0;
    end

    // assign write, assign data, fetch
    // may cause error w/overwritten data?
    always @(posedge clk)
    begin
        in_select <= write_reg;
        write[in_select] <= 1;

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

        $display("Register fetched");

        R0 <= write[0]? indata : R0;
        R1 <= write[1]? indata : R1;
        R2 <= write[2]? indata : R2;
        R3 <= write[3]? indata : R3;
        R4 <= write[4]? indata : R4;
        R5 <= write[5]? indata : R5;
        R6 <= write[6]? indata : R6;
        R7 <= write[7]? indata : R7;

        $display("Data written");
    end
endmodule
// verilog_format: on 
