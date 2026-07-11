`timescale 1ns / 1ps

module control_unit (
    input  wire [5:0] opcode,     // instruction[31:26]
    output reg        reg_dst,    // 1=rd, 0=rt (write register select)
    output reg        alu_src,    // 1=immediate, 0=register
    output reg        mem_to_reg, // 1=memory?reg, 0=ALU?reg
    output reg        reg_write,  // 1=register mein likhna hai
    output reg        mem_read,   // 1=memory se padhna hai
    output reg        mem_write,  // 1=memory mein likhna hai
    output reg        branch,     // 1=beq instruction
    output reg        jump,       // 1=j instruction
    output reg  [1:0] alu_op      // ALU Control ko hint
);

    always @(*) begin
        // pehle sab zero kar do (default)
        {reg_dst, alu_src, mem_to_reg,
         reg_write, mem_read, mem_write,
         branch, jump} = 8'b0;
        alu_op = 2'b00;

        case (opcode)
            6'b000000: begin  // R-type
                reg_dst  = 1;
                reg_write = 1;
                alu_op   = 2'b10;
            end
            6'b100011: begin  // lw
                alu_src    = 1;
                mem_to_reg = 1;
                reg_write  = 1;
                mem_read   = 1;
            end
            6'b101011: begin  // sw
                alu_src   = 1;
                mem_write = 1;
            end
            6'b000100: begin  // beq
                branch = 1;
                alu_op = 2'b01;
            end
            6'b001000: begin  // addi
                alu_src   = 1;
                reg_write = 1;
                alu_op    = 2'b11;
            end
            6'b000010: begin  // j
                jump = 1;
            end
        endcase
    end

endmodule
