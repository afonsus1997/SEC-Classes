`timescale 1ns/1ps        //sets timescale info to the compiler

module register (         //defines module with it's inputs and outputs
  input		    clk,  
  input             en,
  input    [31:0] data_in,      //32-bit data bus
  output reg [31:0] data_out    //32-bit data bus
);


always @ (posedge clk)
   if (en == 1'd1)            //at rising clock edge, sets data_out as data_in if enable is active
     data_out <= data_in;

endmodule
