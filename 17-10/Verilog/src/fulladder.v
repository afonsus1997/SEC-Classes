

module fulladder(
		input a,
		input b,
		input ci,
		output co,
		output s
	);


	wire s = ((a^b)^ci);
	wire co = (a&b) | ((a^b) & ci);

endmodule


