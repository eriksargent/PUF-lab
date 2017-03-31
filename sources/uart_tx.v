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
module uart_tx #
(
    parameter DATA_WIDTH = 8
)
(
    input  wire                   clk,
    input  wire                   rst,

    /*
     * Data input
     */
    input  wire [63-1:0]          input_data,
    input  wire                   input_valid,
    output wire                   input_ready,

    /*
     * UART interface
     */
    output wire                   txd
);

reg txd_reg = 1;

reg ready_reg = 1;

reg [DATA_WIDTH:0] data_reg = 0;
reg [18:0] prescale_reg = 0;
reg [3:0] bit_cnt = 0;
reg [3:0] byte_cnt = 8;
reg [7:0] byte_reg = 0;

assign txd = txd_reg;

assign input_ready = ready_reg;

always @(posedge clk) begin
    if (rst) begin
        txd_reg <= 1;
        bit_cnt <= 0;
        byte_cnt <= 8;
        ready_reg <= 1;
    end else begin
        if (input_valid && bit_cnt == 0 && byte_cnt == 8) begin
            byte_cnt <= 0;
            byte_reg <= input_data << (byte_cnt << DATA_WIDTH);
            ready_reg <= 0;
        end else if (bit_cnt == 0 && byte_cnt < 9) begin
            byte_cnt <= byte_cnt + 1;
            byte_reg <= input_data << (byte_cnt << DATA_WIDTH);
        end else if (bit_cnt == 0 && byte_cnt == 9) begin
            ready_reg <= 1;
        end
            
        if (bit_cnt == 0) begin
            if (byte_cnt < 9) begin
                bit_cnt <= DATA_WIDTH+1;
                data_reg <= {1'b1, byte_reg};
                txd_reg <= 0;
            end
        end else begin
            if (bit_cnt > 1) begin
                bit_cnt <= bit_cnt - 1;
                {data_reg, txd_reg} <= {1'b0, data_reg};
            end else if (bit_cnt == 1) begin
                bit_cnt <= bit_cnt - 1;
                txd_reg <= 1;
            end
        end
    end
end

endmodule