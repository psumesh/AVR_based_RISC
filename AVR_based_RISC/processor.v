`timescale 1ns / 1ps

module processor(clk, reset, sw_out,wr_addr,wr_data,we,out_port,in_port);

input clk;             //clock
input reset;
wire [7:0] result;   //output result from alu
wire cy,zy;          //carry, zero flag
input [7:0] wr_addr;
input [15:0] wr_data;
input [1:0] we;
output [7:0] out_port;
input [7:0] in_port;
output [7:0] sw_out;

wire [15:0] I_Reg;     //16-bit Instruction REG
wire en_PM,en_Fetch;
wire en_Decode;           //decoder enable
wire en_Execute;          //alu enable
wire en_Writeback;        //write enable register file

wire en_drd,en_dwr;       //data memory read and write enable
wire [4:0] aluop;         //ALU operation
wire [7:0] RA;            //Source REG data
wire [7:0] RD_out,RA_out; //Destination REG data
wire [7:0] mem_dout;      //data memory output
wire [7:0] RD;
wire [2:0] sel_alu_ip;
wire sel_drd,sel_dwr,sel_pc_load;
wire [15:0] instruction;
wire [7:0] pc;
wire en_pc_load;
wire [7:0] LR_out;
wire LR_load_en;
wire [7:0] PC_load;
wire sel_LR_load;
wire sel_pc_load_src;

wire addr_MSB;
wire [7:0] in_to_alu;
wire out_port_en;
wire pc_source_select;
wire en_output_load;

assign sw_out = in_port;

Control_Unit CU(clk, reset, en_PM, en_Fetch, en_Decode, en_Execute, en_Writeback);

Program_Counter PC(clk, reset, en_Fetch, pc, PC_load, en_pc_load);

Program_Memory PM(clk, en_PM, pc, instruction,wr_addr,wr_data,we);//(clk,rden,rd_addr,instr,wr_addr,wr_data,we);

Link_register LR(pc,LR_out,clk,LR_load_en);//(LR_in,LR_out,clk,rst,LR_load_en);

Instruction_Register IR(clk, en_Fetch, instruction, I_Reg);

Instruction_Decoder ID(clk, {I_Reg[15:9],I_Reg[3:0]}, en_Decode, aluop, sel_alu_ip, sel_drd, sel_dwr, sel_pc_load, cy, zy,sel_LR_load,out_port_en);

Register_File RF(clk, {I_Reg[9],I_Reg[3:0]},{addr_MSB,I_Reg[7:4]}, en_Decode, en_Writeback, {addr_MSB,I_Reg[7:4]}, RA, RD, result);//(clk, RA_addr, RD_addr, en_rd, en_WD, WD_addr, RA, RD, WD);

Alu ALU(clk, en_Execute, RD_out, RA_out, aluop, result, cy, zy);

Data_Memory DM(clk, en_drd, en_dwr, {{I_Reg[11:8],I_Reg[3:0]}}, result, mem_dout);

in_port in1(in_port,in_to_alu,clk);

mux2x1_8bit mux_RA_ip ({I_Reg[11:8],I_Reg[3:0]}, RA, sel_alu_ip[2], RA_out);//mux2x1_8bit(A, B, sel, out);

mux4x1_8bit mux_RD_ip (mem_dout, RD,in_to_alu, sel_alu_ip[1:0], RD_out);

mux2x1_8bit mux_PC_ip ( I_Reg[9:2],LR_out, pc_source_select, PC_load);

mux2x1_1bit mux_lr_load(en_Execute, sel_LR_load, LR_load_en);//mux2x1_1bit(in,en,out);

mux_mem m3(en_Decode, en_Execute, sel_drd, sel_dwr, en_drd, en_dwr);

mux2x1_1bit mux_pc_load(en_Execute, sel_pc_load, en_pc_load);

out_port o1(result,en_output_load,out_port,clk);

mux2x1_1bit mux_out_en(en_Writeback, out_port_en, en_output_load);

PC_source_sel pcss(clk,{I_Reg[15:12],I_Reg[1:0]},pc_source_select);

addr_MSB_gen ADDR_msb_GEN(clk, en_Fetch, I_Reg[15:12], I_Reg[8], addr_MSB);

endmodule
/*
module top_tb;
reg clk,reset;
wire [7:0] result;   //output result from alu
wire cy,zy;

processor uut(clk, reset, result, cy, zy);

initial
begin
clk = 0;
reset  = 1;
#80 reset = 0;

end

always #20 clk = ~clk;
endmodule
*/