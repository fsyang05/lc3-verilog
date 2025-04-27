// verilog_format: off
//
// SIGN EXTENSION (sext lol)
//
// Given the size in bits, extends sign bit (leading bit)
// to 16 total bits
//

module sext #(parameter N=8) (
    input [15:0] in,
    output [15:0] out
);

assign out[15:N] = {16-N{in[N-1]}};
assign out[N-1:0] = in;

endmodule
