module FA(
            input a,
            input b,
            input cin,
            output sum,
            output carry
            );
assign sum = a ^ b ^ cin;
assign carry = (a & b) | (a & cin) | (b & cin);
endmodule