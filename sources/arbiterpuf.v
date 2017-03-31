`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2017 02:17:51 PM
// Design Name: 
// Module Name: arbiterpuf
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


module arbiterpuf(
    input s,
    input [63:0]C,
    output [63:0]Q
    );
    
    arbiter A0(s, s, C, Q[0]);
    arbiter A1(s, s, C, Q[1]);
    arbiter A2(s, s, C, Q[2]);
    arbiter A3(s, s, C, Q[3]);
    arbiter A4(s, s, C, Q[4]);
    
    arbiter A5(s, s, C, Q[5]);
    arbiter A6(s, s, C, Q[6]);
    arbiter A7(s, s, C, Q[7]);
    arbiter A8(s, s, C, Q[8]);
    arbiter A9(s, s, C, Q[9]);
    
    arbiter A10(s, s, C, Q[10]);
    arbiter A11(s, s, C, Q[11]);
    arbiter A12(s, s, C, Q[12]);
    arbiter A13(s, s, C, Q[13]);
    arbiter A14(s, s, C, Q[14]);
    
    arbiter A15(s, s, C, Q[15]);
    arbiter A16(s, s, C, Q[16]);
    arbiter A17(s, s, C, Q[17]);
    arbiter A18(s, s, C, Q[18]);
    arbiter A19(s, s, C, Q[19]);
    
    arbiter A20(s, s, C, Q[20]);
    arbiter A21(s, s, C, Q[21]);
    arbiter A22(s, s, C, Q[22]);
    arbiter A23(s, s, C, Q[23]);
    arbiter A24(s, s, C, Q[24]);
    
    arbiter A25(s, s, C, Q[25]);
    arbiter A26(s, s, C, Q[26]);
    arbiter A27(s, s, C, Q[27]);
    arbiter A28(s, s, C, Q[28]);
    arbiter A29(s, s, C, Q[29]);
    
    arbiter A30(s, s, C, Q[30]);
    arbiter A31(s, s, C, Q[31]);
    arbiter A32(s, s, C, Q[32]);
    arbiter A33(s, s, C, Q[33]);
    arbiter A34(s, s, C, Q[34]);
    
    arbiter A35(s, s, C, Q[35]);
    arbiter A36(s, s, C, Q[36]);
    arbiter A37(s, s, C, Q[37]);
    arbiter A38(s, s, C, Q[38]);
    arbiter A39(s, s, C, Q[39]);
    
    arbiter A40(s, s, C, Q[40]);
    arbiter A41(s, s, C, Q[41]);
    arbiter A42(s, s, C, Q[42]);
    arbiter A43(s, s, C, Q[43]);
    arbiter A44(s, s, C, Q[44]);
    
    arbiter A45(s, s, C, Q[45]);
    arbiter A46(s, s, C, Q[46]);
    arbiter A47(s, s, C, Q[47]);
    arbiter A48(s, s, C, Q[48]);
    arbiter A49(s, s, C, Q[49]);
    
    arbiter A50(s, s, C, Q[50]);
    arbiter A51(s, s, C, Q[51]);
    arbiter A52(s, s, C, Q[52]);
    arbiter A53(s, s, C, Q[53]);
    arbiter A54(s, s, C, Q[54]);
    
    arbiter A55(s, s, C, Q[55]);
    arbiter A56(s, s, C, Q[56]);
    arbiter A57(s, s, C, Q[57]);
    arbiter A58(s, s, C, Q[58]);
    arbiter A59(s, s, C, Q[59]);
    
    arbiter A60(s, s, C, Q[60]);
    arbiter A61(s, s, C, Q[61]);
    arbiter A62(s, s, C, Q[62]);
    arbiter A63(s, s, C, Q[63]);
    
endmodule
