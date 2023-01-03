module mux #(parameter N= 8) (in1, in2, out, sel, enable);
input  wire [DATA_LENGTH-1:0] in1;
input  wire [DATA_LENGTH-1:0] in2;
input  wire 				  sel;
input  wire 				  enable;
output wire [DATA_LENGTH-1:0] out;


assign out = enable? (sel? in1 : in2) : 'bz;


endmodule