module TB;
  localparam N = 8;
  localparam T = 100;
  
  reg clk, rst;
  reg [N-1: 0] m, q;
  reg [2*N-1: 0] result;

  wire [2*N-1: 0] P;

  Booth #(N) booth_multiplier (clk, rst, m, q, P);


  always #(T/2) clk = ~clk;

  initial begin
    clk=1;

    rst=1;
    m = 8'b01111101; //125
    q = 8'b00100110; //38
    #100;
    rst=0;
    #(8*100)
    result = 16'b0001_0010_1000_1110; //4750
    #100

    rst=1;
    m = 8'b10100001; //-95
    q = 8'b00100110; //38
    #100;
    rst=0;
    #(8*100)
    result = 16'b1111_0001_1110_0110; //-3610
    #100

    rst = 0;

    //$display("clk %d rst %d opcode %d src %d dst %d shiftamount %d regWrite %d WD %d WA_3 %d Rsrc_out_2 %d Rdst_out_2 %d Imm_out_2 %d MEM_signals_out_2 %p EX_signals_out_2 %p WB_signals_out_2,flags_out,ALU_Out_2 %p %d",clk, rst, opcode,src,dst,shiftamount, regWrite, WD, WA_3, Rsrc_out_2, Rdst_out_2,Imm_out_2, MEM_signals_out_2, EX_signals_out_2, WB_signals_out_2,flags_out,ALU_Out_2); 
  end

endmodule