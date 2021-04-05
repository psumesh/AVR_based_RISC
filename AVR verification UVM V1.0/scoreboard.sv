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
		if(t.result==1)
			$display("Matching");
		else
			$display("Not Matching");
		
	endfunction
	
endclass
		