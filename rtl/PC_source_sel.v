`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2020 11:05:26 PM
// Design Name: 
// Module Name: PC_source_sel
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


module PC_source_sel(clk,ireg_in,out);

input clk;
input [5:0] ireg_in;
output reg out;

always @(negedge clk)
begin
    if(ireg_in == 6'b110000)
        out <= 0;
    else 
        out <= 1;
end

endmodule
