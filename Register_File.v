`timescale 1ns / 1ps
/* 
The register file contains 32 general purpose registers of 8 bits each.
These registers have direct access to the ALU. These registers are used to supply operands to the ALU for operations. 
The register file also acts as an intermediate memory location during data memory transactions.
*/

module Register_File(clk, RA_addr, RD_addr, en_rd, en_WD, WD_addr, RA, RD, WD);

	input clk;
	input [4:0] RA_addr;        //Operand 1 address
	input [4:0] RD_addr;        //Operand 2 address
	input [4:0] WD_addr;        //Destination address
	input [7:0] WD;             //Destination data
	input en_rd;                //read enable
	input en_WD;                //write enable for Destination
	output reg [7:0] RD;        //Operand 2 data
	output reg [7:0] RA;        //Operand 1 data

	reg [7:0] register_file [31:0];	//32 registers of 8 bits each

	reg [5:0] j;
	initial begin
		for(j=0; j<32; j=j+1)
		begin:loop
			register_file[j]=8'd0;	//initialising the register file with ZEROS
		end
	end

	always@(posedge clk)
	begin
		if(en_rd)
		begin
			RA <= register_file[RA_addr];	// Operand 1
			RD <= register_file[RD_addr];	// Operand 2
		end
		if(en_WD)
			register_file[WD_addr] <= WD;	//The result of ALU operation is stored in this location
	end

endmodule

