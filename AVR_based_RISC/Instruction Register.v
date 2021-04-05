`timescale 1ns / 1ps
/*
The instruction register stores the current instruction to be executed from the program memory location pointed
by the program counter. This register remains unchanged for all four operating cycles. 
*/
module Instruction_Register(clk,en_IR,I_fetch,I_decode);
 
input clk,en_IR;   
input [15:0] I_fetch;
output reg [15:0] I_decode;


always@(posedge clk)
begin
    if(en_IR)
        I_decode<=I_fetch;		//New instruction is loaded only if register loading is enabled
end

endmodule
/*
module IR_test;

reg [15:0] I_fetch;
wire [15:0] I_decode;
reg clk,en;

 Instruction_Register uut(clk,en_IR,I_fetch,I_decode);

initial begin
clk = 0;
en = 0;
end

always #10 clk = ~clk;
always #25 I_fetch = $random;
always #100 en = ~en;

endmodule*/