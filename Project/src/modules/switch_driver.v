

module switch_driver(
    input sel,
    input [7:0] kbd_in,
    output [7:0] kbd_out
);


assign kbd_out = kbd_in;

endmodule // switch_driver