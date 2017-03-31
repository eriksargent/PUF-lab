/*
Copyright (c) 2014-2016 Alex Forencich
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * AXI4-Stream UART
 */
module uart_rx #
(
    parameter DATA_WIDTH = 8
)
(
    input  wire                   clk,
    input  wire                   rst,

    /*
     * Data output
     */
    output wire [63-1:0]          output_data,
    output wire                   output_valid,
    input  wire                   output_ready,

    /*
     * UART interface
     */
    input  wire                   rxd

);

reg rxd_reg = 1;

reg valid_reg = 1;

reg [DATA_WIDTH-1:0] data_reg = 0;
reg [63:0] output_data_reg = 0;
reg [3:0] bit_cnt = 0;
reg [3:0] byte_cnt = 0;

assign output_valid = valid_reg;
assign output_data = output_data_reg;

always @(posedge clk) begin
    if (rst) begin
        rxd_reg <= 1;
        bit_cnt <= 0;
        byte_cnt <= 0;
        output_data_reg <= 0;
        data_reg <= 0;
        valid_reg <= 0;
    end else begin
        rxd_reg <= rxd;

        
        if (bit_cnt > 0) begin
            if (bit_cnt > DATA_WIDTH+1) begin
                if (~rxd_reg) begin
                    bit_cnt <= bit_cnt - 1;
                end else begin
                    bit_cnt <= 0;
                end
            end else if (bit_cnt > 1) begin
                bit_cnt <= bit_cnt - 1;
                data_reg <= {rxd_reg, data_reg[DATA_WIDTH-1:1]};
            end else if (bit_cnt == 1) begin
                bit_cnt <= bit_cnt - 1;
                if (rxd_reg) begin
                    if (byte_cnt < 8) begin
                        output_data_reg <= {output_data_reg << (byte_cnt << DATA_WIDTH), data_reg};
                        byte_cnt <= byte_cnt + 1;
                    end
                    
                    if (byte_cnt == 8) begin
                        valid_reg <= 1;
                    end
                end
            end
        end else begin
            if (~rxd_reg) begin
                bit_cnt <= DATA_WIDTH+2;
                data_reg <= 0;
                valid_reg <= 0;
                
                if (byte_cnt == 8) begin
                    output_data_reg <= 0;
                end
            end
        end
    end
end

endmodule