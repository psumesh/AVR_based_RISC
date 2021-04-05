class driver extends uvm_driver#(txn_pkg);

	`uvm_component_utils(driver)
	
	virtual intf vif;												//interface
	txn_pkg t;														//txn
	
	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction;
	
	
	
	function void build_phase(uvm_phase phase);
	
		if(!uvm_config_db #(virtual intf)::get(this,"","pif",vif));
			`uvm_error("driver","No config db found")
	endfunction
	
	task run_phase(uvm_phase phase);
	
		seq_item_port.get_next_item(t);
			@(negedge vif.clk)
			vif.inst=t.inst;
			/*@(negedge vif.clk);
			@(negedge vif.clk);
			@(negedge vif.clk);
			@(negedge vif.clk);*/
		
			
			
			$display("------Driver-----  Time=%0t",$time);
		
			t.print();
		seq_item_port.item_done();
			
	endtask
	
endclass