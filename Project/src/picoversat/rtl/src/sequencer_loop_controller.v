//clk = 50Mhz
//snd freq - 200Hz..1kHz
//1k = 61A8
//200Hz = 1E848 

//8s varrimento = h2FAF080
//tempo de som = 0x17D784



module sequencer_loop_controller(
    input [7:0] freqin,
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
	 reg [7:0] curr_sw;
	 reg [4:0] curr_sft;
	 reg snd_en;
	 reg snd_en_h;
	 
	 
	 reg [7:0] freqinreg;
	 reg [7:0] sweepreg;
	 reg [7:0] sndenreg;
    reg [20:0] freq;
	 reg [27:0] sweep;
	 reg [27:0] snd_en_time;
    
	
	
	 
	 //assign step = freqin; 
	 //reg bug;
	//assign led_out = loop_counter[15:7];
	assign led_out = scroll_out | kbd_in;
	//assign bug = kbd_in & scroll_out;
	assign snd_out = snd_gen & snd_en & ((kbd_in >> curr_sft) & 1);
	
	assign sndenreg = sweepreg;
	
	
	always @(posedge clk) begin
		if(sel_snd) begin
			case(freqin)
				8'd0 : freq <= 20'h186A0;
				8'd1 : freq <= 20'h14585;
				8'd2 : freq <= 20'h11704;
				8'd3 : freq <= 20'hF424;
				8'd4 : freq <= 20'hD903;
				8'd5 : freq <= 20'hC350;
				8'd6 : freq <= 20'hB18E;
				8'd7 : freq <= 20'hA2C2;
				8'd8 : freq <= 20'h963D;
				8'd9 : freq <= 20'h8B82;
				8'd10 : freq <= 20'h8235;
				8'd11 : freq <= 20'h7A12;
				8'd12 : freq <= 20'h72E3;
				8'd13 : freq <= 20'h6C81;
				8'd14 : freq <= 20'h66CB;
				8'd15 : freq <= 20'h61A8;
			endcase
		end
	end
	
	always @(posedge clk) begin
		if(sel_loop) begin
			case(freqin)
				8'd0 : sweep <= 28'h5F5E10;
				8'd1 : sweep <= 28'h6CFDC9;
				8'd2 : sweep <= 28'h7F2815;
				8'd3 : sweep <= 28'h989680;
				8'd4 : sweep <= 28'hBEBC20;
				8'd5 : sweep <= 28'hFE502A;
				8'd6 : sweep <= 28'h17D7840;
				8'd7 : sweep <= 28'h2FAF080;
			endcase
		end
	
	end
	
	always @(sndenreg) begin
	
		case(sndenreg)
			8'd0 : snd_en_time <= 28'h2FAF08;
			8'd1 : snd_en_time <= 28'h367EE4;
			8'd2 : snd_en_time <= 28'h3F940A;
			8'd3 : snd_en_time <= 28'h4C4B40;
			8'd4 : snd_en_time <= 28'h5F5E10;
			8'd5 : snd_en_time <= 28'h7F2815;
			8'd6 : snd_en_time <= 28'hBEBC20;
			8'd7 : snd_en_time <= 28'h17D7840;
		endcase
	
	end
	
	
	
	
    always @ (posedge clk, posedge rst) begin
      if(rst) begin
			loop_counter <= 0;
			curr_sft <= 0;
			scroll_out <= 8'b10000000;
			sweepreg <= 0;
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
		
		//snd_en_h <= (kbd_in >> curr_sft) & 1;

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
