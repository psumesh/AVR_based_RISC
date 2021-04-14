`timescale 1ns / 1ps


module mux2x1_1bit(A, B, sel, out);

input A,B;
input sel;
output out;

assign out = (sel==1'b1)? A : B;
 
endmodule
