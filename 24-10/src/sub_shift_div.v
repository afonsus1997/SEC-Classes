


module subshiftdiv(
	input  [3:0] D,
	input  [3:0] d,
	output reg [3:0] r,
	output  [3:0] q,
	input        start,
	input        rst, 
	input        clk,
	output  reg     done
);


wire [3:0] DD;
reg  [3:0] dd;
reg [7:0] RD;
reg [3:0] qq;
reg [4:0] counter;

assign q = RD[3:0];
assign DD = RD[6:3];



always @ (posedge clk) begin
	if(rst) begin
		RD <= 0;
      counter <= 0;
      done <= 0;
   end
	else if(start)
		RD <= {4'b0, D};
	else begin
		RD <= {r, RD[2:0], qq[0]};
      //dd <= dd<<1;
      counter<=counter+1;
	end
   //else
   // done <= 1;
 
   //RD = RD<<1;
	//dd = dd<<1;

end


always @ * begin
	if(DD>d) begin
      //if(dd == 4'b0)
      //   done <= 1'b1;
		//else begin
         r<=DD-d;
		   qq<=1;
      //end
	end
	else begin
		r<=d;
		qq<=0;
	end
end

always @ (posedge clk) begin
	if(rst)
		dd<=0;
	else if(start)
		dd<=d;
   
end


endmodule

module sub_shft_div_tb ();

   reg clk, rst;
   reg [3:0] d, D;
   wire [3:0] q;
   wire [3:0] r;
   reg         start;
   wire        done;
   
   subshiftdiv div0 (
                       .clk(clk),
                       .rst(rst),
                     
                       .d(d), 
                       .D(D),
                       .q(q),
                       .r(r),
                       .start(start),
                       .done(done)
                     );   

   initial begin

      $dumpfile("dump.vcd");
      $dumpvars;
      
      rst = 1;
      clk = 1;
      start = 0;

      d= 2;
      D = 8;

      @(posedge clk) #1 rst=0;

      #5 @(posedge clk) #1 start=1;
      @(posedge clk) #1 start=0;

      @(posedge done)$display("%d/%d=%d", D, d, q);
      
      @(posedge clk) $finish;
   end
   
   always #10 clk = ~clk;
 
endmodule







