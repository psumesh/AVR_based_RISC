module addr_MSB_gen(clk, en_fetch, I, RD_addr, RD_addr_MSB);

    input clk,en_fetch;
    input [3:0]I;
    input RD_addr;
    output reg RD_addr_MSB;
    
    always@(negedge clk)
    begin
        if(en_fetch)
            if((I==4'b0011)||(I==4'b0110)||(I==4'b0111)||(I==4'b1000)||(I==4'b1010)||(I==4'b1110))
                RD_addr_MSB <= 1'b0;
            else
                RD_addr_MSB <= RD_addr;
    end

endmodule
