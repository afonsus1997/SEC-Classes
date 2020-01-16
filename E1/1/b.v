


module ram(
    in out [7:0] data,
    input [14:0] addr,
    input RAS,
    input CAS,
    input cs,
    input we

);

//falta adicionar ras e cas partilhados entre todos os modulos


    reg [31:0] CSchips;
    reg [31:0] wechips;

    //initialize chips

        genvar i;
        for (i=0 i<32; i=i+1) {
        ramchip ramchip_inst(addr[9:0], data, wechips[i], cschips[i], data)   
        );
    }

    initial begin //no reset line, just for test
        CSchips = 32h'FFFFFFFF; //we and CS enabled low
        wechips = 32h'FFFFFFFF;
    end

    always @(addr) begin
        if(!cs) begin
            CSchips <= 32b'FFFFFFFF & ~(1 << addr[14:10]);
            if(!we) begin
                wechips <= 32b'FFFFFFFF & ~(1 << addr[14:10]);
            end
            // else begin
                // wechips = 32b'1 & ~(1 << addr[14:10]);
            // end
        end
    end



endmodule