module NormalizerAndRounder #(parameter EXPONENT_LENGTH = 8, MANTISSA_LENGTH = 23) (oldExponent, oldMantissa, newExponent, newMantissa, carry,shmat);

input	wire 						carry;
input	wire [EXPONENT_LENGTH-1:0]	oldExponent;
input	wire [MANTISSA_LENGTH-1:0]	oldMantissa;
input   wire [EXPONENT_LENGTH-1:0]  shmat;
output	wire  [EXPONENT_LENGTH-1:0]	newExponent;
output	wire  [MANTISSA_LENGTH-1:0]	newMantissa;

// ControlledShiftRegister #(8, 23) ShiftRegister1 (oldMantissa, Temp_Mantissa, 1'b1, 1'b1, shmat, 1'b1, 1'b0);


assign newExponent = carry? oldExponent + 1'b1 : oldExponent - shmat;
assign newMantissa = carry? oldMantissa >> 1 : oldMantissa << shmat;

// always @ (*)
	// begin
		// if (carry)
			// begin
				// newMantissa = oldMantissa >> 1;
				// newExponent = oldExponent + 1'b1;
			// end
		// // else
			// // begin
				// // newExponent = oldExponent;
				// // newMantissa = oldMantissa;
				// // while(!newMantissa[23])
					// // begin
						// // newMantissa = newMantissa << 1;
						// // newExponent = newExponent - 1'b1;
					// // end
				
			// // end
	// end

endmodule