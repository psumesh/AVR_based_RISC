`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2020 03:37:41 PM
// Design Name: 
// Module Name: Link_register
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


module Link_register(LR_in,LR_out,clk,LR_load_en);
input [7:0] LR_in;
output reg [7:0] LR_out;
input clk;
input LR_load_en;

always @(posedge clk)
begin
    if(LR_load_en)
        LR_out <= LR_in;
    else
        LR_out <= LR_out;
end
endmodule
