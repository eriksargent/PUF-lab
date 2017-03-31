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
module uart #
(
    parameter DATA_WIDTH = 8
)
(
    input  wire                   clk,
    input  wire                   rst,

    /*
     * Data input
     */
    input  wire [63:0]            input_data,
    input  wire                   input_valid,
    output wire                   input_ready,

    /*
     * Data output
     */
    output wire [63:0]          output_data,
    output wire                   output_valid,
    input  wire                   output_ready,

    /*
     * UART interface
     */
    input  wire                   rxd,
    output wire                   txd
);

uart_tx #(
    .DATA_WIDTH(DATA_WIDTH)
)
uart_tx_inst (
    .clk(clk),
    .rst(rst),
    //Data input
    .input_data(input_data),
    .input_valid(input_valid),
    .input_ready(input_ready),
    // output
    .txd(txd)
);

uart_rx #(
    .DATA_WIDTH(DATA_WIDTH)
)
uart_rx_inst (
    .clk(clk),
    .rst(rst),
    // Data output
    .output_data(output_data),
    .output_valid(output_valid),
    .output_ready(output_ready),
    // input
    .rxd(rxd)
);

endmodule