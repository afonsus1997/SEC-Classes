`timescale 1ns / 1ps

module fulladder_tb;

	reg [3:0] A;
	reg [3:0] B;
	reg CI;
	wire [3:0] S;
	wire CO;

	adderfour uut(
		.aa(A),
		.bb(B),
		.ss(S),
		.cro(CO),
		.cri(CI)
	);


	initial begin 
		$dumpfile("top.vcd");
		$dumpvars();
		A=1;
		B=1;

		#20

		A=2;
		B=4;

		#20
		$finish;

	end

endmodule
