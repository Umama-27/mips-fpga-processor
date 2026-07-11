`timescale 1ns / 1ps

module tb_mips_processor();
    reg clk;
    reg reset;
    reg [4:0] debug_reg_addr;
    wire [31:0] debug_reg_data;

    // Instantiate your exact mips_processor module
    mips_processor uut (
        .clk(clk),
        .reset(reset),
        .debug_reg_addr(debug_reg_addr),
        .debug_reg_data(debug_reg_data)
    );

    // Clock generation (50MHz -> Period = 20ns)
    always #10 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        debug_reg_addr = 5'b0;

        // Wait for system reset
        #25;
        reset = 0;
        
        // --- Test Cases ---
        // Let's monitor registers as the processor runs instructions
        #20; debug_reg_addr = 5'd8;  // Monitor Register $t0 (Reg 8)
        #20; debug_reg_addr = 5'd9;  // Monitor Register $t1 (Reg 9)
        #20; debug_reg_addr = 5'd10; // Monitor Register $t2 (Reg 10)
        #20; debug_reg_addr = 5'd11; // Monitor Register $t3 (Reg 11)
        
        #300;
        $finish;
    end
endmodule