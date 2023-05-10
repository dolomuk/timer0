`timescale 1ns/1ns
module modN_tb #(parameter N = 4)();

	reg				clk_50,rst_n,en;
	wire				tc;
	wire	[N-1:0]	cnt_num;
	
	modN U0
	(
		.clk_50(clk_50)	,
		.rst_n(rst_n)		,
		.en(en)			,
		.tc(tc)			,
		.cnt_num(cnt_num)	 
	);
		defparam U0.N = N;
		defparam U0.M = 10;
	
	initial	begin
		clk_50	=	0;
		rst_n		=	0;
		en			=	0;
	end
	
	always #10 clk_50 = ~clk_50;
	
	initial begin
		#30	rst_n =	1;
		#15	en		=	1;
	end

endmodule
