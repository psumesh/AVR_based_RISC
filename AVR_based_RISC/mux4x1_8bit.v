`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2020 05:44:01 PM
// Design Name: 
// Module Name: mux4x1_8bit
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

module mux4x1_8bit(A, B, C, sel, out);

input [7:0]A,B,C;
input [1:0] sel;
output reg [7:0]out;

always@(*)
begin
case(sel)
2'b00:out<=B;
2'b10:out<=A;
2'b01:out<=C;
2'b11:out<=0;
default:out<=0;

endcase
end
 
endmodule
