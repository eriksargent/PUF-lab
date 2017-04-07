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


(* keep_hierarchy = "yes" *) module arbiter(
    input X,
    input Y,
    input [63:0]C,
    output O
    );
        
    wire [63:0]WA;
    wire [63:0]WB;
    
    arbel A0(X, Y, C[0], WA[0], WB[0]);
    arbel A1(WA[0], WB[0], C[1], WA[1], WB[1]);
    arbel A2(WA[1], WB[1], C[2], WA[2], WB[2]);
    arbel A3(WA[2], WB[2], C[3], WA[3], WB[3]);
    arbel A4(WA[3], WB[3], C[4], WA[4], WB[4]);
    
    arbel A5(WA[4], WB[4], C[5], WA[5], WB[5]);
    arbel A6(WA[5], WB[5], C[6], WA[6], WB[6]);
    arbel A7(WA[6], WB[6], C[7], WA[7], WB[7]);
    arbel A8(WA[7], WB[7], C[8], WA[8], WB[8]);
    arbel A9(WA[8], WB[8], C[9], WA[9], WB[9]);
    
    arbel A10(WA[9], WB[9], C[10], WA[10], WB[10]);
    arbel A11(WA[10], WB[10], C[11], WA[11], WB[11]);
    arbel A12(WA[11], WB[11], C[12], WA[12], WB[12]);
    arbel A13(WA[12], WB[12], C[13], WA[13], WB[13]);
    arbel A14(WA[13], WB[13], C[14], WA[14], WB[14]);
    
    arbel A15(WA[14], WB[14], C[15], WA[15], WB[15]);
    arbel A16(WA[15], WB[15], C[16], WA[16], WB[16]);
    arbel A17(WA[16], WB[16], C[17], WA[17], WB[17]);
    arbel A18(WA[17], WB[17], C[18], WA[18], WB[18]);
    arbel A19(WA[18], WB[18], C[19], WA[19], WB[19]);
    
    arbel A20(WA[19], WB[19], C[20], WA[20], WB[20]);
    arbel A21(WA[20], WB[20], C[21], WA[21], WB[21]);
    arbel A22(WA[21], WB[21], C[22], WA[22], WB[22]);
    arbel A23(WA[22], WB[22], C[23], WA[23], WB[23]);
    arbel A24(WA[23], WB[23], C[24], WA[24], WB[24]);
    
    arbel A25(WA[24], WB[24], C[25], WA[25], WB[25]);
    arbel A26(WA[25], WB[25], C[26], WA[26], WB[26]);
    arbel A27(WA[26], WB[26], C[27], WA[27], WB[27]);
    arbel A28(WA[27], WB[27], C[28], WA[28], WB[28]);
    arbel A29(WA[28], WB[28], C[29], WA[29], WB[29]);
    
    arbel A30(WA[29], WB[29], C[30], WA[30], WB[30]);
    arbel A31(WA[30], WB[30], C[31], WA[31], WB[31]);
    arbel A32(WA[31], WB[31], C[32], WA[32], WB[32]);
    arbel A33(WA[32], WB[32], C[33], WA[33], WB[33]);
    arbel A34(WA[33], WB[33], C[34], WA[34], WB[34]);
    
    arbel A35(WA[34], WB[34], C[35], WA[35], WB[35]);
    arbel A36(WA[35], WB[35], C[36], WA[36], WB[36]);
    arbel A37(WA[36], WB[36], C[37], WA[37], WB[37]);
    arbel A38(WA[37], WB[37], C[38], WA[38], WB[38]);
    arbel A39(WA[38], WB[38], C[39], WA[39], WB[39]);
    
    arbel A40(WA[39], WB[39], C[40], WA[40], WB[40]);
    arbel A41(WA[40], WB[40], C[41], WA[41], WB[41]);
    arbel A42(WA[41], WB[41], C[42], WA[42], WB[42]);
    arbel A43(WA[42], WB[42], C[43], WA[43], WB[43]);
    arbel A44(WA[43], WB[43], C[44], WA[44], WB[44]);
    
    arbel A45(WA[44], WB[44], C[45], WA[45], WB[45]);
    arbel A46(WA[45], WB[45], C[46], WA[46], WB[46]);
    arbel A47(WA[46], WB[46], C[47], WA[47], WB[47]);
    arbel A48(WA[47], WB[47], C[48], WA[48], WB[48]);
    arbel A49(WA[48], WB[48], C[49], WA[49], WB[49]);
    
    arbel A50(WA[49], WB[49], C[50], WA[50], WB[50]);
    arbel A51(WA[50], WB[50], C[51], WA[51], WB[51]);
    arbel A52(WA[51], WB[51], C[52], WA[52], WB[52]);
    arbel A53(WA[52], WB[52], C[53], WA[53], WB[53]);
    arbel A54(WA[53], WB[53], C[54], WA[54], WB[54]);
    
    arbel A55(WA[54], WB[54], C[55], WA[55], WB[55]);
    arbel A56(WA[55], WB[55], C[56], WA[56], WB[56]);
    arbel A57(WA[56], WB[56], C[57], WA[57], WB[57]);
    arbel A58(WA[57], WB[57], C[58], WA[58], WB[58]);
    arbel A59(WA[58], WB[58], C[59], WA[59], WB[59]);
    
    arbel A60(WA[59], WB[59], C[60], WA[60], WB[60]);
    arbel A61(WA[60], WB[60], C[61], WA[61], WB[61]);
    arbel A62(WA[61], WB[61], C[62], WA[62], WB[62]);
    arbel A63(WA[62], WB[62], C[63], WA[63], WB[63]);
    
    dflipflop DFF(WA[63], WB[63], O);
    
endmodule
