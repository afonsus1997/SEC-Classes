/*module test_ex1 (
                  input clk,
                  input signed [3:0] a,
                  output reg signed [11:0] c
                  );

   reg signed [7:0]                  y;

   always @(posedge clk) begin 
        y <= a*a;
        c  <= y*a;
   end

endmodule*/

module test_ex1 (
                  input clk,
                  input signed [3:0] a,
                  output reg signed [11:0] c
                  );

   reg signed [7:0]                  y;

   always @* begin 
        //y = a*a*a;
        c  <= a*a*a;
   end

endmodule