module testbench();

localparam EXPONENT_LENGTH = 8, MANTISSA_LENGTH = 23;
localparam T = 20;

reg [EXPONENT_LENGTH+MANTISSA_LENGTH:0] A_input [4:0];
reg [EXPONENT_LENGTH+MANTISSA_LENGTH:0] B_input [4:0];
wire [EXPONENT_LENGTH+MANTISSA_LENGTH:0] C_input [4:0];

reg [EXPONENT_LENGTH+MANTISSA_LENGTH:0] A, B;
wire [EXPONENT_LENGTH+MANTISSA_LENGTH:0] Sum;

assign A_input[0] = 32'h40480000; assign B_input[0] = 32'h40480000; assign C_input[0] = 32'h40c80000;
assign A_input[1] = 32'h40200000; assign B_input[1] = 32'h40a40000; assign C_input[1] = 32'h40f40000;
assign A_input[2] = 32'h3d800000; assign B_input[2] = 32'h3e000000; assign C_input[2] = 32'h3e400000;
assign A_input[3] = 32'h40a80000; assign B_input[3] = 32'hc0440000; assign C_input[3] = 32'h400c0000;
assign A_input[4] = 32'hc0a80000; assign B_input[4] = 32'hc0480000; assign C_input[4] = 32'hc1060000;

wire Cout;

wire overflow;
wire underflow;
wire exception;

integer i;

FPA fpa(A, B, Sum, Cout, overflow, underflow, exception);

initial 
begin
for (i = 0; i < 5; i=i+1) begin
   #T 
   A = A_input[i];
   B = B_input[i];

    if(Sum == C_input[i])
        $display("Test case %d success: A = %h , B = %h | C %h",i,A_input[i],B_input[i],Sum);
    else
        $display("Test case %d fail: A = %h , B = %h | output %h, trueSum %h",i,A_input[i],B_input[i],Sum,C_input[i]);
    $display("");
end

end
endmodule