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

    reg rst = 1;
    
    reg [63:0] tx_data;
    wire [7:0] tx_output;
    reg tx_valid = 0;
    wire tx_ready;
    reg [63:0] rx_data;
    wire [7:0] rx_input;
    wire rx_valid;
    reg rx_ready = 1;
    
    reg [2:0]in_byte_count = 0;
    reg [2:0]out_byte_count = 0;
    
    assign tx_output = tx_data[7:0];
        
    always @(posedge clk) begin
        if (rst) begin
            rst <= 0;
            tx_valid <= 0;
        end
    end
    
    wire tx_active;
    
    uart_rx UR(clk, rx, rx_valid, rx_input);
    uart_tx UT(clk, tx_valid, tx_output, tx_active, tx, tx_ready); 
    
    always @(posedge rx_valid) begin
        rx_data <= (rx_data << 8) | rx_input;
        in_byte_count <= in_byte_count + 1;
        
        if (in_byte_count == 7) begin
            tx_data <= rx_data;
            out_byte_count <= 7;
            tx_valid <= 1;
            in_byte_count <= 0;
        end
    end
    
    always @(posedge tx_ready) begin
        tx_data <= tx_data >> 8;
        out_byte_count <= out_byte_count - 1;
        
        if (out_byte_count == 0) begin
            tx_valid <= 0;
        end
    end
    
    
endmodule
