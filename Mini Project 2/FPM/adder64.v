module adder64(
                input [63:0] x,
                input [63:0] y,
                output [63:0] z,
                output C
                );

wire [63:0] cin;
wire [64:0] carry;

HA H(x[0], y[0], z[0], carry[0]);

genvar i;

generate 
    for(i = 1; i < 64; i = i + 1)
        begin
            FA F(x[i], y[i], carry[i-1], z[i], carry[i]);
        end
endgenerate

assign C = carry[64];

endmodule