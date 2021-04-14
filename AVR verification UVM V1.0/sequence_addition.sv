class  sequence_addition extends uvm_sequence#(txn_pkg);

       `uvm_object_utils(sequence_addition)
        parameter N=7;
        txn_pkg t;


        bit [15:0]inst_arr[0:N-1] = '{16'b1110_0001_0001_0011, 16'b1110_0000_0010_0101, 16'b0000_1100_0001_0010, 16'b1011_1000_0001_0000, 16'b1100_0000_0001_1011};        //Addition
        
       /*
       -------------------------------------------------------------------------------
       | Label | address|     Opcode   |   Instruction(Binary)   |  Instruction(Hex) |
	------------------------------------------------------------------------------
       |       | 000    |  LDI R1, 19  |   1110_0001_0001_0011   |       E113        |
       |       | 001    |  LDI R2, 05  |   1110_0000_0010_0101   |       E025        |
       |       | 010    |  ADD R1, R2  |   0000_1100_0001_0010   |       0C12        |
       |       | 011    |  OUT  R1     |   1011_1000_0001_0000   |       B810        |
       | END:  | 100    |  JMP END     |   1100_0000_0001_1011   |       C01B        |
       ------------------------------------------------------------------------------
       */


        function new(string name = "");
            super.new(name);
        endfunction


        task body();

            for(byte i=0;i<N;i++) begin
                 t=txn_pkg::type_id::create("t");
              start_item(t);
                 t.wr_data = inst_arr[i];
                 t.wr_addr = i;
                 t.we = 2'b11;
                 $display("-----Sequence-----   Time=%0t",$time);
                 t.print();
              finish_item(t);
            end

            t=txn_pkg::type_id::create("t");
            start_item(t);
              t.wr_data = 16'b0000_0000_0000_0000;
              t.wr_addr = 8'hFF;
              t.we = 2'b00;
              $display("-----Sequence-----   Time=%0t",$time);
              t.print();
            finish_item(t);

        endtask
	
endclass
