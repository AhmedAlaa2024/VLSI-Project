module registered_WTM_tb();

localparam PERIOD = 100;

reg [31:0] A;
reg [31:0] B;

wire [63:0] Result;
reg clk, reset;

reg [5:0] counter;

registered_WTM multiplier(A, B, Result, clk, reset);

initial 
    begin
        
    end

always
    begin
        clk = 0;
        reset = 1;
        counter = 0;

        $display("---------------- Testcase #1 ----------------");
        A = 32'b01111101;
        B = 32'b00100110;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 64'b0001_0010_1000_1110)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #2 ----------------");
        A = 32'b10000011;
        B = 32'b00100110;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 4978)
            $display("Succeeded!");
        else
            $display("Failed!");
            
        $display("---------------- Testcase #3 ----------------");
        A = 32'b01111101;
        B = 32'b11011010;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 27250)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #4 ----------------");
        A = 32'b10000011;
        B = 32'b11011010;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 28558)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #5 ----------------");
        A = 32'b01111111111111111111111111111111;
        B = 32'b01111111111111111111111111111111;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 64'd4611686014132420609)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #6 ----------------");
        A = 32'b11111111111111111111111110000011;
        B = 32'b00100110;
        counter = counter + 1;

        #(PERIOD);
        if (Result == -4750)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #7 ----------------");
        A = 32'b01111101;
        B = 32'b11111111111111111111111111011010;
        counter = counter + 1;

        #(PERIOD);
        if (Result == -4750)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #8 ----------------");
        A = 32'b11111111111111111111111110000011;
        B = 32'b11111111111111111111111111011010;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 4750)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #9 ----------------");
        A = 32'b10000000000000000000000000000000;
        B = 32'b01111111111111111111111111111111;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 64'hC000000080000000)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #10 ----------------");
        A = 32'b01111111111111111111111111111111;
        B = 32'b10000000000000000000000000000000;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 64'hC000000080000000)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #11 ----------------");
        A = 32'b10000000000000000000000000000000;
        B = 32'b10000000000000000000000000000000;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 64'h4000000000000000)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #12 ----------------");
        A = 32'b00000000000000000000000000000000;
        B = 32'b00000000000000000000000000000101;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 0)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #13 ----------------");
        A = 32'b00000000000000000000000000000001;
        B = 32'b00000000000000000000000000000101;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 5)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #14 ----------------");
        A = 32'b00000000000000000000000000000000;
        B = 32'b11111111111111111111111111111011;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 0)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #15 ----------------");
        A = 32'b00000000000000000000000000000001;
        B = 32'b11111111111111111111111111111011;
        counter = counter + 1;

        #(PERIOD);
        if (Result == -5)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #16 ----------------");
        A = 32'b11111111111111111111111111111111;
        B = 32'b11111111111111111111111111111011;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 5)
            $display("Succeeded!");
        else
            $display("Failed!");

        $display("---------------- Testcase #17 ----------------");
        A = 32'b00000000000000000000000000000000;
        B = 32'b00000000000000000000000000000000;
        counter = counter + 1;

        #(PERIOD);
        if (Result == 0)
            $display("Succeeded!");
        else
            $display("Failed!");

        #(PERIOD);
        #(PERIOD);
    end

always
    begin
        #(PERIOD / 4);
        clk = ~clk;
    end

endmodule;