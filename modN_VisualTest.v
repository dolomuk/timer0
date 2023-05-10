module modN_VisualTest #(parameter N = 4, M = 10)
	(
		input					clk_50,rst_n, 
		input					en				, //SW0
		output				tc				, //tc = LEDG0
		output 		[6:0]	HEX0			 
	);

	wire				clk; // 1hz clk
	wire	[N-1:0]	cnt_num;
	
	Pwm	U0
	(
		.i_clk(clk_50),
		.rst_n(rst_n),
		.o_clk(clk)	
	);
		defparam U0.Period = 5000000;
		defparam U0.Duty	 = 2500000;
	
	modN	U1
	(
		.clk_50(clk),	
	   .rst_n(rst_n),		
	   .en(en),			
	   .tc(tc),			
	   .cnt_num(cnt_num)	
	);
		defparam U1.N = N;
		defparam U1.M = M;
		
	hexToSevenSegment	U2
	(
    .hexNumber(cnt_num),
    .sevenSegmentActiveLow(HEX0)
	);
	
	
	
endmodule
