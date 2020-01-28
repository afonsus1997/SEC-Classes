

module push_button_driver(
    input clk,
    input [2:0] sw_in,
    output reg [2:0] sw_out
);



always @ (posedge clk) begin

        sw_out <= sw_in;

end

endmodule // push_button_driver