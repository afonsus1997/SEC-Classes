

module PG(
		input G1,
		input P1,
		input G3,
		input P3,
		input c0,
		output c2,

		output c4,
		
	);

	assign wire c4 = (G3 | P3 & G1) | (P3&P1&c0);
        assign wire c2 = G1 | P1 & c0;   	

endmodule


