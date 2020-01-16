/*addr = 10bits
data = 8bits 

mem size = 2^10 = 1KB
*/



module ramchip(
    input [9:0] address,
    input [7:0] data_in,
    input we,
    input cs,
    output [7:0] data_out
    
);

    reg [7:0] memreg[0:1023]; //memory registers 8bit by 2^10


	initial begin

	    $readmemh ("memfile.hex",memreg,0,1023); //index depends on the chip number if flashing whole ram
	
    end

    always @(negedge cs) begin
        if(!cs) begin
            if(we) begin
                mem[address] =  data_in;
            end
            else begin
                data_out = mem[address];
            end 
        end
    end 



endmodule // ram
