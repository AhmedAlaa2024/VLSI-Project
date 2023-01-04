module registerNbits #(parameter N = 32) (clk,reset,en, inp, out);
	input clk,reset,en;
	output  reg signed[N-1:0] out;
	input signed [N-1:0] inp;
	always @(posedge clk)
		begin
			if (reset) 
				out <= 'b0;
			else if(en)
				out <= inp;
			
		end
endmodule


module registered_FPM #(parameter N = 32 ) (clk,reset,en,A,B,Result,Overflow, UnderFlow, Zero);


input clk,reset,en;

input signed [N-1:0] A, B;
output  signed [N-1:0] Result;
output Overflow, UnderFlow, Zero;
wire [N-1:0] A_reg;
wire [N-1:0] B_reg;
wire [N-1:0] out_reg;
wire out_OF, out_UF, out_ZF;


registerNbits #(32) regA (clk,reset,en,A, A_reg);
registerNbits #(32) regB (clk,reset,en,B, B_reg);
FPM mult (A_reg, B_reg, out_reg, out_OF, out_UF, out_ZF);
registerNbits #(35) out (clk, reset, en, {out_reg, out_OF, out_UF, out_ZF}, {Result, Overflow, UnderFlow, Zero});

endmodule


