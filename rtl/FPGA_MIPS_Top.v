`timescale 1ns / 1ps
module FPGA_MIPS_Top(
    input CLK100MHZ,
    input clk,
    input reset,
    input [4:0] sw,
    input sw5,          // ? ADD: SW5 = 0 register, 1 = memory
    output [7:0] an,
    output [6:0] seg,
    output dp
);
    reg step_clk, btn_sync;
    reg [16:0] debounce_counter = 0;

    always @(posedge CLK100MHZ) begin
        debounce_counter <= debounce_counter + 1;
        if(debounce_counter == 0) begin
            btn_sync <= clk;
            step_clk <= btn_sync;
        end
    end

    assign dp = 1'b1;

    wire [31:0] reg_data;
    wire [31:0] mem_data;

    mips_processor processor_core (
        .clk(step_clk),
        .reset(reset),
        .debug_reg_addr(sw),
        .debug_reg_data(reg_data),
        .debug_mem_addr(sw),       // ? ADD
        .debug_mem_data(mem_data)  // ? ADD
    );

    // SW5 = 0 ? register show karo
    // SW5 = 1 ? memory show karo
    wire [31:0] display_data = sw5 ? mem_data : reg_data;

    SevenSegmentController display_unit (
        .clk(CLK100MHZ),
        .val_to_display(display_data),
        .an(an),
        .seg(seg)
    );
endmodule