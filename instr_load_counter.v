`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 12:04:43 PM
// Design Name: 
// Module Name: instr_load_counter
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


module instr_load_counter(bram_addr,progmem_addr,clk,rst,done,mem_en);

    output reg [9:0] bram_addr;
    output reg [8:0] progmem_addr;
    input clk,rst;
    output reg done;
    output [1:0] mem_en;
    
   // parameter idle1 = 2'b00;
   // parameter idle2 = 2'b01;
   // parameter idle3 = 2'b10;
   // parameter idle4 = 2'b11;
    
  //  assign done = (count_addr==9'd255)?1:0;
    assign mem_en[0] = ~done;
    assign mem_en[1] = ~done;
    
    always@(negedge clk)
    begin
        if(rst)
        begin
           bram_addr <= 10'd1022;
           progmem_addr <= 9'd509;
        end
        else if(done)
        begin
            bram_addr <= bram_addr;
            progmem_addr <= progmem_addr;
        end
        else
        begin
            bram_addr <= bram_addr + 1;
            progmem_addr <= progmem_addr + 1;
        end
    end
    
    always@(*)
    begin
        if(progmem_addr == 9'd255)
            done<= 1;
        else
            done <= 0;
    end
        
endmodule

module count_tb2;
    wire [8:0] count_addr;
    reg clk,rst;
    wire done;
    wire [1:0] mem_en;
    instr_load_counter uut(count_addr,clk,rst,done,mem_en);
    
    initial begin
    clk = 0;
    rst = 1;
    #40 rst = 0;
    #5200 rst = 1;
    #40 rst = 0;
    end
    
    always #10 clk = ~clk;
    
    
endmodule