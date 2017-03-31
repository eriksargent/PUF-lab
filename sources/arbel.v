`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2017 02:11:57 PM
// Design Name: Arbiter Element
// Module Name: arbel
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


module arbel(
    input X,
    input Y,
    input C,
    output W,
    output Z
    );
    
    mux2x1 M1(X, Y, C, W);
    mux2x1 M2(Y, X, C, Z);
    
endmodule
