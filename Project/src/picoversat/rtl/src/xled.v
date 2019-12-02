`timescale 1ns / 1ps
`include "xdefs.vh"

module xled (
		input   	    sel,
		input 		data_in,
		output  reg	data_out,		
		input 		clk,
		input 		rst

	);



always @ (posedge clk , posedge rst)
       if(rst)
	      data_out<=0;
      else if(sel)
	      data_out<=data_in;

endmodule
