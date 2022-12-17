module subMinus #(parameter N = 8 ) (inputA,inputB,difference,borrow);
input [N-1:0] inputA, inputB;
output [N-1:0] difference;
output borrow;

assign borrow = (inputA >= inputB)? 1'b1 : 1'b0;

assign difference = borrow? inputA - inputB : inputB - inputA;

endmodule