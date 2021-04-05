`include "interface.sv"
`include "top.v"
`include "pkt.sv"
`include "producer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "program.sv"

module top_test;

	bit clk, reset;
	
	initial begin reset=1; #6 reset=0; end
	
	intf pif(clk, reset);
	
	prog p(pif);
	
	top_DUT t1(pif);
	
	always #5 clk=~clk;
	
	initial #1000 $finish;

endmodule