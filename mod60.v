module mod60
	(
		input					clk,rst_n,
		input					en,
		output				tc,
		output		[6:0]	cnt_num	
	);
	
	wire				tc0,tc1;
	
	assign	tc	=	en&tc0&tc1;
	
	modN	U0
	(
		.clk_50(clk),	
	   .rst_n(rst_n),		
	   .en(en),			
	   .tc(tc0),			
	   .cnt_num(cnt_num[3:0])	
	);
		defparam U0.N = 4;
		defparam U0.M = 10;
	
	modN	U1
	(
		.clk_50(clk),	
	   .rst_n(rst_n),		
	   .en(tc0),			
	   .tc(tc1),			
	   .cnt_num(cnt_num[6:4])	
	);
		defparam U1.N = 3;
		defparam U1.M = 6;

endmodule
