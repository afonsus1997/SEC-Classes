`timescale 1ns / 1ps

module fulladder_tb;

	reg [1:0] A;
	reg [1:0] B;
	wire [3:0] S;


	twobitcarrysave uut(
		.a(A),
		.b(B),
		.s(S)
	);


	initial begin 
		$dumpfile("top.vcd");
		$dumpvars();
		A=1;
		B=2;

		#20
		$finish;

	end

endmodule
