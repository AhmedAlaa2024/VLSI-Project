module FPU #(parameter WORD_LENGTH = 32) (A, B, Result);

input [WORD_LENGTH-1:0] A;
input [WORD_LENGTH-1:0] B;
output reg [WORD_LENGTH-1:0] Result;

reg [23:0] A_Mantissa, B_Mantissa;
reg [23:0] Temp_Mantissa;
reg [22:0] Mantissa;
reg [7:0] Exponent;
reg Sign;
reg [7:0] A_Exponent, B_Exponent, diff_Exponent;
reg A_sign, B_sign;
reg carry;
reg comp;
reg [7:0] exp_adjust;

always @ (*)
	begin
		comp =  (A[30:23] >= B[30:23])? 1'b1 : 1'b0;
		
		A_Mantissa = comp ? {1'b1,A[22:0]} : {1'b1,B[22:0]};
		A_Exponent = comp ? A[30:23] : B[30:23];
		A_sign = comp ? A[31] : B[31];
		
		B_Mantissa = comp ? {1'b1,B[22:0]} : {1'b1,A[22:0]};
		B_Exponent = comp ? B[30:23] : A[30:23];
		B_sign = comp ? B[31] : A[31];
		
		diff_Exponent = A_Exponent-B_Exponent;
		B_Mantissa = (B_Mantissa >> diff_Exponent);
		
		{carry,Temp_Mantissa} =  (A_sign ~^ B_sign)? A_Mantissa + B_Mantissa : A_Mantissa-B_Mantissa ;
		
		exp_adjust = A_Exponent;
		
		if(carry)
			begin
				Temp_Mantissa = Temp_Mantissa>>1;
				exp_adjust = exp_adjust+1'b1;
			end
		else
			begin
				while(!Temp_Mantissa[23])
					begin
					   Temp_Mantissa = Temp_Mantissa<<1;
					   exp_adjust =  exp_adjust-1'b1;
					end
			end
			
		Sign = A_sign;
		Mantissa = Temp_Mantissa[22:0];
		Exponent = exp_adjust;
		Result = {Sign, Exponent, Mantissa};
		
	end
	
wire [23:0] temp_1;
wire [23:0] temp_2;
reg  [23:0] temp_3;
	
// adderPlus #(24) adder(A_Mantissa, B_Mantissa, Temp_Mantissa, carry);

endmodule