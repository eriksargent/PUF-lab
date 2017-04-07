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
    wire tx_active;
    reg prev_tx_active = 0;
    wire tx_ready;
    reg [63:0] rx_data;
    wire [7:0] rx_input;
    wire rx_valid;
    reg prev_rx_valid = 0;
    reg rx_ready = 1;
    
    reg [2:0]in_byte_count = 0;
    reg [2:0]out_byte_count = 0;
    
    assign tx_output = tx_data[7:0];
    
    uart_rx URX(clk, rx, rx_valid, rx_input);
    uart_tx UTX(clk, tx_valid, tx_output, tx_active, tx, tx_ready);
    
    reg [63:0]challenge;
    wire [63:0]response;
    reg [20:0]response_counter;
    reg preset = 0;
    reg signal = 0;

    arbiterpuf A(signal, challenge, response);
    
    always @(posedge clk) begin
        if (rst) begin
            rst <= 0;
            tx_valid <= 1;
        end
        
        //Load in a byte from the rx when rx_valid goes high
        if (~prev_rx_valid && rx_valid) begin
            rx_data <= (rx_data << 8) | rx_input;
            in_byte_count <= in_byte_count + 1;
            
            //Run the data through the PUF when 8 bytes have been received
            if (in_byte_count == 7) begin
                challenge <= rx_data;
                response_counter <= 0;
                preset <= 1;
                signal <= 0;
            end
        end
        
        prev_rx_valid <= rx_valid;

        //Send the next byte over the tx when the tx_active goes low
        if (prev_tx_active && ~tx_active) begin
            tx_data <= (tx_data >> 8) + 1;
            out_byte_count <= out_byte_count - 1;
            
            //Stop transmitting after sending all data
            if (out_byte_count == 0) begin
                tx_valid <= 0;
            end
        end
        
        prev_tx_active <= tx_active;
        
        if (preset) begin
            response_counter <= response_counter + 1;
            
            if (response_counter == 16'hFFFF) begin
            response_counter = 0;
                signal <= 1;
                preset <= 0;
            end
        end
        //Process while the PUF is working on the response
        if (signal) begin
            response_counter <= response_counter + 1;
            
            //After a delay, send the result from the PUF back over the UART
            if (response_counter == 16'hFFFF) begin
                tx_data <= response;
                signal <= 0;
                out_byte_count <= 7;
                tx_valid <= 1;
            end
        end
    end
endmodule
