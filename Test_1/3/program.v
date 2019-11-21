//y(n) = 0.25*y(n-1)+0.5*x(n).

module test_ex3 (
                  input clk,
                  input [4:0] x,
                  input xval,
                  input rst,
                  output reg [4:0] y,
                  output reg yval
                  );

   reg signed [4:0] ym1;

   always @(posedge clk) begin 
        if (rst) begin
            y <= 0;
            ym1 <= 0;
            yval <=0;
        end
        else if(xval) begin
            ym1 <= y;
            yval <=0;
        end
        else begin
            //y<= ym1 >> 2 + x >> 1; //would result in Q2 + Q1 and loss of data
            y <= ym1 + x >> 1; //output must be Q2 so ym2 doesent need to be shifted, x must be shifted once to the right in order to be in the same q as y
            yval <=1 ;
        end



   end

endmodule