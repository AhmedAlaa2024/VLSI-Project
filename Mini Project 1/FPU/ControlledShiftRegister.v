module ControlledShiftRegister #(parameter SHIFT_LIMIT = 8, WORD_LENGTH = 8) (data_in, data_out, enable, direction, steps, reset, sign);

input	wire	[WORD_LENGTH-1:0]			data_in;
input	wire								enable;
input	wire								direction;
input	wire	[SHIFT_LIMIT-1:0]			steps;
input	wire								reset;
input	wire								sign;
output	reg		[WORD_LENGTH-1:0]			data_out;
	
integer i;
	
always @ (*)
	begin
		if (!reset)
			begin
				data_out = 0;
			end
		else
			begin
				if (enable)
					begin
						if (direction)
							begin
								data_out = data_in << steps;
							end
						else
							begin
								data_out = data_in;
								for (i = 0; i < steps; i = i + 1)
									begin
										data_out = {sign, data_out[WORD_LENGTH-1:1]};
									end
							end
					end
				else
					begin
						data_out = data_out;
					end
			end
	end

endmodule