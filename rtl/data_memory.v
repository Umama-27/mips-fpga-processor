`timescale 1ns / 1ps
module data_memory (
    input  wire        clk,
    input  wire        mem_read,
    input  wire        mem_write,
    input  wire [31:0] address,
    input  wire [31:0] write_data,
    output wire [31:0] read_data,
    input  wire [4:0]  debug_addr,    // ? ADD: SW se memory address select
    output wire [31:0] debug_mem_data // ? ADD: memory value 7-seg pe
);
    reg [31:0] mem [0:63];
    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1)
            mem[i] = 32'b0;
    end

    always @(posedge clk) begin
        if (mem_write)
            mem[address[7:2]] <= write_data;
    end

    assign read_data     = mem_read ? mem[address[7:2]] : 32'b0;
    assign debug_mem_data = mem[debug_addr]; // ? ADD: direct memory read
endmodule