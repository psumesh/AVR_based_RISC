class driver;

	pkt p;
	mailbox mbx=new();
	virtual intf vif;
	
	function new(mailbox mbx, virtual intf vif);
		this.mbx=mbx;
		this.vif=vif;
	endfunction
	
	task run();
		forever 
		begin
			mbx.get(p);
			p.print("driver");
			vif.instruction=p.instruction;
			//vif.RD_out=p.RD_out;
			//vif.RA_out=p.RA_out;
			//vif.result=p.result;
			//vif.pc=p.pc;
			//vif.aluop=p.aluop;
			//vif.cy=p.cy;
			//vif.zy=p.zy;
			@(posedge vif.clk);
		end
	endtask
endclass
	