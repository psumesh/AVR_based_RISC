class  sequence_XS3 extends uvm_sequence#(txn_pkg);

      `uvm_object_utils(sequence_XS3)

       parameter N=5;
       txn_pkg t;

       bit [15:0]inst_arr[0:N-1] = '{16'b1110_0000_0101_0011, 16'b1011_0000_0110_0000, 16'b0000_1100_0110_0101, 16'b1011_1000_0110_0000, 16'b1100_0000_0000_0011};       //XS-3
	
        /*
        ---------------------------------------------------------------------------------
        | Label | address  |     Opcode      |   Instruction(Binary)  | Instruction(Hex)|
        ---------------------------------------------------------------------------------
        |  LOOP |    000   |   LDI R5 03     |   1110_0000_0101_0011  |   E053          |
        |       |    001   |   IN R6         |   1011_0000_0110_0000  |   B060          |
        |       |    010   |   ADD R6 R5     |   0000_1100_0110_0101  |   B060          |
        |       |    011   |   OUT R6        |   1011_1000_0110_0000  |   B860          |
        |       |    100   |   JMP LOOP      |   1100_0000_0000_0011  |   C003          |
        ---------------------------------------------------------------------------------
        */
	
	
       function new(string name = "");
            super.new(name);
       endfunction


       task body();
          //repeat(1) begin
          for(byte i=0;i<N;i++) begin
                t=txn_pkg::type_id::create("t");
                start_item(t);
                  t.wr_data = inst_arr[i];
                  t.wr_addr = i;
                  t.we = 2'b11;
                  $display("-----Sequence-----   Time=%0t",$time);
                  t.print();
                  //#10;
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
                   //end
       endtask
       	
endclass
