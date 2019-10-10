top: 4bitadder.v fulladder_tb.v fulladder.v
	iverilog -o top 4bitadder.v fulladder_tb.v fulladder.v
	./top

clean: 
	rm -f top *~ *.vcd

.PHONY: clean all
