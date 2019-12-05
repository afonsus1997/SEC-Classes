

module led_driver(
    input [7:0] data_in,
    output reg [7:0] led_out
);

assign led_out = data_in;

endmodule // led_driver


