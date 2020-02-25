`timescale 1ns / 1ps

/*
	

*/



module Control_Unit(clk,reset,en_PM,en_Fetch,en_Decode,en_Execute,en_Writeback);


parameter idle = 5'b0000;
parameter fetch = 5'b0001;    
parameter decode = 5'b0010;
parameter execute = 5'b0011;
parameter writeback = 5'b0100;    
    
reg [4:0] ps ,ns;
input clk;
input reset;
output reg en_Fetch,en_PM,en_Decode,en_Execute,en_Writeback;


always@(negedge clk)
begin
    if(reset)
        ps <= idle;
    else
        ps <= ns;
 end
 
 always@(ps)
 begin
    case(ps)
    idle:begin
            ns <= fetch;
            en_PM <= 1;
            en_Fetch <= 0;
            en_Decode    <= 0;
            en_Execute   <= 0;
            en_Writeback <= 0;    
        end
		
   fetch: begin 
            ns           <= decode;
            en_PM        <= 0;
            en_Fetch     <= 1;
            en_Decode    <= 0;
            en_Execute   <= 0;
            en_Writeback <= 0;
          end   //fetch
    
    decode: begin
                ns <= execute;
                en_PM <= 0;
                en_Fetch <= 0;
                en_Decode <= 1;
                en_Execute <= 0;
                en_Writeback <= 0;
            end
    
    execute: begin
                 ns <= writeback;
                 en_PM <= 0;
                 en_Fetch <= 0;
                 en_Decode <= 0;
                 en_Execute <= 1;
                 en_Writeback <= 0;
            end

     writeback: begin
                  ns <= fetch;
                  en_PM <= 1;
                  en_Fetch <= 0;
                  en_Decode <= 0;
                  en_Execute <= 0;
                  en_Writeback <= 1;
              end
    
    default: begin
                en_PM <= 0;
                en_Fetch <= 0;
                en_Decode <= 0;
                en_Execute <= 0;
                en_Writeback <= 0;
                ns<= idle;
            end
    endcase
end

endmodule 
