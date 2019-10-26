

module twobitcarrysave(
		input  [1:0] a,
		input  [1:0] b,
		output [3:0] s
	);

	assign s[0] = a[0]&b[0];
	wire faco;

	fulladder s00 (
		.a(b[1]&a[0]),
		.b(a[1]&b[0]),
		.ci(1'b0),
		.co(faco),
		.s(s[1])	
	);

	fulladder s01(
		.a(a[1]&b[1]),
		.b(1'b0),
		.ci(faco),
		.co(s[3]),
		.s(s[2])
	);


endmodule


