`include "uvm_pkg.sv"
import uvm_pkg::*;

`include "txn_pkg.sv"
`include "interface.sv"
`include "sequence_addition.sv"
`include "sequence_subtraction.sv"
`include "sequence_multiplication.sv"
`include "sequence_division.sv"
`include "sequence_call.sv"
`include "sequence_XS3.sv"
`include "processor.v"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test_addition.sv"
`include "test_subtraction.sv"
`include "test_multiplication.sv"
`include "test_division.sv"
`include "test_call.sv"
`include "test_XS3.sv"



module top1;

        logic clk,rst;
        intf pif(clk,rst);

        processor t1(.clk(pif.clk), 
                     .reset(pif.rst), 
                     .result(pif.result), 
                     .wr_addr(pif.wr_addr), 
                     .wr_data(pif.wr_data), 
                     .we(pif.we), 
                     .out_port(pif.out_port), 
                     .in_port(pif.in_port), 
                     .instruction(pif.instruction),
                     .aluop(pif.aluop), 
                     .pc(pif.pc), 
                     .RA_out(pif.RA_out),
                     .RD_out(pif.RD_out), 
                     .en_Fetch(pif.en_Fetch), 
                     .en_Decode(pif.en_Decode), 
                     .en_Execute(pif.en_Execute), 
                     .en_Writeback(pif.en_Writeback), 
                     .cy(pif.cy), 
                     .zy(pif.zy));

       
       always #5 clk=~clk;

       initial begin
               clk=0;
               rst=1;
               $display("Reset Asserted");
          #65  rst=0;
               $display("Reset Deasserted");
        //#298 rst=1; 
          #300 $finish;
        end


        initial begin
               uvm_config_db#(virtual intf)::set(null,"*","pif",pif);
               run_test("test_addition");	
	end
endmodule
