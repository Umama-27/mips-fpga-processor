`timescale 1ns / 1ps
module instruction_memory (
    input  wire [31:0] addr,
    output wire [31:0] instr
);
    reg [31:0] mem [0:255];

    initial begin
        $readmemh("program.mem", mem);
    end

    assign instr = mem[addr[9:2]];
endmodule


