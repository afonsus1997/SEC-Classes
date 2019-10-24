


module subshiftdiv(
	input  [3:0] D,
	input  [3:0] d,
	output reg [3:0] r,
	output  [3:0] q,
	input        start,
	input        rst, 
	input        clk,
	output  wire     done
);


wire [3:0] DD;
reg  [3:0] dd;
reg [7:0] RD;
reg [3:0] qq;

assign q = RD[3:0];
assign DD = RD[6:3];

always @ (posedge clk) begin
	if(rst)
		RD <= 0;
	else if(start)
		RD <= {4'b0, D};
	else
		RD <= {r, RD[2:0], qq[0]};
	//RD = RD<<1;
	//dd = dd<<1;

end


always @ (posedge clk) begin
	if(rst)
		dd<=0;
	else if(start)
		dd<=d;
end

always @ * begin
	if(DD>d) begin
		r=DD-dd;
		qq=1;
	end
	else begin
		r=DD;
		qq=0;
	end
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
      D = 6;

      @(posedge clk) #1 rst=0;

      #5 @(posedge clk) #1 start=1;
      @(posedge clk) #1 start=0;

      //@(posedge done)$display("%d/%d=%d*%d+%d", a, b, c, b, d);
      
      //@(posedge clk) $finish;
   end
   
   always #10 clk = ~clk;
 
endmodule







