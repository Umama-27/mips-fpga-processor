`timescale 1ns / 1ps

module alu (
    input  wire [31:0] a,        // operand A (rs)
    input  wire [31:0] b,        // operand B (rt ya immediate)
    input  wire [3:0]  alu_ctrl, // kaunsi operation
    output reg  [31:0] result,   // answer
    output wire        zero      // result==0 to 1 (beq ke liye)
);
    always @(*) begin
        case (alu_ctrl)
            4'b0000: result = a & b;                               // AND
            4'b0001: result = a | b;                               // OR
            4'b0010: result = a + b;                               // ADD
            4'b0110: result = a - b;                               // SUB
            4'b0111: result = ($signed(a) < $signed(b)) ? 32'd1   // SLT
                                                        : 32'd0;
            default: result = 32'b0;
        endcase
    end
    assign zero = (result == 32'b0); // beq: dono equal hain to zero=1
endmodule
