module endstop_filter(	input 	wire	clk,
								input		wire	in,
								output	reg	out = 0);

	reg [31:0] 	k 		= 0;
	reg 			prev 	= 0;
	
	always @(posedge clk)
	begin
		if (in != out)
		begin
			if (k < 10000)
			begin
				if (in == prev)
					k = k + 1;
			end
			else
			begin
				if (k == 10000)
					out = prev;
			end
		end
		else
			k = 0;
		
		prev = in;
	end
								
endmodule
