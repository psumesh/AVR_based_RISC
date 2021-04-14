interface intf(input logic clk,rst);

        logic [7:0] RD_out;
        logic [7:0] RA_out;
        logic [7:0] result;
        logic [7:0] pc;
        logic [4:0] aluop;
        logic [7:0] wr_addr;
        logic [15:0] wr_data;
        logic [1:0] we;
        logic [7:0] out_port;
        logic [7:0] in_port;
        logic [15:0] instruction;
        logic en_Fetch;
        logic en_Decode;           //decoder enable
        logic en_Execute;          //alu enable
        logic en_Writeback;
        logic cy,zy;

        //modport dut (input inst,clk,rst,output RD_out,RA_out,aluop,result,cy,zy,pc);

endinterface
