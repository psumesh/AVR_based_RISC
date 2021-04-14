class my_agent extends uvm_agent;

        driver drv;
        sequencer seq;
        monitor mon;
	
       `uvm_component_utils(my_agent)

        uvm_analysis_port #(txn_pkg) analysis_port_agent;			//analysis port agent 

        function new(string name, uvm_component parent);
           super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
	
                analysis_port_agent=new("analysis_port_agent",this);
                drv =driver::type_id::create("drv",this);
                seq =sequencer::type_id::create("seq",this);
                mon =monitor::type_id::create("mon",this);
       endfunction
       
       
       function void connect_phase(uvm_phase phase);
               drv.seq_item_port.connect(seq.seq_item_export);			//master.connect(slave)
               mon.analysis_port_monitor.connect(analysis_port_agent);
       endfunction

endclass
