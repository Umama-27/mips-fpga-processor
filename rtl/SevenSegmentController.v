`timescale 1ns / 1ps
module SevenSegmentController(
    input clk,
    input [31:0] val_to_display,
    output reg [7:0] an,
    output reg [6:0] seg
);
    reg [19:0] refresh_counter = 0;
    wire [2:0] active_digit;
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end

    assign active_digit = refresh_counter[19:17];
    reg [3:0] hex_digit;
    always @(*) begin
        case(active_digit)
            3'd0: begin an = 8'b11111110; hex_digit = val_to_display[3:0];   end
            3'd1: begin an = 8'b11111101; hex_digit = val_to_display[7:4];   end
            3'd2: begin an = 8'b11111011; hex_digit = val_to_display[11:8];  end
            3'd3: begin an = 8'b11110111; hex_digit = val_to_display[15:12]; end
            3'd4: begin an = 8'b11101111; hex_digit = val_to_display[19:16]; end
            3'd5: begin an = 8'b11011111; hex_digit = val_to_display[23:20]; end
            3'd6: begin an = 8'b10111111; hex_digit = val_to_display[27:24]; end
            3'd7: begin an = 8'b01111111; hex_digit = val_to_display[31:28]; end
            default: begin an = 8'b11111111; hex_digit = 4'b0; end
        endcase
    end

    always @(*) begin
        case(hex_digit)
            4'h0: seg = 7'b1000000;
            4'h1: seg = 7'b1111001;
            4'h2: seg = 7'b0100100;
            4'h3: seg = 7'b0110000;
            4'h4: seg = 7'b0011001;
            4'h5: seg = 7'b0010010;
            4'h6: seg = 7'b0000010;
            4'h7: seg = 7'b1111000;
            4'h8: seg = 7'b0000000;
            4'h9: seg = 7'b0010000;
            4'hA: seg = 7'b0001000;
            4'hB: seg = 7'b0000011;
            4'hC: seg = 7'b1000110;
            4'hD: seg = 7'b0100001;
            4'hE: seg = 7'b0000110;
            4'hF: seg = 7'b0001110;
            default: seg = 7'b1111111;
        endcase
    end
endmodule
