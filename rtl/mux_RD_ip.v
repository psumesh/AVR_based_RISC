`timescale 1ns / 1ps


module mux_RD_ip(mem_dout, RD, sel_alu_ip, RD_out);

input [7:0]mem_dout; //LD
input [7:0]RD;      //normal
input sel_alu_ip;
output [7:0]RD_out;

assign RD_out = (sel_alu_ip==1'b1)? mem_dout : RD;
 
endmodule
