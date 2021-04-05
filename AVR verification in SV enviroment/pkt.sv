class pkt;

	logic [15:0] instruction;
	logic [7:0] RD_out;
	logic [7:0] RA_out;
	logic [7:0] result;
	logic [7:0] pc;
	logic [4:0] aluop;
	logic cy,zy;
	
	
	function void print(string s="");
		$write("%0s           ", s);
		$write("Instion %0b  ", instruction);
		$write("RD_out %0d  ", RD_out);
		$write("RA_out %0d  ", RA_out);
		$write("Result %0d  ", result);
		$write("pc %0d  ", pc);
		$write("aluop %0d  ", aluop);
		$write("cy %0d  ", cy);
		$display("zy %0d  ", zy);
	endfunction
	
endclass