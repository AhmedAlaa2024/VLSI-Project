module registered_WTM(A, B, Result, clk, reset);

input wire [31:0] A;
input wire [31:0] B;
input wire clk, reset;

output wire [63:0] Result;

wire [31:0] A_IN;
wire [31:0] B_IN;
wire [63:0] Result_OUT;

register #(32) inputReg_1(A, A_IN, clk, reset);
register #(32) inputReg_2(B, B_IN, clk, reset);

WTM32 multiplier(A_IN, B_IN, Result_OUT);

register #(64) outputReg(Result_OUT, Result, clk, reset);

endmodule;