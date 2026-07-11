`timescale 1ns / 1ps
module mips_processor (
    input  wire        clk,
    input  wire        reset,
    input  wire [4:0]  debug_reg_addr,
    output wire [31:0] debug_reg_data,
    input  wire [4:0]  debug_mem_addr,   // ? ADD
    output wire [31:0] debug_mem_data    // ? ADD
);
    // Internal Wires 
    wire [31:0] pc_out, pc_plus4, pc_next;
    wire [31:0] instruction;
    wire [31:0] read_data1, read_data2;
    wire [31:0] imm32, alu_b, alu_result;
    wire [31:0] mem_read_data, reg_write_data;
    wire [4:0]  write_reg;
    wire [3:0]  alu_ctrl;
    wire        zero;

    wire [5:0] opcode  = instruction[31:26];
    wire [4:0] rs      = instruction[25:21];
    wire [4:0] rt      = instruction[20:16];
    wire [4:0] rd      = instruction[15:11];
    wire [5:0] funct   = instruction[5:0];
    wire [25:0] j_tgt  = instruction[25:0];

    wire reg_dst, alu_src, mem_to_reg;
    wire reg_write, mem_read, mem_write;
    wire branch, jump;
    wire [1:0] alu_op;

    program_counter PC (
        .clk(clk), .reset(reset),
        .pc_next(pc_next), .pc_out(pc_out)
    );
    pc_adder ADDER (
        .pc_in(pc_out), .pc_plus4(pc_plus4)
    );
    instruction_memory IMEM (
        .addr(pc_out), .instr(instruction)
    );
    control_unit CU (
        .opcode(opcode),
        .reg_dst(reg_dst), .alu_src(alu_src),
        .mem_to_reg(mem_to_reg), .reg_write(reg_write),
        .mem_read(mem_read), .mem_write(mem_write),
        .branch(branch), .jump(jump), .alu_op(alu_op)
    );

    assign write_reg = reg_dst ? rd : rt;

    register_file RF (
        .clk(clk),
        .reset(reset),
        .reg_write(reg_write),
        .read_reg1(rs),
        .read_reg2(rt),
        .write_reg(write_reg),
        .write_data(reg_write_data),
        .read_data1(read_data1),
        .read_data2(read_data2),
        .debug_addr(debug_reg_addr),
        .debug_data(debug_reg_data)
    );

    sign_extend SE (
        .imm_16(instruction[15:0]), .imm_32(imm32)
    );

    assign alu_b = alu_src ? imm32 : read_data2;

    alu_control ALUC (
        .alu_op(alu_op), .funct(funct), .alu_ctrl(alu_ctrl)
    );
    alu ALU (
        .a(read_data1), .b(alu_b),
        .alu_ctrl(alu_ctrl), .result(alu_result), .zero(zero)
    );

    // ? Sirf ek data_memory instance - DMEM hata diya, DM rakha
    data_memory DMEM (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(alu_result),
        .write_data(read_data2),
        .read_data(mem_read_data),
        .debug_addr(debug_mem_addr),
        .debug_mem_data(debug_mem_data)
    );

    assign reg_write_data = mem_to_reg ? mem_read_data : alu_result;

    wire [31:0] pc_branch = pc_plus4 + (imm32 << 2);
    wire        take_branch = branch & zero;
    wire [31:0] pc_jump = {pc_plus4[31:28], j_tgt, 2'b00};

    assign pc_next = jump        ? pc_jump   :
                     take_branch ? pc_branch : pc_plus4;
endmodule