`timescale 1ns/1ps

module counter (
  input 	   clk,
  input 	   rst,
  input 	   en,
  output reg [1:0] data_out
);

   
   always @ (posedge clk) begin      //at clk rising edge
      if (rst == 1'b1) begin           
	      data_out <= 2'b0;           //if rst is active, resets data_out
      end
      else if (en == 1'b1 ) begin	 //if en is active
	      if(data_out != 2'b11)       //
	      data_out <= data_out+1'b1;  //if en is active and data_out is not 2'b11 (full), adds 1 to data_out
      end
   end

endmodule
