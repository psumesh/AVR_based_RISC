`timescale 1ns / 1ps


module mux_RA_ip(Imm, RA, sel_alu_ip, RA_out);

input [7:0]RA;      //normal
input [7:0]Imm;   //LDI
input sel_alu_ip;
output [7:0]RA_out;

assign RA_out = (sel_alu_ip==1'b1)? Imm : RA;
 
endmodule
