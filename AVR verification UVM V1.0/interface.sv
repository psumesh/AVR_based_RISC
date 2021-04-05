interface intf(input logic clk,rst);

	logic [15:0] inst;
	logic [7:0] RD_out;
	logic [7:0] RA_out;
	logic [7:0] result;
	logic [7:0] pc;
	logic [4:0] aluop;
	logic cy,zy;
	
	//modport dut (input inst,clk,rst,output RD_out,RA_out,aluop,result,cy,zy,pc);
	
endinterface