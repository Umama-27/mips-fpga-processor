`timescale 1ns / 1ps
module alu_control (
    input  wire [1:0] alu_op,   // control unit  (00=lw/sw, 01=beq, 10=R, 11=addi)
    input  wire [5:0] funct,    // instruction[5:0]for R-type 
    output reg  [3:0] alu_ctrl  // for ALU 
);

    always @(*) begin
        case (alu_op)
            2'b00: alu_ctrl = 4'b0010; // lw/sw ? ADD 
            2'b01: alu_ctrl = 4'b0110; // beq   ? SUB 
            2'b11: alu_ctrl = 4'b0010; // addi  ? ADD
            2'b10: begin               // R-type: funct field 
                case (funct)
                    6'b100000: alu_ctrl = 4'b0010; // add
                    6'b100010: alu_ctrl = 4'b0110; // sub
                    6'b100100: alu_ctrl = 4'b0000; // and
                    6'b100101: alu_ctrl = 4'b0001; // or
                    6'b101010: alu_ctrl = 4'b0111; // slt
                    default:   alu_ctrl = 4'b0010;
                endcase
            end
            default: alu_ctrl = 4'b0010;
        endcase
    end

endmodule
