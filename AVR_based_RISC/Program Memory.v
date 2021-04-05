`timescale 1ns / 1ps


module Program_Memory(clk,rden,rd_addr,instr,wr_addr,wr_data,we);

    output reg [15:0] instr;
    input clk;
    input [15:0] wr_data;
    input [7:0] rd_addr,wr_addr;
    input rden;
    input [1:0] we;
    
reg [15:0] Instruction_mem [255:0];

always@(posedge clk)
begin
    if(we == 2'b11)
        Instruction_mem[wr_addr] = wr_data;
    if(rden)
        instr = Instruction_mem[rd_addr];
    else
        instr = 16'd0;
end
  
endmodule
