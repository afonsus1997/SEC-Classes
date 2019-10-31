//clk = 50Mhz
//snd freq - 200Hz..1kHz




module sequencer_loop_controller(
    input [7:0] freq,
    input [7:0] kbd_in,
    input sel_loop,
    input sel_snd,
    input clk,
    output snd_out,
    output reg [7:0] led_out,
    input rst
);

    reg [15:0] snd_counter;
    reg [25:0] loop_counter;

    always @ (posedge clk, posedge rst) begin
        
        if(rst) begin
            loop_counter <= 0;
            snd_counter <= 0;
        end


        if (sel_loop) begin
            
        end

        else if (sel_snd) begin
            
        end

        else begin
            snd_counter <= snd_counter++;
            loop_counter <= loop_counter++;
        end



    end


endmodule // sequencerloopctl
