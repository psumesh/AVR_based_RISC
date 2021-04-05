class monitor;

	mailbox mon2scb=new();
	//mailbox mon2cov=new():
	virtual intf vif;
	
	function new(mailbox mbxs, virtual intf vif);
		this.mon2scb=mbxs;
		//this.mon2cov=mbxc;
		this.vif=vif;
	endfunction
	
	pkt p1, p2;
	
	task run();
		p1=new();
		forever begin
		@(posedge vif.clk)
		begin
		p1.instruction=vif.instruction;
		p1.RD_out=vif.RD_out;
		p1.RA_out=vif.RA_out;
		p1.result=vif.result;
		p1.pc=vif.pc;
		p1.aluop=vif.aluop;
		p1.cy=vif.cy;
		p1.zy=vif.zy;
		p1.print("Monitor");
		mon2scb.put(p1);
		end
		end
	endtask

endclass