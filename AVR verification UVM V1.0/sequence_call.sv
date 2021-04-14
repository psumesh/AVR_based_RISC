class  sequence_call extends uvm_sequence#(txn_pkg);

      `uvm_object_utils(sequence_call)

        parameter N=7;
        txn_pkg t;
        
        bit [15:0]inst_arr[0:N-1] = '{16'b1110_0000_0101_0100, 16'b1110_0000_0110_0110, 16'b1100_0000_0001_0101, 16'b1011_1000_0110_0000, 16'b1100_0000_0001_0011, 16'b0000_1100_011_0101, 16'b1100_0101_0000_1000};        //Call
        
        /*
        ---------------------------------------------------------------------------------
        | Label | address  |   Opcode     |      Instruction(Binary)  | Instruction(Hex)|
        ---------------------------------------------------------------------------------
        |       |    000   | LDI R5, 04   |    1110_0001_0001_0011    |       E054      |
        |       |    001   | LDI R6, 06   |    1110_0001_0010_0101    |       E066      |
        |       |    010   | CALL SUM     |    1011_1000_0001_0000    |       C015      |
        |       |    011   | OUT R6       |    1011_1000_0010_0000    |       B860      |
        |  HERE |    100   | JMP HERE     |    0000_1100_0001_0010    |       C013      |
        |  SUM  |    101   | ADD R6 R5    |    0000_1000_0001_0000    |       0C65      |
        |       |    110   | RET          |    1100_0000_0001_1011    |       C508      |
        ---------------------------------------------------------------------------------
	
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
