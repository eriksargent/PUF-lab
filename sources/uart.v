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
//module uart #
//(
//    parameter DATA_WIDTH = 8
//)
//(
//    input  wire                   clk,
//    input  wire                   rst,

//    /*
//     * Data input
//     */
//    input  wire [63:0]            input_data,
//    input  wire                   input_valid,
//    output wire                   input_ready,

//    /*
//     * Data output
//     */
//    output wire [63:0]            output_data,
//    output wire                   output_valid,
//    input  wire                   output_ready,

//    /*
//     * UART interface
//     */
//    input  wire                   rxd,
//    output wire                   txd
//);

//uart_tx #(
//    .DATA_WIDTH(DATA_WIDTH)
//)
//uart_tx_inst (
//    .clk(clk),
//    .rst(rst),
//    //Data input
//    .input_data(input_data),
//    .input_valid(input_valid),
//    .input_ready(input_ready),
//    // output
//    .txd(txd)
//);

//uart_rx #(
//    .DATA_WIDTH(DATA_WIDTH)
//)
//uart_rx_inst (
//    .clk(clk),
//    .rst(rst),
//    // Data output
//    .output_data(output_data),
//    .output_valid(output_valid),
//    .output_ready(output_ready),
//    // input
//    .rxd(rxd)
//);

//endmodule

//-----------------------------------------------------
// Design Name : uart 
// File Name   : uart.v
// Function    : Simple UART
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module uart (
reset          ,
txclk          ,
ld_tx_data     ,
tx_data        ,
tx_enable      ,
tx_out         ,
tx_empty       ,
rxclk          ,
uld_rx_data    ,
rx_data        ,
rx_enable      ,
rx_in          ,
rx_empty
);
// Port declarations
input        reset          ;
input        txclk          ;
input        ld_tx_data     ;
input  [7:0] tx_data        ;
input        tx_enable      ;
output       tx_out         ;
output       tx_empty       ;
input        rxclk          ;
input        uld_rx_data    ;
output [7:0] rx_data        ;
input        rx_enable      ;
input        rx_in          ;
output       rx_empty       ;

// Internal Variables 
reg [7:0]    tx_reg         ;
reg          tx_empty       ;
reg          tx_over_run    ;
reg [3:0]    tx_cnt         ;
reg          tx_out         ;
reg [7:0]    rx_reg         ;
reg [7:0]    rx_data        ;
reg [3:0]    rx_sample_cnt  ;
reg [3:0]    rx_cnt         ;  
reg          rx_frame_err   ;
reg          rx_over_run    ;
reg          rx_empty       ;
reg          rx_d1          ;
reg          rx_d2          ;
reg          rx_busy        ;

// UART RX Logic
always @ (posedge rxclk or posedge reset)
if (reset) begin
  rx_reg        <= 0; 
  rx_data       <= 0;
  rx_sample_cnt <= 0;
  rx_cnt        <= 0;
  rx_frame_err  <= 0;
  rx_over_run   <= 0;
  rx_empty      <= 1;
  rx_d1         <= 1;
  rx_d2         <= 1;
  rx_busy       <= 0;
end else begin
  // Synchronize the asynch signal
  rx_d1 <= rx_in;
  rx_d2 <= rx_d1;
  // Uload the rx data
  if (uld_rx_data) begin
    rx_data  <= rx_reg;
    rx_empty <= 1;
  end
  // Receive data only when rx is enabled
  if (rx_enable) begin
    // Check if just received start of frame
    if (!rx_busy && !rx_d2) begin
      rx_busy       <= 1;
      rx_sample_cnt <= 1;
      rx_cnt        <= 0;
    end
    // Start of frame detected, Proceed with rest of data
    if (rx_busy) begin
       rx_sample_cnt <= rx_sample_cnt + 1;
       // Logic to sample at middle of data
       if (rx_sample_cnt == 7) begin
          if ((rx_d2 == 1) && (rx_cnt == 0)) begin
            rx_busy <= 0;
          end else begin
            rx_cnt <= rx_cnt + 1; 
            // Start storing the rx data
            if (rx_cnt > 0 && rx_cnt < 9) begin
              rx_reg[rx_cnt - 1] <= rx_d2;
            end
            if (rx_cnt == 9) begin
               rx_busy <= 0;
               // Check if End of frame received correctly
               if (rx_d2 == 0) begin
                 rx_frame_err <= 1;
               end else begin
                 rx_empty     <= 0;
                 rx_frame_err <= 0;
                 // Check if last rx data was not unloaded,
                 rx_over_run  <= (rx_empty) ? 0 : 1;
               end
            end
          end
       end 
    end 
  end
  if (!rx_enable) begin
    rx_busy <= 0;
  end
end

// UART TX Logic
always @ (posedge txclk or posedge reset)
if (reset) begin
  tx_reg        <= 0;
  tx_empty      <= 1;
  tx_over_run   <= 0;
  tx_out        <= 1;
  tx_cnt        <= 0;
end else begin
   if (ld_tx_data) begin
      if (!tx_empty) begin
        tx_over_run <= 0;
      end else begin
        tx_reg   <= tx_data;
        tx_empty <= 0;
      end
   end
   if (tx_enable && !tx_empty) begin
     tx_cnt <= tx_cnt + 1;
     if (tx_cnt == 0) begin
       tx_out <= 0;
     end
     if (tx_cnt > 0 && tx_cnt < 9) begin
        tx_out <= tx_reg[tx_cnt -1];
     end
     if (tx_cnt == 9) begin
       tx_out <= 1;
       tx_cnt <= 0;
       tx_empty <= 1;
     end
   end
   if (!tx_enable) begin
     tx_cnt <= 0;
   end
end

endmodule