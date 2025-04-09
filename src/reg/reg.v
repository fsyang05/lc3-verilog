// REGISTER FILE
//
// INPUTS: newdata, write_reg
// OUTPUTS: regdata
//
// Accepts new data and writes to reg
// Outputs current reg data

// verilog_format: off
module RegFile (
    input reg   [15:0]  indata,
    input reg   [ 2:0]  write_reg, out_reg,
    output reg  [15:0]  outdata
);
    reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
    wire [7:0] write;               // reg select
    integer in_select;
    integer out_select;
    
    // assign in_select, out_select with integer cast
    always @(posedge clk)
    begin
        in_select <= write_reg;
        write[in_select] <= 1;

        out_select <= out_reg;
    end

    // update reg, get outdata
    always @(posedge clk)
    begin
        R0 <= write[0]? indata : R0;
        R1 <= write[1]? indata : R1;
        R2 <= write[2]? indata : R2;
        R3 <= write[3]? indata : R3;
        R4 <= write[4]? indata : R4;
        R5 <= write[5]? indata : R5;
        R6 <= write[6]? indata : R6;
        R7 <= write[7]? indata : R7;

        case (out_sel)
            3'h0    :   outdata = R0;
            3'h1    :   outdata = R1;
            3'h2    :   outdata = R2;
            3'h3    :   outdata = R3;
            3'h4    :   outdata = R4;
            3'h5    :   outdata = R5;
            3'h6    :   outdata = R6;
            3'h7    :   outdata = R7;
        endcase
    end
endmodule
// verilog_format: on 
