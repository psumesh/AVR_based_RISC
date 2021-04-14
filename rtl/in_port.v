`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 10:19:25 AM
// Design Name: 
// Module Name: in_port
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


module in_port(in,out,clk);
input [7:0] in;
output reg [7:0] out;
input clk;

always @(negedge clk)
begin
    out <= in;
end
endmodule
