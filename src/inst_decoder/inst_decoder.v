// DECODER
//
// Accepts instruction from IR
// Generates opcode, SR1, SR2, DR, imm5
//
// TODO: what to output? depends on reg implementation
// TODO: bus to control unit; STR LDR BR JMP handling

module decoder (
    input   [15:0]  instruct,
    output  [ 3:0]  opcode,
);
endmodule

// bus
module decoder_bus ();
endmodule