class scoreboard;

	mailbox mon2scb=new();
	pkt p=new();
	
	function new(mailbox mbx);
		this.mon2scb=mbx;
		$display("Scoreboard");
	endfunction
		
	
	//bit [15:0]instruction;
	
	task run();
		forever begin
			p=new();
			mon2scb.get(p);
			//$display("Scoreboard %0d", p.result);
			
			if(p.result==10'd11)
			begin
				$display("Matching ");
			end
				
			else
			begin
				$display("Not Matching");
			end
			
		end
	endtask

endclass