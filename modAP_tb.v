`timescale 1ns/1ns

module modAP_tb();
	reg				rst_n;
	reg				en				;
	wire		[3:0]	ctr_ap		;
	
	modAP	U0
	(
		.rst_n(rst_n),
		.en(en),				
		.ctr_ap(ctr_ap)		
	);
	
	initial begin
		rst_n		=	0;
		en			=	0;
	end
	
	
	initial begin
		#30	rst_n =	1;
		#40	en		=	1;
	end

endmodule
