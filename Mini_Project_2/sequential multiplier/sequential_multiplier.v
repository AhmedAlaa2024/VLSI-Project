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





module sequential_multiplier (multiplicand, multiplier, clk, reset, C); //multiplicand * multiplier
  localparam n = 32;
  
  input [n-1:0] multiplicand, multiplier;
  input clk, reset;
  output [2*n-1:0] C;
  reg [2*n-1:0] product;
  
  reg carry;
  reg [n-1:0] accumulator, multiplier_register, counter, multiplicand_register;
  
  wire [n-1:0] multiplicand_reg;
 	wire [n-1:0] multiplier_reg;


registerNbits #(32) regmultiplicand (clk,1'b0,1'b1,multiplicand, multiplicand_reg);
registerNbits #(32) regmultiplier (clk,1'b0,1'b1,multiplier, multiplier_reg);

registerNbits #(64) out (clk,1'b0,1'b1,product,C);
  
always@(posedge reset) begin
  if(reset)
      begin
        counter = 0;
        carry = 1'b0;
        accumulator = 0;
        if(multiplier[n-1]==1'b0 && multiplicand[n-1]==1'b0 || multiplier[n-1]==1'b0 && multiplicand[n-1]==1'b1) begin //positive*positive or negative*positive
          multiplier_register = multiplier_reg;
          multiplicand_register = multiplicand_reg;
        end
       else if(multiplier[n-1]==1'b1 && multiplicand[n-1]==1'b0) begin //positive*negative
          multiplier_register = multiplicand_reg;
          multiplicand_register = multiplier_reg; 
        end
        else if(multiplier[n-1]==1'b1 && multiplicand[n-1]==1'b1) begin//negative*negative
          multiplier_register = ~(multiplier_reg-1);
          multiplicand_register = ~(multiplicand_reg-1);
        end
      end
end
  always@(posedge clk) 
  begin
  if(counter < n && !reset)
      begin
        if(multiplier_register[0] == 1'b1)
            {carry,accumulator} = accumulator + multiplicand_register;
        else 
          accumulator = accumulator;
      end
    else product = {accumulator,multiplier_register}; 
    end
  always@(negedge clk)
  begin
  if(counter < n && !reset)
      begin
         multiplier_register = multiplier_register >> 1;
         multiplier_register[n-1] = accumulator[0];
         accumulator = accumulator >> 1;
         accumulator[n-1] = (multiplier[n-1]==1'b0 && multiplicand[n-1]==1'b1 || multiplier[n-1]==1'b1 && multiplicand[n-1]==1'b0)? 1'b1:carry; 
         carry = 0;
         counter = counter + 1;
      end   
    end
       
endmodule 
    

