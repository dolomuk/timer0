module modAP
	(
		input					rst_n	,
		input					en		,
		output	[3:0]		ctr_ap		 
	);
	
	reg		flag_ap;

	always @(posedge en,negedge rst_n) begin
		if(!rst_n)
			flag_ap	<=	0;
		else
			flag_ap	<=	~flag_ap;
	end
	
	assign	ctr_ap	=	{{3{1'b0}},flag_ap};

endmodule
