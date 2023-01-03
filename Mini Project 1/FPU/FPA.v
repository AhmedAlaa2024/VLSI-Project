module FPA #(parameter EXPONENT_LENGTH = 8, MANTISSA_LENGTH = 23) (A, B, Sum, Cout, overflow, underflow, exception);

input  wire [EXPONENT_LENGTH+MANTISSA_LENGTH:0]   A;
input  wire [EXPONENT_LENGTH+MANTISSA_LENGTH:0]   B;
output wire [EXPONENT_LENGTH+MANTISSA_LENGTH:0]   Sum;
output wire						  				  Cout;
output wire 				  					  overflow;
output wire 				  					  underflow;
output wire 				  					  exception;

wire 		[MANTISSA_LENGTH:0]			  	  	  A_mantissa;
wire 		[MANTISSA_LENGTH:0]			  	  	  B_mantissa;

wire 		[MANTISSA_LENGTH:0]			  	  	  Temp_mantissa;
wire		[EXPONENT_LENGTH-1:0]			  	  Temp_exponent;

wire 						  					  borrow;
wire		[EXPONENT_LENGTH-1:0]			  	  shmat;

wire		[MANTISSA_LENGTH:0]			  	  	  B_mantissa_shifted;

wire		[23:0]			  	  				  Temp_sum;
wire		[23:0]								  Normalized_Sum;
wire		[31:0]								  Final_Sum;
wire		    			  	  				  Temp_carry;
wire											  Temp_Sign1;
wire											  Temp_Sign2;
wire											  cond;

wire		[23:0]								  Opd1;
wire		[23:0]								  Opd2;

/************************* Enable Signals *************************/
// This enable signals in case we want to apply pipeline concepts
wire		[2:0]			  					  mux_es;
wire						  					  controlledShiftRegister_es;
wire						  					  controlledShiftRegister_dir_s;
wire						  					  controlledShiftRegister_reset_s;

// Because there is no pipelines for now, we will set all the enable signals
assign mux_es = 3'b1;
assign controlledShiftRegister_es = 1;
assign controlledShiftRegister_dir_s = 0;
assign controlledShiftRegister_reset_s = 1;

/********************* Code Starts here ***************************/

subMinus #(8) subtractor (A[30:23], B[30:23], shmat, borrow);

assign A_mantissa[23:0] = (borrow == 1'b1)?((A[30:23] == 8'b0)?   {1'b0,A[22:0]}:{1'b1,A[22:0]})  :   (   (B[30:23] == 8'b0)?   {1'b0,B[22:0]}:{1'b1,B[22:0]});
assign Temp_Sign1 = (borrow==1'b1)?A[31]:B[31];
assign B_mantissa[23:0] = (borrow == 1'b0)?((A[30:23] == 8'b0)?{1'b0,A[22:0]}:{1'b1,A[22:0]}):((B[30:23] == 8'b0)?{1'b0,B[22:0]}:{1'b1,B[22:0]});
assign Temp_Sign2 = (borrow==1'b1)? A[31]:B[31];

// mux23 mux_1 (.in1(A[22:0]), .in2(B[22:0]), .out(A_mantissa[22:0]), .sel(borrow), .enable(1'b1));
// mux #(1) mux_2 (A[31], B[31], Temp_Sign1, borrow, 1'b1);
// mux	#(MANTISSA_LENGTH) mux_3 (.in1(A[22:0]), .in2(B[22:0]), .out(B_mantissa[22:0]), .sel(~borrow), .enable(1'b1));
// mux #(1) mux_4 (A[31], B[31], Temp_Sign2, ~borrow, 1'b1);


assign cond = (A[31] ^ B[31]);





ControlledShiftRegister #(8, MANTISSA_LENGTH+1) ShiftRegister (B_mantissa, B_mantissa_shifted, controlledShiftRegister_es, controlledShiftRegister_dir_s, shmat, controlledShiftRegister_reset_s, Temp_Sign2);

assign Opd1 = (cond & Temp_Sign1)? ((~A_mantissa)+1) : A_mantissa;
assign Opd2 = (cond & Temp_Sign2)? ((~B_mantissa_shifted)+1) : B_mantissa_shifted;

// [TODO] Add the cin, overflow signals wire here!
adderPlus #(24) adder (Opd1, Opd2, Temp_sum ,Temp_carry);

//assign Cout = Temp_carry;


assign Temp_exponent = (borrow==1'b1)? A[30:23]:B[30:23];
//mux	#(8) mux_5 (.in1(A[30:23]), .in2(B[30:23]), .out(Temp_exponent), .sel(borrow), .enable(1'b1));

assign Final_Sum[22:0]=(Temp_carry==1'b1)?Temp_sum[23:1]:Temp_sum[22:0];
assign Final_Sum[30:23]=(Temp_carry==1'b1)?Temp_exponent+1'b1:Temp_exponent;
//NormalizerAndRounder #(8, 24) normalizerAndRounder (.oldMantissa(Final_Sum[23:0]), .oldExponent(Temp_exponent), .newMantissa(Temp_mantissa), .newExponent(Sum[30:23]), .carry(Cout), .shmat(shmat));

// assign Sum[MANTISSA_LENGTH] = Temp_Carry;
assign Sum[30:0] = Final_Sum[30:0];
assign Sum[31] = ~borrow? B[31] : A[31];

/********************* Code Ends here *****************************/

endmodule