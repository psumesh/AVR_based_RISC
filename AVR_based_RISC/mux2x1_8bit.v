`timescale 1ns / 1ps


module mux2x1_8bit(A, B, sel, out);

input [7:0]A,B;
input sel;
output [7:0]out;

assign out = (sel==1'b1)? A : B;
 
endmodule
