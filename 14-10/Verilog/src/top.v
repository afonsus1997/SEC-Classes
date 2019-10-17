module carrylookahead (
	input a [3:0],
	input b [3:0],
	input c0,

	output c4,
	output [3:0];
	);


	fulladder A0(
		.a(a[0]),
		.b(b[0]
