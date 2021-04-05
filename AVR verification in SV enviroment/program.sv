program prog(intf vif);

	environment e;
	
	initial 
	begin
		e=new(vif);
		e.run();
	end

endprogram