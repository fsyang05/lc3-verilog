// FETCH
//
// INPUTS: PC
// OUTPUTS: instruct, newPC
//
// Fetches next instruction from memory and loads into the IR in the control 
// unit which can send it to the decoder. Then, fetch increments PC

// TODO: Need memory module to pull from 

module fetch (
    input clk,
    input  [15:0]  PC,
    output [15:0]  instruct,
    output [15:0]  newPC
);

    always @(posedge clk)
    begin
        newPC <= PC + 1;
        instruct <= memory[PC];
    end
endmodule