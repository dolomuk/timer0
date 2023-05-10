module timer_VisualTest
	(
		input			clk_50,rst_n,
		input			en,	//	SW
		output		tc,	
		output		[6:0]	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5
	);
	
	wire	tc0,tc1,tc2;
	
	wire	[6:0]	SC,MT;	//SC : second , MT: minuite
	wire	[4:0]	HR;		//HR : hour
	
	assign	tc	=	en&tc0&tc1&tc2;
	
	Pwm	P0
	(
		.i_clk(clk_50),
		.rst_n(rst_n),
		.o_clk(clk)	
	);
		defparam P0.Period = 50000; // 50000000 for 1hz
		defparam P0.Duty	 = 25000; // 25000000 for 1hz
		
	mod60	U0
	(
		.clk(clk),
		.rst_n(rst_n),
	   .en(en),
	   .tc(tc0),
	   .cnt_num(SC)	
	);
	
	mod60	U1
	(
		.clk(clk),
		.rst_n(rst_n),
	   .en(tc0),
	   .tc(tc1),
	   .cnt_num(MT)	
	);
	
	mod12	U2
	(
		.clk(clk),
		.rst_n(rst_n),
	   .en(tc1),
	   .tc(tc2),
	   .cnt_num(HR)	
	);
	
	hexToSevenSegment	H0(.hexNumber(SC[3:0]),.sevenSegmentActiveLow(HEX0));
	hexToSevenSegment	H1(.hexNumber(SC[6:4]),.sevenSegmentActiveLow(HEX1));
	hexToSevenSegment	H2(.hexNumber(MT[3:0]),.sevenSegmentActiveLow(HEX2));
	hexToSevenSegment	H3(.hexNumber(MT[6:4]),.sevenSegmentActiveLow(HEX3));
	hexToSevenSegment	H4(.hexNumber(HR[3:0]),.sevenSegmentActiveLow(HEX4));
	hexToSevenSegment	H5(.hexNumber(HR[4]),.sevenSegmentActiveLow(HEX5));

endmodule