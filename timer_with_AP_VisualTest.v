module timer_with_AP_VisualTest
	(
		input			clk_50,rst_n,
		input			en,	//	SW
		output		tc,	
		output		[6:0]	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6
	);
	
	wire	tc0,tc1,tc2;
	
	wire	[6:0]	SC,MT;	//SC : second , MT: minuite
	wire	[4:0]	HR;		//HR : hour
	wire	[3:0]	AP;
	
	assign	tc			=	en&tc0&tc1&tc2;
	assign	AP_ctr	=	((HR[4] == 1'b1)&&(HR[3:0]==4'd2));
	
	Pwm	P0
	(
		.i_clk(clk_50),
		.rst_n(rst_n),
		.o_clk(clk)	
	);
		defparam P0.Period = 25000; // 50000000 for 1hz
		defparam P0.Duty	 = 12500; // 25000000 for 1hz
		
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
	
	modAP	U3
	(
		.rst_n(rst_n),
		.en(AP_ctr),				
		.ctr_ap(AP)		
	);
	
	hexToSevenSegment		H0(.hexNumber(SC[3:0]),.sevenSegmentActiveLow(HEX0));
	hexToSevenSegment		H1(.hexNumber(SC[6:4]),.sevenSegmentActiveLow(HEX1));
	hexToSevenSegment		H2(.hexNumber(MT[3:0]),.sevenSegmentActiveLow(HEX2));
	hexToSevenSegment		H3(.hexNumber(MT[6:4]),.sevenSegmentActiveLow(HEX3));
	hexToSevenSegment		H4(.hexNumber(HR[3:0]),.sevenSegmentActiveLow(HEX4));
	hexToSevenSegment		H5(.hexNumber(HR[4]),.sevenSegmentActiveLow(HEX5));
	hexToSevenSegment_AP	H6(.hexNumber(AP),.sevenSegmentActiveLow(HEX6));

endmodule