`timescale 1ns / 1ps

module fulladder_tb;

	reg signed [3:0] A;
	wire signed [11:0] c;
    reg clkk;

	test_ex1 uut(
		.a(A),
		.c(C),
		.clk(clkk)
	);


	initial begin 

        $dumpfile("dump.vcd");
      $dumpvars;
      
      clkk = 1;
      A = 2;

      

		#50
		$finish;

	end

    always #10 clkk = ~clkk;

endmodule
