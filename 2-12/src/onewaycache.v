

module onewaycache(
    input [31:0] addr,
    input writeread,
    input en,
    input [31:0] datain,
    output reg [31:0] dataout,
    input clk,
    input rst,
    output reg hitmiss
);

reg [1023:0] mem[2**((8*32)-1):0];

always @ (posedge clk) begin
    if(rst) begin
        hitmiss <= 0;
        dataout <= 0;
    end

    if(en) begin
        if(writeread) begin
            //check data
        end
    end

end



endmodule // onewaycache