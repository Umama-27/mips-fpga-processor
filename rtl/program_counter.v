`timescale 1ns / 1ps
module program_counter (
    input  wire        clk,     
    input  wire        reset,    
    input  wire [31:0] pc_next,  
    output reg  [31:0] pc_out    
);
initial
    pc_out = 32'b0;
    always @(posedge clk) begin
        if (reset)
            pc_out <= 32'b0;   
        else
            pc_out <= pc_next; 
        end
endmodule
