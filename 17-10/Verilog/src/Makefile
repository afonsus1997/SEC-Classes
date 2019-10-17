top: 2bit-carrysave-mult_tb.v 2bit-carrysave-mult.v fulladder.v
	iverilog -o top 2bit-carrysave-mult.v 2bit-carrysave-mult_tb.v fulladder.v
	./top

clean: 
	rm -f top *~ *.vcd

.PHONY: clean all
