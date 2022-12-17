module WTM32(A, B, Result);
    
input [31:0] A;
input [31:0] B;
output [63:0] Result;

wire [7:0] Multiplicand [3:0];
wire [7:0] Multiplier [3:0];
wire [63:0] couple [7:0];
wire [63:0] Product [15:0];
wire [15:0] P [15:0];
wire [63:0] Quadruple [3:0];
wire [63:0] Eight [1:0];
wire [13:0] Carry;

assign Multiplicand[0] = A[7:0];
assign Multiplicand[1] = A[15:8];
assign Multiplicand[2] = A[23:16];
assign Multiplicand[3] = A[31:24];

assign Multiplier[0] = B[7:0];
assign Multiplier[1] = B[15:8];
assign Multiplier[2] = B[23:16];
assign Multiplier[3] = B[31:24];

// Multiply each bit of the argument A by each bit of the other product B
WTM8 M0(Multiplicand[0], Multiplier[0], P[0]);
WTM8 M1(Multiplicand[0], Multiplier[1], P[1]);
WTM8 M2(Multiplicand[0], Multiplier[2], P[2]);
WTM8 M3(Multiplicand[0], Multiplier[3], P[3]);
WTM8 M4(Multiplicand[1], Multiplier[0], P[4]);
WTM8 M5(Multiplicand[1], Multiplier[1], P[5]);
WTM8 M6(Multiplicand[1], Multiplier[2], P[6]);
WTM8 M7(Multiplicand[1], Multiplier[3], P[7]);
WTM8 M8(Multiplicand[2], Multiplier[0], P[8]);
WTM8 M9(Multiplicand[2], Multiplier[1], P[9]);
WTM8 M10(Multiplicand[2], Multiplier[2], P[10]);
WTM8 M11(Multiplicand[2], Multiplier[3], P[11]);
WTM8 M12(Multiplicand[3], Multiplier[0], P[12]);
WTM8 M13(Multiplicand[3], Multiplier[1], P[13]);
WTM8 M14(Multiplicand[3], Multiplier[2], P[14]);
WTM8 M15(Multiplicand[3], Multiplier[3], P[15]);

// Shift all the levels to prepare them to be added together
assign Product[0] = {48'b0, P[0][15:0]};

assign Product[1] = {40'b0, P[1][15:0], 8'b0};
assign Product[4] = {40'b0, P[4][15:0], 8'b0};

assign Product[2] = {40'b0, P[2][15:0], 16'b0};
assign Product[5] = {40'b0, P[5][15:0], 16'b0};
assign Product[8] = {40'b0, P[8][15:0], 16'b0};

assign Product[3] = {32'b0, P[3][15:0], 24'b0};
assign Product[6] = {32'b0, P[6][15:0], 24'b0};
assign Product[9] = {24'b0, P[9][15:0], 24'b0};
assign Product[12] = {24'b0, P[12][15:0], 24'b0};

assign Product[7] =  {16'b0, P[7][15:0], 32'b0};
assign Product[10] = {16'b0, P[10][15:0], 32'b0};
assign Product[13] = {16'b0, P[13][15:0], 32'b0};

assign Product[11] = {8'b0, P[11][15:0], 40'b0};
assign Product[14] = {8'b0, P[14][15:0], 40'b0};

assign Product[15] = {8'b0, P[15][15:0], 48'b0};

adder64 A0(Product[0], Product[1], couple[0], Carry[0]);
adder64 A1(Product[2], Product[3], couple[1], Carry[1]);
adder64 A2(Product[4], Product[5], couple[2], Carry[2]);
adder64 A3(Product[6], Product[7], couple[3], Carry[3]);
adder64 A4(Product[8], Product[9], couple[4], Carry[4]);
adder64 A5(Product[10], Product[11], couple[5], Carry[5]);
adder64 A6(Product[12], Product[13], couple[6], Carry[6]);
adder64 A7(Product[14], Product[15], couple[7], Carry[7]);

adder64 A8(couple[0], couple[1], Quadruple[0], Carry[8]);
adder64 A9(couple[2], couple[3], Quadruple[1], Carry[9]);
adder64 A10(couple[4], couple[5], Quadruple[2], Carry[10]);
adder64 A11(couple[6], couple[7], Quadruple[3], Carry[11]);

adder64 A12(Quadruple[0], Quadruple[1], Eight[0], Carry[12]);
adder64 A13(Quadruple[2], Quadruple[3], Eight[1], Carry[13]);

adder64 A14(Eight[0], Eight[1], Result, Carry[14]);

endmodule