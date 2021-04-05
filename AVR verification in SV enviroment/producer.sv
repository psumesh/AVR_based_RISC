class producer;

	pkt p;
	mailbox mbx=new();
	
	function new(mailbox mbx);
		this.mbx=mbx;
	endfunction
	
	task run();
		repeat(10)
		begin
			p=new();
			//assert(p.randomize());
			p.instruction=16'b0000_1100_0110_0101;
			p.print("Generator");
			 mbx.put(p);
		end
		
	endtask

endclass