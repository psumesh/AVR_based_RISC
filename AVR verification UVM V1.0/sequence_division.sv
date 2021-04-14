class  sequence_division extends uvm_sequence#(txn_pkg);

      `uvm_object_utils(sequence_division)

       parameter N=11;
       txn_pkg t;

       bit [15:0]inst_arr[0:N-1] = '{16'b1110_0010_0101_0011, 16'b1110_0000_0011_0101, 16'b1110_0000_0110_0000, 16'b0001_0100_0101_0011, 16'b1111_0000_0010_0100, 16'b1001_0100_0110_0011, 16'b0001_1000_0101_0011, 16'b1111_0000_0010_0101, 16'b1111_0100_0000_1100, 16'b1011_1000_0110_0000, 16'b1100_0000_0010_1011};    //division

       /*
        ---------------------------------------------------------------------------------
        | Label | address  |     Opcode     |	 Instruction(Binary)  |  Instruction(Hex) |
        ---------------------------------------------------------------------------------
        |       |   0000   |   LDI R5, 35   |  1110_0010_0101_0011  |      E253         |
        |       |   0001   |   LDI R3, 05   |  1110_0000_0011_0101  |      E035         |
        |       |   0010   |   LDI R6 00    |  1110_0000_0110_0000  |      E060         |
        |   UP  |   0011   |   CP R5 R3     |  0001_0100_0101_0011  |      1453         |
        |       |   0100   |   BRCS FIN     |  1111_0000_0010_0100  |      F024         |
        |       |   0101   |   INC R6       |  1001_0100_0110_0011  |      9463         |
        |       |   0110   |   SUB R5 R3    |  0001_1000_0101_0011  |      1853         |
        |       |   0111   |   BREQ FIN     |  1111_0000_0010_0101  |      F025         |
        |       |   1000   |   BRCC UP      |  1111_0100_0000_1100  |      F025         |
        | FIN   |   1001   |   OUT R6       |  1011_1000_0110_0000  |      B860         |
        | HERE  |   1010   |   JMP HERE     |  1100_0000_0010_1011  |      E02B         |
        ---------------------------------------------------------------------------------
        */


        function new(string name = "");
             super.new(name);
        endfunction


        task body();
             //repeat(1)
             //begin
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
