`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2017 06:38:45 PM
// Design Name: 
// Module Name: controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller(
    input clk,
    input rx,
    output tx
);

    reg [13:0] clk_div;
    reg uart_clk = 0;
    reg rst = 1;
    
    reg [63:0] tx_data;
    reg tx_valid = 0;
    wire tx_ready;
    wire [63:0] rx_data;
    wire rx_valid;
    reg rx_ready = 1;
    
    always @(posedge clk) begin
        clk_div <= clk_div + 1;
        if (clk_div == 10416) begin
            rst <= 0;
            clk_div <= 0;
            uart_clk <= ~uart_clk;
        end
        
        tx_valid <= rx_valid;
    end
    
    uart U(uart_clk, rst, tx_data, tx_valid, tx_ready, rx_data, rx_valid, rx_ready, rx, tx);
    
    always @(posedge rx_valid) begin
        tx_data <= rx_data;
    end
    
endmodule
