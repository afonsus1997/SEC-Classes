`timescale 1ns/1ps

module adderfour (
	input [3:0]  aa,
	input [3:0]  bb,
	input       cri,
	output      cro,
	output [3:0] ss
	);


	wire [3:0] ciinput;
	assign ciinput[0] = cri;
	assign cro = ciinput[4];
  
	genvar i;
	for (i=0; i<4; i=i+1) begin : adder

	  	fulladder abc (
			.a(aa[i]),	
			.b(bb[i]),
			.ci(ciinput[i+1]),
			.co(ciinput[i]),
			.s(ss[i])		
			);
	
  		end

endmodule



