module WTM8(A, B, Result);

    input [7:0] A, B;
    output [15:0] Result;

    // wire [7:0] A, B;
	// wire [15:0] Result;

    wire [7:0] P [7:0];

    wire [63:1] C;
    wire [53:1] S;

    // assign A = (a[7] == 1)? ((~a) + 1) : a;
    // assign B = (b[7] == 1)? ((~b) + 1) : b;


    genvar i;
    genvar j;

    generate
        // Multiply (AND) each bit of the argument A by each bit of the other product B
        for(i = 0; i < 8; i = i + 1)
            begin
                for(j = 0; j < 8; j = j + 1)
                    begin
                        assign P[i][j] = A[j] & B[i];
                    end
            end
    endgenerate

    assign Result[0] = P[0][0];
    
    // Reduce the number of partial product to 2 by layer of FAs (Act as 3:2 compressors) & HAs
    HA H0(P[0][1], P[1][0], S[1], C[1]);
    FA F0(P[0][2], P[1][1], P[2][0], S[2], C[2]);
    FA F1(P[0][3], P[1][2], P[2][1], S[3], C[3]);
    FA F2(P[0][4], P[1][3], P[2][2], S[4], C[4]);
    FA F3(P[0][5], P[1][4], P[2][3], S[5], C[5]);
    FA F4(P[0][6], P[1][5], P[2][4], S[6], C[6]);
    FA F5(P[0][7], P[1][6], P[2][5], S[7], C[7]);

    HA H1(P[1][7], P[2][6], S[8], C[8]);

    FA F6(P[2][7], P[3][6], P[4][5], S[9], C[9]);
    HA H2(P[3][1], P[4][0], S[10], C[10]);
    FA F7(P[3][2], P[4][1], P[5][0], S[11], C[11]);
    FA F8(P[3][3], P[4][2], P[5][1], S[12], C[12]);
    FA F9(P[3][4], P[4][3], P[5][2], S[13], C[13]);
    FA F10(P[3][5], P[4][4], P[5][3], S[14], C[14]);
    FA F11(P[3][7], P[4][6], P[5][5], S[15], C[15]);

    HA H3(P[4][7], P[5][6], S[16], C[16]);	




    assign Result[1] = S[1];
    HA H4(S[2], C[1], S[17], C[17]);
    FA F12(S[3], C[2], P[3][0], S[18], C[18]);
    FA F13(S[4], C[3], S[10], S[19], C[19]);		
    FA F14(S[5], C[4], S[11], S[20], C[20]);
    FA F15(S[6], C[5], S[12], S[21], C[21]);  	
    FA F16(S[7], C[6], S[13], S[22], C[22]);
    FA F17(S[8], C[7], S[14], S[23], C[23]);
    FA F18(S[9], C[8], C[14], S[24], C[24]);
    FA F19(C[9], P[6][4], P[7][3], S[29], C[29]);		
    FA F20(C[15], P[6][5], P[7][4], S[30], C[30]);
    FA F21(P[5][7], P[6][6], P[7][5], S[31], C[31]);
    HA H5(P[6][7], P[7][6], S[32], C[32]);
    HA H6(P[6][0], C[11], S[25], C[25]);
    FA F22(C[12], P[6][1], P[7][0], S[26], C[26]);
    FA F23(C[13], P[6][2], P[7][1], S[27], C[27]);
    FA F24(P[5][4], P[6][3], P[7][2], S[28], C[28]);

    assign Result[2] = S[17];
    HA H7(S[18], C[17], S[33], C[33]);
    HA H8(S[19], C[18], S[34], C[34]);
    FA F25(S[20], C[19], C[10], S[35], C[35]);
    FA F26(S[21], C[20], S[25], S[36], C[36]);
    FA F27(S[22], C[21], S[26], S[37], C[37]);
    FA F28(S[23], C[22], S[27], S[38], C[38]);
    FA F29(S[24], C[23], S[28], S[39], C[39]);
    FA F30(S[15], C[24], S[29], S[40], C[40]);
    HA H9(S[16], S[30], S[41], C[41]);
    HA H10(C[16], S[31], S[42], C[42]);

    assign Result[3] = S[33];
    HA H11(S[34], C[33], S[43], C[43]);
    HA H12(S[35], C[34], S[44], C[44]);
    HA H13(S[36], C[35], S[45], C[45]);
    FA F31(S[37], C[36], C[25], S[46], C[46]);
    FA F32(S[38], C[37], C[26], S[47], C[47]);	
    FA F33(S[39], C[38], C[27], S[48], C[48]);
    FA F34(S[40], C[39], C[28], S[49], C[49]);	
    FA F35(S[41], C[40], C[29], S[50], C[50]);	
    FA F36(S[42], C[30], C[41], S[51], C[51]);	
    FA F37(C[42], S[32], C[31], S[52], C[52]);	
    HA H14(P[7][7], C[32], S[53], C[53]);

    assign Result[4] = S[43];
    HA H15(S[44], C[43], Result[5], C[54]);
    FA F38(S[45], C[44], C[54], Result[6], C[55]);	
    FA F39(S[46], C[45], C[55], Result[7], C[56]);
    FA F40(S[47], C[46], C[56], Result[8], C[57]);
    FA F41(S[48], C[47], C[57], Result[9], C[58]);
    FA F42(S[49], C[48], C[58], Result[10], C[59]);
    FA F43(S[50], C[49], C[59], Result[11], C[60]);
    FA F44(S[51], C[50], C[60], Result[12], C[61]);
    FA F45(S[52], C[51], C[61], Result[13], C[62]);
    FA F46(S[53], C[52], C[62], Result[14], C[63]);
    assign Result[15] = C[53];

    // assign out = ((a[7] == 1) ^ (b[7] == 1))? (~Result + 1) : Result;
      
	 
endmodule