module sequential_multiplier_tb;
parameter N=32;
reg clk = 0, start;
reg [N-1:0] multiplicand;
reg [N-1:0] multiplier;
reg reset=0;
reg en=1;
wire [2*N-1:0] product;

sequential_multiplier mult (clk,start,multiplicand, multiplier, product,reset,en);

always begin #1 clk = ~ clk ;end
	initial begin

	       
                // +ve * +ve
		start = 1;
		multiplicand = 32'd7;
		multiplier = 32'd2; //result = 14
		#5 
                start =0;
                #100

                if(product != 64'd14)
	        $display("TestCase#1: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#1: success input %b and %b and Output %b", multiplicand , multiplier , product);                

                // -ve * +ve
		 
                start = 1;
	        multiplicand = -32'd7;
	        multiplier = 32'd3; //result = -21
		#5 
                start = 0;
                #100 

                if(product != -64'd21)
	        $display("TestCase#2: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#2: success input %b and %b and Output %b", multiplicand , multiplier , product);  

                // 0 * -ve
		
                start = 1;
	        multiplicand = 32'd0;
	        multiplier = -32'd60; //result = 0
		#5 
                start =0;
                #100 

                if(product != 64'd0)
	        $display("TestCase#3: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#3: success input %b and %b and Output %b", multiplicand , multiplier , product);                  

                // +ve * -ve
		#100 
                start = 1;
	        multiplicand = 32'd20;
	        multiplier = -32'd10; //result = -200
		#5 
                start =0;
                #100 

                if(product != -64'd200)
	        $display("TestCase#4: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#4: success input %b and %b and Output %b", multiplicand , multiplier , product);    

                // -ve * 0
		
                start = 1;
	        multiplicand = -32'd80;
	        multiplier = 32'd0; //result = 0
		#5 
                start =0;  
                #100 

                if(product != 64'd0)
	        $display("TestCase#5: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#5: success input %b and %b and Output %b", multiplicand , multiplier , product);               

                // -ve * -ve
		 
                start = 1;
	        multiplicand = -32'd2;
	        multiplier = -32'd2; //result = 2
		#5 
                start =0;
                #100 

                if(product != 64'd4)
	        $display("TestCase#6: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#6: success input %b and %b and Output %b", multiplicand , multiplier , product);   

                // 0 * +ve
                
                start = 1;
	        multiplicand = 32'd0;
	        multiplier = 32'd3; //result = 0
		#5 
                start = 0;
                #100 

                if(product != 64'd0)
	        $display("TestCase#7: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#7: success input %b and %b and Output %b", multiplicand , multiplier , product);   

                // +ve * 0
                
                start = 1;
	        multiplicand = 32'd5;
	        multiplier = 32'd0; //result = 0
		#5 
                start = 0;    
                #100 

                if(product != 64'd0)
	        $display("TestCase#8: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#8: success input %b and %b and Output %b", multiplicand , multiplier , product);                   

                // -ve * +ve
                
                start = 1;
	        multiplicand = -32'd19;
	        multiplier = 32'd3; //result = -57
		#5 
                start = 0;
                #100 

                if(product != -64'd57)
	        $display("TestCase#9: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#9: success input %b and %b and Output %b", multiplicand , multiplier , product);                   

                // +ve * -ve
                
                start = 1;
	        multiplicand = 32'd2;
	        multiplier = -32'd125; //result = -250 
		#5 
                start = 0;     
                #100 

                if(product != -64'd250)
	        $display("TestCase#10: failed with input %b and %b and Output %b", multiplicand , multiplier , product);
	        else
                $display("TestCase#10: success input %b and %b and Output %b", multiplicand , multiplier , product);            
		
	end
endmodule
