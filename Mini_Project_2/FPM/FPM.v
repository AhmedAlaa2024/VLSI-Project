module FPM(A, B, Result, Overflow, UnderFlow, Zero);

input [31:0] A;
input [31:0] B;
output [31:0] Result;
output Overflow;
output UnderFlow;
output Zero;

/* Flag for the normalization */
wire NormalizationRequest;

wire [7:0] NormalizedExponent;
wire [7:0] ResultExponent;

wire [23:0] A_Mantissa;
wire [23:0] B_Mantissa;
wire [47:0] Product;
wire [47:0] NormalizedProduct;
wire [22:0] ResultMantissa;

/* Check if one of the 2 operands is zero */
assign Zero = (A == 32'b0) || (B == 32'b0);

/* Calculate the mantissa of the result by multiplying the 2 mantisses of the 2 operands */
assign A_Mantissa[23:0] = (8'b0 | A[30:23]) ? {1'b1,A[22:0]} : {1'b0,A[22:0]};          // Add the leading one in case exponent is not zero
assign B_Mantissa[23:0] = (8'b0 | B[30:23]) ? {1'b1,B[22:0]} : {1'b0,B[22:0]};          // Add the leading one in case exponent is not zero

assign Product = A_Mantissa * B_Mantissa;

/* Normalize the result */
assign NormalizationRequest = Product[47] ? 1'b1 : 1'b0;                          // Check the last bit of the product
assign NormalizedProduct = NormalizationRequest ? Product : Product << 1;         // If It need to normalization, shift the mantissa left by one
assign ResultMantissa = Zero ? 0 : NormalizedProduct[46:24];     // If one of the 2 operands is zero, clear the normalized mantissa

/* Calculate the exponent of the result and normalize it */
assign NormalizedExponent = A[30:23] + B[30:23] - (8'b0111_1111) + NormalizationRequest;      // Add the 2 exponent and subtract 127, then normalized it if it needed
assign ResultExponent = Zero ? 0 : NormalizedExponent;     // If one of the 2 operands is zero, clear the exponent

/* Map the normalized mantissa to the output port (Result) */
assign Result[22:0] =  ResultMantissa[22:0];
/* Map the normalized exponent to the output port (Result) */
assign Result[30:23] = ResultExponent[7:0];

assign Result[31] = Zero ? 0 : (A[31] ^ B[31]);

/* Overall exponent is greater than 255 then Overflow */
assign Overflow = ((Result[30] & !Result[29]) & !(Zero));

/* Sum of exponents is less than 255 then Underflow */
assign UnderFlow = ((Result[30] & Result[29]) & !(Zero)) ? 1'b1 : 1'b0;

endmodule