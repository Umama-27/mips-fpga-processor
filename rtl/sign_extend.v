`timescale 1ns / 1ps
module sign_extend (
    input  wire [15:0] imm_16,  
    output wire [31:0] imm_32  
);
    assign imm_32 = {{16{imm_16[15]}}, imm_16};

endmodule
