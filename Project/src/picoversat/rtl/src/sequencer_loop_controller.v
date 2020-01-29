
//`define sim - reduces delay times for ease of simulation
//`define 32bit - recieves the timing thresholds through data bus
`define normal //normal operation

module sequencer_loop_controller(
    `ifdef normal
	 input [7:0] freqin,
	 `endif
	 `ifdef 32bit
	 input [31:0] freqin,
	 `endif
    input [7:0] kbd_in,
    input sel_loop,
    input sel_snd,
    input clk,
    output snd_out,
    output [7:0] led_out,
    input rst
);
	reg snd_gen;
    reg [27:0] snd_counter;
	reg [20:0] snd_freq_counter;
    reg [27:0] loop_counter;
	reg [7:0] scroll_out;
	reg [4:0] curr_sft;
	reg snd_en;

    reg [31:0] freq;
	reg [25:0] sweep;
	reg [25:0] snd_en_time;
    reg [7:0] old_loop;
	

	assign led_out = scroll_out | kbd_in;

	assign snd_out = snd_gen & snd_en & ((kbd_in >> curr_sft) & 1);
	
	
`ifdef sim //used for simulation purposes, small delays
	always @(posedge sel_snd, posedge rst) begin
		if(sel_snd) begin
			case(freqin)
				8'd0 : freq <= 20'd1;
				8'd1 : freq <= 20'd2;
				8'd2 : freq <= 20'd3;
				8'd3 : freq <= 20'd4;
				8'd4 : freq <= 20'd5;
				8'd5 : freq <= 20'd6;
				8'd6 : freq <= 20'd7;
				8'd7 : freq <= 20'd8;
				8'd8 : freq <= 20'd9;
				8'd9 : freq <= 20'd10;
				8'd10 : freq <= 20'd11;
				8'd11 : freq <= 20'd12;
				8'd12 : freq <= 20'd13;
				8'd13 : freq <= 20'd14;
				8'd14 : freq <= 20'd15;
				8'd15 : freq <= 20'd16;
			endcase
		end
	end
	
	always @(posedge clk) begin
		if(sel_loop) begin
			case(freqin)
				8'd0 : sweep <= 28'd1;
				8'd1 : sweep <= 28'd1;
				8'd2 : sweep <= 28'd1;
				8'd3 : sweep <= 28'd1;
				8'd4 : sweep <= 28'd1;
				8'd5 : sweep <= 28'd1;
				8'd6 : sweep <= 28'd1;
				8'd7 : sweep <= 28'd1;
			endcase
		end
	
	end
	
	always @(sndenreg) begin
	
		case(sndenreg)
			8'd0 : snd_en_time <= 28'd1;
			8'd1 : snd_en_time <= 28'd2;
			8'd2 : snd_en_time <= 28'd3;
			8'd3 : snd_en_time <= 28'd4;
			8'd4 : snd_en_time <= 28'd5;
			8'd5 : snd_en_time <= 28'd6;
			8'd6 : snd_en_time <= 28'd7;
			8'd7 : snd_en_time <= 28'd8;
		endcase
	
	end
	
`endif

`ifdef normal //normal operation
	always @(posedge sel_snd, posedge rst) begin
		if(rst)
			freq <= 17'h186A0;
		else if(sel_snd) begin
			case(freqin)
				8'd0 : freq <= 17'h186A0;
				8'd1 : freq <= 17'h14585;
				8'd2 : freq <= 17'h11704;
				8'd3 : freq <= 17'hF424;
				8'd4 : freq <= 17'hD903;
				8'd5 : freq <= 17'hC350;
				8'd6 : freq <= 17'hB18E;
				8'd7 : freq <= 17'hA2C2;
				8'd8 : freq <= 17'h963D;
				8'd9 : freq <= 17'h8B82;
				8'd10 : freq <= 17'h8235;
				8'd11 : freq <= 17'h7A12;
				8'd12 : freq <= 17'h72E3;
				8'd13 : freq <= 17'h6C81;
				8'd14 : freq <= 17'h66CB;
				8'd15 : freq <= 17'h61A8;
			endcase
		end
	end
	
	always @(posedge sel_loop, posedge rst) begin
		if(rst)
			sweep <= 26'h5F5E10;
		else if(sel_loop) begin
			case(freqin)
				8'd0 : sweep <= 26'h5F5E10;
				8'd1 : sweep <= 26'h6CFDC9;
				8'd2 : sweep <= 26'h7F2815;
				8'd3 : sweep <= 26'h989680;
				8'd4 : sweep <= 26'hBEBC20;
				8'd5 : sweep <= 26'hFE502A;
				8'd6 : sweep <= 26'h17D7840;
				8'd7 : sweep <= 26'h2FAF080;
			endcase	
		
			case(freqin)
				8'd0 : snd_en_time <= 25'h2FAF08;
				8'd1 : snd_en_time <= 25'h367EE4;
				8'd2 : snd_en_time <= 25'h3F940A;
				8'd3 : snd_en_time <= 25'h4C4B40;
				8'd4 : snd_en_time <= 25'h5F5E10;
				8'd5 : snd_en_time <= 25'h7F2815;
				8'd6 : snd_en_time <= 25'hBEBC20;
				8'd7 : snd_en_time <= 25'h17D7840;
			endcase
		end
	end
	 
	
`endif
	
`ifdef 32bit //Timing information recieved from picoversat, implemented but not used
	always @(posedge clk) begin
		if(sel_snd) begin
			freq <= freqin;
		end
	end
	
	always @(posedge clk) begin
		if(sel_loop) begin
			sweep <= freqin;
			snd_en_time = sweep << 3;
		end
	end

`endif
	
    always @ (posedge clk, posedge rst) begin
      if(rst) begin
			loop_counter <= 0;
			curr_sft <= 0;
			scroll_out <= 8'b10000000;		
			curr_sft<=0;
			old_loop <=0;
		end
		
		else if(sel_loop) begin
			if(old_loop == freqin)
				old_loop <= freqin;
			else begin
				loop_counter <= 0;
				old_loop <= freqin;
			end
		end
			
		else if (loop_counter == sweep) begin
			loop_counter <= 16'h0000;
			
			if(scroll_out == 8'b00000001) begin
				scroll_out <= 8'b10000000;
				curr_sft <= 7;
			end
			else begin
				scroll_out <= scroll_out >> 1;
				curr_sft <= curr_sft - 1;
			end
		end
		else begin
			loop_counter <= loop_counter + 1;
		end
		
	end
	
	
	always @ (posedge clk, posedge rst) begin
		if(rst) begin
			snd_counter <= 0;
			snd_en <= 0;
		end
		
		else if (snd_counter == snd_en_time) begin
			snd_counter <= 0;
			snd_en <= !snd_en ;
		end
		
		else begin
			snd_counter <= snd_counter + 1;
		end
	end
	
	always @ (posedge clk, posedge rst) begin
		if(rst)
			snd_gen <= 0;
		else if (snd_freq_counter == freq) begin
			snd_freq_counter <= 0;
			snd_gen <= !snd_gen;
		end
		
		else begin
			snd_freq_counter <= snd_freq_counter + 1;
		end
		
	end
	
	
	
endmodule // sequencerloopctl
