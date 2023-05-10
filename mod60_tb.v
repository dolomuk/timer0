`timescale 1ns/1ns

module mod60_tb();
	reg			clk,rst_n;
	reg			en;
	wire			tc;
	wire	[6:0]	cnt_num;
	wire	[3:0]	d0;
	wire	[7:4]	d1;
	
	assign	d0	=	cnt_num[3:0];
	assign	d1	=	cnt_num[6:4];
	
	mod60	U0
	(
		.clk(clk),
		.rst_n(rst_n),
	   .en(en),
	   .tc(tc),
	   .cnt_num(cnt_num)	
	);
	
	initial begin
		clk	=	0;
		rst_n	=	0;
		en		=	0;
	end
	
	always #10 clk = ~clk;
	
	initial begin
		#30	rst_n =	1;
		#15	en		=	1;
	end

endmodule
