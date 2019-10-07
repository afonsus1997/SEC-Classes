`timescale 1ns/1ps

module counter 
	#(
	parameter NBIT=32)
		(
	input [NBIT-1:0] data_in_A,
	input [NBIT-1:0] data_in_B,
	output [NBIT-1:0] data_out

  );

  
  assign data_out = data_in_A + data_in_B;

  
  endmodule
