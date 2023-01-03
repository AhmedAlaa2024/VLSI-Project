module priority_encoder(
			input [23:0] significand,
			input [7:0] exp_a,
			output reg [23:0] Significand,
			output [7:0] exp_sub,
			input en
			);

reg [4:0] shift;

always @(significand)
begin
if(en==1'b1)begin
	casex (significand)
		24'b1xxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand = significand<<1;
									 				shift = 5'd1;
								 			  	end
		24'b01xx_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			Significand = significand << 2;
									 				shift = 5'd2;
								 			  	end

		24'b001x_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			Significand = significand << 3;
									 				shift = 5'd3;
								 				end

		24'b0001_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin 							
													Significand = significand << 4;
								 	 				shift = 5'd4;
								 				end

		24'b0000_1xxx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				Significand = significand << 5;
								 	 				shift = 5'd5;
								 				end

		24'b0000_01xx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				Significand = significand << 6;
								 	 				shift = 5'd6;
								 				end

		24'b0000_001x_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h020000
									 				Significand = significand << 7;
								 	 				shift = 5'd7;
								 				end

		24'b0000_0001_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h010000
									 				Significand = significand << 8;
								 	 				shift = 5'd8;
								 				end

		24'b0000_0000_1xxx_xxxx_xxxx_xxxx : 	begin						// 24'h008000
									 				Significand = significand << 9;
								 	 				shift = 5'd9;
								 				end

		24'b0000_0000_01xx_xxxx_xxxx_xxxx : 	begin						// 24'h004000
									 				Significand = significand << 10;
								 	 				shift = 5'd10;
								 				end

		24'b0000_0000_001x_xxxx_xxxx_xxxx : 	begin						// 24'h002000
									 				Significand = significand << 11;
								 	 				shift = 5'd11;
								 				end

		24'b0000_0000_0001_xxxx_xxxx_xxxx : 	begin						// 24'h001000
									 				Significand = significand << 12;
								 	 				shift = 5'd12;
								 				end

		24'b0000_0000_0000_1xxx_xxxx_xxxx : 	begin						// 24'h000800
									 				Significand = significand << 13;
								 	 				shift = 5'd13;
								 				end

		24'b0000_0000_0000_01xx_xxxx_xxxx : 	begin						// 24'h000400
									 				Significand = significand << 14;
								 	 				shift = 5'd14;
								 				end

		24'b0000_0000_0000_001x_xxxx_xxxx : 	begin						// 24'h000200
									 				Significand = significand << 15;
								 	 				shift = 5'd15;
								 				end

		24'b0000_0000_0000_0001_xxxx_xxxx  : 	begin						// 24'h000100
									 				Significand = significand << 16;
								 	 				shift = 5'd16;
								 				end

		24'b0000_0000_0000_0000_1xxx_xxxx : 	begin						// 24'h000080
									 				Significand = significand << 17;
								 	 				shift = 5'd17;
								 				end

		24'b0000_0000_0000_0000_01xx_xxxx : 	begin						// 24'h000040
											 		Significand = significand << 18;
										 	 		shift = 5'd18;
												end

		24'b0000_0000_0000_0000_001x_xxxx : 	begin						// 24'h000020
									 				Significand = significand << 19;
								 	 				shift = 5'd19;
								 				end

		24'b0000_0000_0000_0000_0001_xxxx : 	begin						// 24'h000010
									 				Significand = significand << 20;
								 	 				shift = 5'd20;
												end

		24'b0000_0000_0000_0000_0000_1xxx :	begin						// 24'h000008
									 				Significand = significand << 21;
								 					shift = 5'd21;
								 				end

		24'b0000_0000_0000_0000_0000_01xx : 	begin						// 24'h000004
									 				Significand = significand << 22;
								 	 				shift = 5'd22;
								 				end

		24'b0000_0000_0000_0000_0000_001x : 	begin						// 24'h000002
									 				Significand = significand << 23;
								 	 				shift = 5'd23;
								 				end

		24'b0000_0000_0000_0000_0000_0001 : 	begin						// 24'h000001
									 				Significand = significand << 24;
								 	 				shift = 5'd24;
								 				end

		24'b0000_0000_0000_0000_0000_0000 : 	begin						// 24'h000000
								 					Significand = significand << 25;
							 	 					shift = 5'd25;
								 				end
		default : 	begin
						Significand = (~significand) + 1'b1;
						shift = 8'd0;
					end

	endcase
end
else begin
Significand = 24'bz;
end
end
assign exp_sub = (en)?exp_a - shift:8'bz;

endmodule
