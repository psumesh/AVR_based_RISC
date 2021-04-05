class environment;

	driver d;
	producer p;
	monitor m;
	scoreboard s;
	
	mailbox mbx=new();
	mailbox mon2scb=new();
	
	virtual intf vif;
	
	function new(virtual intf vif);
		this.vif=vif;
	endfunction
	
	task run();
		d=new(mbx, vif);
		p=new(mbx);
		m=new(mon2scb, vif);
		s=new(mon2scb);
		fork
			p.run();
			d.run();
			m.run();
			s.run();
		join
		
	endtask
	
	

endclass