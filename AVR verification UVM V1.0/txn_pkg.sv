class txn_pkg extends uvm_sequence_item;

	bit [15:0] inst;
	logic [7:0] RD_out;
	logic [7:0] RA_out;
	logic [7:0] result;
	logic [7:0] pc;
	logic [4:0] aluop;
	logic cy,zy;
	
		`uvm_object_utils_begin(txn_pkg)       //factory
	
		`uvm_field_int(inst,UVM_ALL_ON|UVM_DEC)
		`uvm_field_int(RD_out,UVM_ALL_ON|UVM_DEC)
		`uvm_field_int(RA_out,UVM_ALL_ON|UVM_DEC)
		`uvm_field_int(result,UVM_ALL_ON|UVM_DEC)
		`uvm_field_int(aluop,UVM_ALL_ON|UVM_BIN)
		`uvm_field_int(cy,UVM_ALL_ON|UVM_DEC)
		`uvm_field_int(zy,UVM_ALL_ON|UVM_DEC)
	`uvm_object_utils_end
	
	function new ( string name = "");
		super.new(name);
	endfunction
	
	
endclass