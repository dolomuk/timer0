`timescale 1ns/1ns

module timer_tb();

	reg				clk_50,rst_n;
	reg				en;	//	SW
	wire				tc;	
	wire		[6:0]	SC,MT; //SC 
	wire		[4:0]	HR    ; //HR 
	
	wire		[3:0]	SC0,MT0,HR0;
	wire		[6:4]	SC1,MT1;
	wire				HR1;
	
	assign	SC0	=	SC[3:0];
	assign	SC1	=	SC[6:4];
	assign	MT0	=	MT[3:0];
	assign	MT1	=	MT[6:4];
	assign	HR0	=	HR[3:0];
	assign	HR1	=	HR[4];
	
	
	timer	U0
	(
		.clk_50(clk_50),
		.rst_n(rst_n),
		.en(en),	
		.tc(tc),	
		.SC(SC),
		.MT(MT), 
		.HR(HR)     	
	);
	
	initial begin
		clk_50	=	0;
		rst_n		=	0;
		en			=	0;
	end
	
	always #10 clk_50 = ~clk_50;
	
	initial begin
		#30	rst_n =	1;
		#40	en		=	1;
	end
	
	

endmodule
