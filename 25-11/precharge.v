//`timescale

module memcell(
    inout BL,
    inout BLB
);

    assign BL = ~BLB;
    assign BLB = ~BL;

endmodule // memcell



module mctb();

    wire bl;
    wire blb;

    reg drivebl, driveblb;

    memcell uut(.BL(bl), .BLB(blb));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
        drivebl = 'Z';
        driveblb = 'Z';
        #10
        drivebl = 0;
        driveblb = 1;
        #100

        $finish();
    end

    assign bl = drivebl;
    assign blb = driveblb;

endmodule