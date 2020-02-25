`timescale 1ns / 1ps
/*
The program counter points to the location of the next instruction to be executed from the program memory
It is incremented after the execution of each instruction.
The Program counter can be loaded with a possible non contiguous value during jump,call or branch instructions
*/
module Program_Counter(clk, reset, en_PC, PC,load,load_en);
	
	input reset,clk;
    input en_PC,load_en;	//enable signals
    input [7:0] load;		//Load input
    output reg [7:0] PC;	//Current value of PC
    
    always@(posedge clk)
    begin
        if(reset)
            PC <= 8'd0;		//Reset PC
        else if(load_en)
            PC <= load;		//Loading PC with new address
        else if(en_PC)
            PC <= PC + 1;	//Increment PC for next instruction
        else
            PC <= PC;
    end

endmodule
