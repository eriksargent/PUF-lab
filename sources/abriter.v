`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2017 02:03:06 PM
// Design Name: 
// Module Name: abriter
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


module abriter(
    input X,
    input Y,
    input [63:0]C,
    output O
    );
        
    wire [63:0]WA;
    wire [63:0]WB;
    
    arbel A0(X, Y, C[0], WA[0], WB[0]);
    arbel A1(X, Y, C[1], WA[1], WB[1]);
    arbel A2(X, Y, C[2], WA[2], WB[2]);
    arbel A3(X, Y, C[3], WA[3], WB[3]);
    arbel A4(X, Y, C[4], WA[4], WB[4]);
    
    arbel A5(X, Y, C[5], WA[5], WB[5]);
    arbel A6(X, Y, C[6], WA[6], WB[6]);
    arbel A7(X, Y, C[7], WA[7], WB[7]);
    arbel A8(X, Y, C[8], WA[8], WB[8]);
    arbel A9(X, Y, C[9], WA[9], WB[9]);
    
    arbel A10(X, Y, C[10], WA[10], WB[10]);
    arbel A11(X, Y, C[11], WA[11], WB[11]);
    arbel A12(X, Y, C[12], WA[12], WB[12]);
    arbel A13(X, Y, C[13], WA[13], WB[13]);
    arbel A14(X, Y, C[14], WA[14], WB[14]);
    
    arbel A15(X, Y, C[15], WA[15], WB[15]);
    arbel A16(X, Y, C[16], WA[16], WB[16]);
    arbel A17(X, Y, C[17], WA[17], WB[17]);
    arbel A18(X, Y, C[18], WA[18], WB[18]);
    arbel A19(X, Y, C[19], WA[19], WB[19]);
    
    arbel A20(X, Y, C[20], WA[20], WB[20]);
    arbel A21(X, Y, C[21], WA[21], WB[21]);
    arbel A22(X, Y, C[22], WA[22], WB[22]);
    arbel A23(X, Y, C[23], WA[23], WB[23]);
    arbel A24(X, Y, C[24], WA[24], WB[24]);
    
    arbel A25(X, Y, C[25], WA[25], WB[25]);
    arbel A26(X, Y, C[26], WA[26], WB[26]);
    arbel A27(X, Y, C[27], WA[27], WB[27]);
    arbel A28(X, Y, C[28], WA[28], WB[28]);
    arbel A29(X, Y, C[29], WA[29], WB[29]);
    
    arbel A30(X, Y, C[30], WA[30], WB[30]);
    arbel A31(X, Y, C[31], WA[31], WB[31]);
    arbel A32(X, Y, C[32], WA[32], WB[32]);
    arbel A33(X, Y, C[33], WA[33], WB[33]);
    arbel A34(X, Y, C[34], WA[34], WB[34]);
    
    arbel A35(X, Y, C[35], WA[35], WB[35]);
    arbel A36(X, Y, C[36], WA[36], WB[36]);
    arbel A37(X, Y, C[37], WA[37], WB[37]);
    arbel A38(X, Y, C[38], WA[38], WB[38]);
    arbel A39(X, Y, C[39], WA[39], WB[39]);
    
    arbel A40(X, Y, C[40], WA[40], WB[40]);
    arbel A41(X, Y, C[41], WA[41], WB[41]);
    arbel A42(X, Y, C[42], WA[42], WB[42]);
    arbel A43(X, Y, C[43], WA[43], WB[43]);
    arbel A44(X, Y, C[44], WA[44], WB[44]);
    
    arbel A45(X, Y, C[45], WA[45], WB[45]);
    arbel A46(X, Y, C[46], WA[46], WB[46]);
    arbel A47(X, Y, C[47], WA[47], WB[47]);
    arbel A48(X, Y, C[48], WA[48], WB[48]);
    arbel A49(X, Y, C[49], WA[49], WB[49]);
    
    arbel A50(X, Y, C[50], WA[50], WB[50]);
    arbel A51(X, Y, C[51], WA[51], WB[51]);
    arbel A52(X, Y, C[52], WA[52], WB[52]);
    arbel A53(X, Y, C[53], WA[53], WB[53]);
    arbel A54(X, Y, C[54], WA[54], WB[54]);
    
    arbel A55(X, Y, C[55], WA[55], WB[55]);
    arbel A56(X, Y, C[56], WA[56], WB[56]);
    arbel A57(X, Y, C[57], WA[57], WB[57]);
    arbel A58(X, Y, C[58], WA[58], WB[58]);
    arbel A59(X, Y, C[59], WA[59], WB[59]);
    
    arbel A60(X, Y, C[60], WA[60], WB[60]);
    arbel A61(X, Y, C[61], WA[61], WB[61]);
    arbel A62(X, Y, C[62], WA[62], WB[62]);
    arbel A63(X, Y, C[63], WA[63], WB[63]);
    
    dflipflop(WA[63], WB[63], O);
    
endmodule
