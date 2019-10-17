

module fulladder(
		input a,
		input b,
		input ci,
		output s,
		output p,
		output g
	);


	wire s = ((a^b)^ci);
	wire p = a^b;
	wire g = a&b;

endmodule


