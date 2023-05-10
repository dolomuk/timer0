module timer
	(
		input					clk_50,rst_n,
		input					en,	//	SW
		output				tc,	
		output		[6:0]	SC,MT, //SC : second , MT: minuite
		output		[4:0]	HR     //HR : hour
	);
	
	wire	tc0,tc1,tc2;
	
	assign	tc	=	en&tc0&tc1&tc2;
	
		
	mod60	U0
	(
		.clk(clk_50),
		.rst_n(rst_n),
	   .en(en),
	   .tc(tc0),
	   .cnt_num(SC)	
	);
	
	mod60	U1
	(
		.clk(clk_50),
		.rst_n(rst_n),
	   .en(tc0),
	   .tc(tc1),
	   .cnt_num(MT)	
	);
	
	mod12	U2
	(
		.clk(clk_50),
		.rst_n(rst_n),
	   .en(tc1),
	   .tc(tc2),
	   .cnt_num(HR)	
	);
	


endmodule
