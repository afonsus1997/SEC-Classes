`timescale 1ns / 1ps
`include "xdefs.vh"

module xled (
		input 	    clk,
		input 	    sel,
		//input   data_in
		);

 always @(posedge clk)
   if(sel)
      $write("test");
      //use leds?

endmodule
