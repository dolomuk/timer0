module modN #(parameter N = 4, M = 10) // M =< 2**N
	(
		input						clk_50	,
		input						rst_n		,
		input						en			,
		output					tc			,
		output reg	[N-1:0]	cnt_num	 
	);
	
	reg	tc1;
	
	assign	tc	=		en&tc1;
	
	always @(posedge clk_50, negedge rst_n) begin
		if(!rst_n)
			cnt_num	<=	{N{1'b0}};
		else if(en) begin
			if(cnt_num == M -2)	begin
				tc1		<=	1'b1;
				cnt_num	<=	cnt_num	+	1;
			end
			else if(cnt_num == M - 1) begin
				tc1		<=	1'b0;
				cnt_num	<=	{N{1'b0}};
			end
			else begin
				tc1		<=	1'b0;
				cnt_num	<=	cnt_num	+	1;
			end
		end
	end

endmodule
