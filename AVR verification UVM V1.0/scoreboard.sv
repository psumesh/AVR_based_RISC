class scoreboard extends uvm_scoreboard;

       `uvm_component_utils(scoreboard)
        
        function new(string name, uvm_component parent);
              super.new(name,parent);
        endfunction

        uvm_analysis_imp #(txn_pkg,scoreboard) analysis_imp_scoreboard;

        txn_pkg t;

        function void build_phase(uvm_phase phase);
              analysis_imp_scoreboard=new("analysis_imp_scoreboard",this);
	endfunction

        
        function void write(txn_pkg t);
             
              $display("Scoreboard");
              if(t.en_Execute==1) begin
                   if(t.RA_out==5'b00010 && t.RD_out==00001) begin
                        uvm_info("Execute cycle",$sformatf("RA_out = %0d  RD_out = %0d Matching",t.RA_out,t.RD_out),UVM_LOW)
                        //$display("RA_out RD_out matching");
                   end
                   
                   else begin
                        `uvm_info("Execute cycle",$sformatf("RA_out = %0d  RD_out = %0d Not Matching",t.RA_out,t.RD_out),UVM_LOW)
                         //$display("RA_out RD_out not matching");
                   end
               end
              
              /*if(t.en_Writeback==1) begin
                     if(t.out_port==4'b0110) begin
                           `uvm_info("Writeback cycle",$sformatf("out_port = %0d  Matching",t.out_port),UVM_LOW)
                           //$display("Result matching");
                     end
                     
                     else begin 
                          `uvm_info("Writeback cycle",$sformatf("out_port = %0d Not Matching",t.out_port),UVM_LOW)
                          //$display("Result not matching");
                     end
               end*/
               
               if(t.en_Writeback==1) begin
                    if(t.result==4'b0000) begin
                         `uvm_info("Writeback cycle",$sformatf("Result = %0d  Matching",t.result),UVM_LOW)
                         //$display("Result matching");
                    end
                    
                    else begin
                        `uvm_info("Writeback cycle",$sformatf("Result = %0d Not Matching",t.result),UVM_LOW)
                        //$display("Result not matching");
                    end
               end
        endfunction

endclass
		
