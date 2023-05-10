module Pwm #(parameter Period = 50000000, Duty = 25000000)
	(
		input				i_clk,
		input				rst_n,
		output			o_clk	
	);
	
	reg			[27:0]	counter;
	wire						counter_clr;
	wire						counter_dec;
	
	always @(posedge i_clk, negedge rst_n) begin
		if(!rst_n) 
			counter	<=	0;
		else begin
			if(counter_clr)
				counter	<=	0;
			else
				counter	<=	counter	+	1;
		end
	end
	
	assign	counter_clr	=	(counter	==	Period - 1) ? 1'b1 : 1'b0;
	assign	counter_dec	=	(counter	==	Duty - 1) ? 1'b1 : 1'b0;
	
	assign	o_clk	=	counter_dec;
	
endmodule
