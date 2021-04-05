`include "uvm_pkg.sv"
import uvm_pkg::*;

`include "txn_pkg.sv"
`include "interface.sv"
`include "sequence.sv"
`include "top.v"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module top1;

	logic clk,rst;
	intf pif(clk,rst);
	
	top t1(.clk(pif.clk), .reset(pif.rst), .result(pif.result), .cy(pif.cy), .zy(pif.zy), .instruction(pif.inst), .aluop(pif.aluop), .RD_out(pif.RD_out), .RA_out(pif.RA_out), .pc(pif.pc));
	
	always #5 clk=~clk;
	
	initial begin
		clk=0;
		rst=1;
		#20 rst=0;
		#100 $finish;
		
		
	end
	
	initial begin
		
		uvm_config_db#(virtual intf)::set(null,"*","pif",pif);
		run_test("test");
	end

endmodule