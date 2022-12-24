module register #(parameter WORD_LENGTH = 32) (DATA_IN, DATA_OUT, clk, reset);

input wire [WORD_LENGTH-1:0] DATA_IN;
output wire [WORD_LENGTH-1:0] DATA_OUT;
input clk, reset;

reg [WORD_LENGTH-1:0] DATA;

/* Asynchronous read for the data in the register */
assign DATA_OUT[WORD_LENGTH-1:0] = DATA[WORD_LENGTH-1:0];

/* Synchronous write into the register's data */
always @(posedge clk) 
    begin
        if (!reset)
            begin
                DATA <= 'b0;
            end
        else
            begin
                DATA[WORD_LENGTH-1:0] <= DATA_IN[WORD_LENGTH-1:0];
            end
    end
endmodule