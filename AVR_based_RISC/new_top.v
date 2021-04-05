`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 11:35:35 AM
// Design Name: 
// Module Name: new_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(clk_in,rst_load,rst_processor,in_port,out_port,result);
    
input clk_in,rst_load,rst_processor;
input [7:0] in_port;
output [7:0] out_port, result;
wire done;

wire [15:0] DO;
wire [9:0] ADDR;
wire [1:0] mem_en;
wire [8:0] addr;
//wire clk;

bram flash_1(clk_in,mem_en[0],ADDR,DO,rst_load);

instr_load_counter c1(ADDR,addr,clk_in,rst_load,done,mem_en);

processor p1(clk_in, rst_processor, result,addr[7:0],DO,mem_en,out_port,in_port);  //(clk, reset, result,wr_addr,wr_data,we,out_port,in_port);
       
    
endmodule

module top_tb;


reg clk_in,rst_load,rst_processor;
reg [7:0] in_port;
wire [7:0] out_port, result;


top t1(clk_in,rst_load,rst_processor,in_port,out_port,result);

initial
begin
clk_in = 0;
rst_processor  = 1;
rst_load = 1;

#80 rst_load = 0;
 #12000 rst_processor = 0;


end

always #20 clk_in = ~clk_in;
endmodule

