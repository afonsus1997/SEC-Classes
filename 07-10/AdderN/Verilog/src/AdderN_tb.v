
`timescale 1ns / 1ps

module top_tb;

   
   reg [31:0] A;
   reg [31:0] B;
   wire [31:0] C;
   

   
   
   // Instantiate the Unit Under Test (UUT)
   counter #(.NBIT(32)) uut(
		.data_in_A              (A),
		.data_in_B		(B),
		.data_out		(C),
		);
 
   
   initial begin
      $dumpfile("top.vcd");
      $dumpvars();
      
      A=10;
      B=10;
  

   end
   
endmodule

