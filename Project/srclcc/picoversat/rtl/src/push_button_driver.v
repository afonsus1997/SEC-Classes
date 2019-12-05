

module push_button_driver(
    input sel,
    input clk,
    input [3:0] sw_in,
    output reg [3:0] sw_out
);



always @ (posedge clk) begin
    
    if(sel) begin

        sw_out <= sw_in;

    end



end

endmodule // push_button_driver