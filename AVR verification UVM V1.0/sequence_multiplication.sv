class  sequence_multiplication extends uvm_sequence#(txn_pkg);

      `uvm_object_utils(sequence_multiplication)

       parameter N=10;
       txn_pkg t;

       bit [15:0]inst_arr[0:N-1] = '{16'b1110_0000_0101_0011, 16'b1110_0000_0011_0101, 16'b1110_0000_0110_0000, 16'b0000_1100_0110_0011, 16'b1001_0100_0101_1010, 16'b0011_0000_0101_0000, 16'b1111_0000_0010_0001, 16'b1100_0000_0000_1111, 16'b1011_1000_0110_0000, 16'b1100_0000_0010_0111};    //multiplication
	
        /*
        ---------------------------------------------------------------------------------
        | Label | address  |    Opcode     |   Instruction(Binary)    | Instruction(Hex) |
        ---------------------------------------------------------------------------------
        |       |  0000    |  LDI R5, 03   |   1110_0001_0001_0011    |      E053        |
        |       |  0001    |  LDI R3, 05   |   1110_0001_0010_0101    |      E035        |
        |       |  0010    |  LDI R6 00    |   1011_1000_0001_0000    |      E060        |
        |  UP:  |  0011    |  ADD R6, R3   |   1011_1000_0010_0000    |      0C63        |
        |       |  0100    |  DEC R5       |   0001_1000_0001_0010    |      945A        |
        |       |  0101    |  CPI R5, 00   |   1011_1000_0001_0000    |      3050        |
        |       |  0110    |  BREQ DOWN    |   1111_0000_0010_0001    |      F021        |
        |       |  0111    |  JMP UP       |   1100_0000_0000_1111    |      C00F        |
        |  DOWN |  1000    |  OUT R6       |   1011_1000_0110_0000    |      B860        |
        |  HERE |  1001    |  JMP HERE     |   1100_0000_0010_0111    |      C027        |
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


