`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 10:12:37 AM
// Design Name: 
// Module Name: out_port
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


module out_port(out_port_load,load_en,out_port_out,clk);

    input [7:0] out_port_load;
    output reg [7:0] out_port_out;
    input load_en,clk;
    
    always @(posedge clk)
    begin
        if(load_en)
            out_port_out <= out_port_load;
        else
            out_port_out <= out_port_out;
    end
    
endmodule
