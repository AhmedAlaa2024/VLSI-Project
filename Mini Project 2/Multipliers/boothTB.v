module TB;
  localparam N = 32;
  localparam T = 100;
  
  reg clk, rst;
  reg signed [N-1: 0] m, q;
  reg signed [2*N-1: 0] result;

  wire [2*N-1: 0] P_kiro, P_khaled;

  //Radix4Booth #(N) booth_multiplier (m, q, P_khaled);
  Booth #(N) booth_multiplier_1 (clk, rst, m, q, P_kiro);

  always #(T/2) clk = ~clk;

  initial begin
    clk=1;

    rst=1;
    m = 6546; 
    q = -12; 
    #100;
    rst=0;
    #(16*100)
    result = m*q; 
    #100

    rst=1;
    m = 234; 
    q = 3452; 
    #100;
    rst=0;
    #(N*100)
    result = m*q; 
    #100

    rst=1;
    m = -500; 
    q = -200; 
    #100;
    rst=0;
    #(N*100)
    result = m*q; 
    #100

    rst=1;
    m = -123; 
    q = 30; 
    #100;
    rst=0;
    #(N*100)
    result = m*q; 
    #100

    rst=1;
    m = 234; 
    q = 0; 
    #100;
    rst=0;
    #(N*100)
    result = m*q; 
    #100

    rst=1;
    m = 1; 
    q = 3452; 
    #100;
    rst=0;
    #(N*100)
    result = m*q; 
    #100

    rst=1;
    m = 4532; 
    q = 3452; 
    #100;
    rst=0;
    #(N*100)
    result = m*q; 
    #100

    rst=1;
    m = 1122; 
    q = 3452; 
    #100;
    rst=0;
    #(N*100)
    result = m*q; 
    #100

    rst = 0;
  end

endmodule
