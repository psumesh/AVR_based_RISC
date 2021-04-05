class env extends uvm_env;

	my_agent a;
	scoreboard scb;
	
	`uvm_component_utils(env)
	
	function new(string name, uvm_component parent);
		
		super.new(name,parent);
		
	endfunction
	
	function void build_phase(uvm_phase phase);
	
		a=my_agent::type_id::create("a",this);
		scb=scoreboard::type_id::create("scb",this);
		
	endfunction
	
	function void connect_phase(uvm_phase phase);
	
		a.analysis_port_agent.connect(scb.analysis_imp_scoreboard);
	
	endfunction
	
endclass
