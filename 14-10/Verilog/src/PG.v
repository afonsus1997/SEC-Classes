

module PG(
		input p1,
		input p0,
		input g1,
		input g0,
		input c0,
		output c1,

		output P1,
		output G1
	);


	wire c1 = g0|p0&c0;
	wire P1 = p1&p0;
	wire G1 = g1|p1&g0;

endmodule


