interface intf(input logic clk, reset);

	//logic clk;             //clock
	//logic reset;
	logic [7:0] result;   //output result from alu
	logic cy,zy;          //carry, zero flag
	logic [7:0] RD_out,RA_out;
	logic [4:0] aluop;         //ALU operation
	logic [15:0] instruction;
	logic [7:0] pc;
	
	modport dut(input clk, reset, instruction, output result, cy, zy, RA_out, RD_out, aluop, pc);

endinterface