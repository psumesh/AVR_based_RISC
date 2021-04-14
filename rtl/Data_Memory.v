`timescale 1ns / 1ps

module Data_Memory(clk,en_drd,en_dwr,mem_addr,mem_din,mem_dout);
  input clk;
    input en_drd;               //enable data read (mem_addr)
    input en_dwr;               //enable data write (mem_din) 
    input [7:0]mem_addr;        //memory address
    input [7:0]mem_din;         //memory data input
    output reg [7:0]mem_dout;   //memory data output

reg [7:0]data_mem[0:255];



always@(posedge clk)
begin
    if(en_drd)
    begin
      mem_dout <= data_mem[mem_addr];
    end
    if(en_dwr)
    begin
        data_mem[mem_addr] <= mem_din;
    end
end

endmodule
