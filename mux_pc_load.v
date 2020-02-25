`timescale 1ns / 1ps

module mux2x1_1bit(in,en,out);

input in,en;
output out;

assign out = (en==1) ? in : 1'b0;

endmodule
