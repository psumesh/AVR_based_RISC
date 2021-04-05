class  my_sequence extends uvm_sequence#(txn_pkg);

	`uvm_object_utils(my_sequence)
	
	txn_pkg t;

	
	function new(string name = "");
		super.new(name);
	endfunction
	
	
	task body();
	
		//#25
	
		repeat(4)
		begin
		t=txn_pkg::type_id::create("t");
		
		start_item(t);
		t.inst=16'b0001_1000_0110_0101;     // SUB inst=>000011 r=>01010 d=>10101
		$display("-----Sequence-----   Time=%0t",$time);
		t.print();
		//#3;
		finish_item(t);
	

	end
	endtask
	
endclass
