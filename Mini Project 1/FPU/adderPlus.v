module adderPlus #(parameter N = 16 ) (inputA,inputB,Sum,Carry);
input [N-1:0] inputA, inputB;
output [N-1:0] Sum;
output Carry;

assign {Carry,Sum} = inputA + inputB;

endmodule