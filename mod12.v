module mod12
	(
		input					clk,rst_n,
		input					en,
		output				tc,
		output		[4:0]	cnt_num	
	);
	
	wire				tc0,tc1;
	wire				rst_nt;
	
	assign	rst_nt	=	~(!rst_n|((cnt_num[3:0]==4'd2)&&(cnt_num[4]==1'b1)));
	
	assign	tc	=	en&tc0&tc1;
	
	modN	U0
	(
		.clk_50(clk),	
	   .rst_n(rst_nt),		
	   .en(en),			
	   .tc(tc0),			
	   .cnt_num(cnt_num[3:0])	
	);
		defparam U0.N = 4;
		defparam U0.M = 10;
	
	modN	U1
	(
		.clk_50(clk),	
	   .rst_n(rst_nt),		
	   .en(tc0),			
	   .tc(tc1),			
	   .cnt_num(cnt_num[4])	
	);
		defparam U1.N = 1;
		defparam U1.M = 2;
		


endmodule
