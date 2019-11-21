
module programtb ();

   reg clk, rst;
   reg [3:0] X;
   reg         start;
   wire        done;
   wire [4:0] Y;
           
   
   test_ex3 uut (
                       .clk(clk),
                       .rst(rst),
                     
                       .xval(start), 
                       .x(X),
                       .y(Y),
                       .yval(done)
                     );   

   initial begin

      $dumpfile("dump.vcd");
      $dumpvars;
      
      rst = 1;
      clk = 1;
      start = 0;

      X = 2;

      @(posedge clk) #1 rst=0;

      #5 @(posedge clk) #1 start=1;
      @(posedge clk) #1 start=0;
      
      //@(posedge clk) $finish;

      #500

      X = 3;

      #5 @(posedge clk) #1 start=1;
      @(posedge clk) #1 start=0;
      #500

      $finish;
   end
   
   always #10 clk = ~clk;
 
endmodule
