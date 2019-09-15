module heater_control(	input 	wire 				clk,
								input		wire	[11:0]	temp,
								input 	wire	[11:0]	temp_bottom,
								input		wire	[11:0]	temp_upper,
								input		wire	[1:0]		control,
								output	wire				enable_heater);
	reg en = 1'b0;
	reg f = 1'b1;
	assign enable_heater = en;
	
	always @(posedge clk)
	begin
		if (control[0] == 1'b0)
			f = 1'b1;
			
		if (control[0] == 1'b1) //нагрев	
		begin
			if (f == 1'b1)
				if (temp <= temp_upper)
				begin
					en = 1'b0;
					f = 1'b0;
				end
				else
					en = 1'b1;
		end
		else 
		begin 
			if (control[1] == 1'b1) //нагрев и удержание
			begin
				if (temp <= temp_upper)
					en = 1'b0;
				else
					if (temp >= temp_bottom)
						en = 1'b1;
			end
			else
				en = 1'b0;
		end
	end

endmodule
