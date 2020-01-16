/*
chip size = 2^10 = 1KB (8bit per chip)
4chip per line

16kB, 32-bit

16kB(total)/1kB(per-chip) = 16chips

16kB(total)/4kb(per-chip) = 4lines of 4 chips each

log2(16k/32bit) = 12


*/


//falta adicionar ras e cas partilhados entre todos os modulos

module ram(
    in out [31:0] data,
    input [11:0] addr,
    input RAS,
    input CAS,
    input cs,
    input we

);

    reg [3:0] CSlines;
    reg [3:0] welines;

    //initialize chips

        genvar i;
        for (i=0 i<4; i=i+1) {
        ramchip ramchip_insta(addr[9:0], data[7:0], welines[i], CSlines[i], data[7:0]);
        ramchip ramchip_instb(addr[9:0], data[15:8], welines[i], CSlines[i], data[15:8]);
        ramchip ramchip_instc(addr[9:0], data[24:16], welines[i], CSlines[i], data[24:16]);
        ramchip ramchip_instd(addr[9:0], data[31:25], welines[i], CSlines[i], datadata[31:25]);   
        );
    }

    initial begin //no reset line, just for test
        CSchips = 4b'1111; //we and CS enabled low
        wechips = 4h'1111;
    end

    always @(addr) begin
        if(!cs) begin
            CSchips <= 4b'1111 & ~(1 << addr[11:10]);
            if(!we) begin
                wechips <= 4b'1111 & ~(1 << addr[11:10]);
            end
            // else begin
                // wechips = 32b'1 & ~(1 << addr[14:10]);
            // end
        end
    end



endmodule