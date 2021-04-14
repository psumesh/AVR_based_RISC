class monitor extends uvm_monitor;

      `uvm_component_utils(monitor);
       uvm_analysis_port#(txn_pkg) analysis_port_monitor;                //analysis port
	
       virtual intf vif;                                                //interface
       txn_pkg t;                                                       //txn
	
       function new(string name, uvm_component parent);
              super.new(name,parent);
       endfunction
       

       function void build_phase(uvm_phase phase);
              analysis_port_monitor=new("analysis_port_monitor",this);
              
              if(!uvm_config_db#(virtual intf)::get(this,"","pif",vif))
                 `uvm_error("monitor","No resources found in database")
       endfunction
       

       task run_phase(uvm_phase phase);
             t=txn_pkg::type_id::create("t");
             
             forever begin
                @(posedge vif.clk) begin
                       t.wr_data=vif.wr_data;
                       t.wr_addr=vif.wr_addr;
                       t.we=vif.we;
                       t.RD_out=vif.RD_out;
                       t.out_port=vif.out_port;
                       t.RA_out=vif.RA_out;
                       t.aluop=vif.aluop;
                       t.cy=vif.cy;
                       t.zy=vif.zy;
                       t.pc=vif.pc;
                       t.result=vif.result;
                       t.instruction=vif.instruction;
                       t.en_Fetch=vif.en_Fetch;
                       t.en_Decode=vif.en_Decode;
                       t.en_Execute=vif.en_Execute;
                       t.en_Writeback=vif.en_Writeback;
                       $display("monitor");
                       $display("Time %t",$time);
                       t.print()
                       analysis_port_monitor.write(t);
                  end
             end
        endtask
        	
endclass
