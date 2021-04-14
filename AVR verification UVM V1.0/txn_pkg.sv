class txn_pkg extends uvm_sequence_item;

        bit [15:0] wr_data;
        bit [7:0] wr_addr;
        bit [1:0] we;
        logic [15:0] instruction;
        logic [7:0] RD_out;
        logic [7:0] RA_out;
        logic [7:0] result;
        logic [7:0] pc;
        logic [7:0] out_port;
        logic [4:0] aluop;
        logic en_Fetch;
        logic en_Decode;           //decoder enable
        logic en_Execute;          //alu enable
        logic en_Writeback;
        logic cy,zy;
	
        `uvm_object_utils_begin(txn_pkg)       //factory

               `uvm_field_int(wr_data,UVM_ALL_ON|UVM_HEX)
               `uvm_field_int(out_port,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(we,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(wr_addr,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(instruction,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(RD_out,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(RA_out,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(result,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(aluop,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(pc,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(en_Fetch,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(en_Decode,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(en_Execute,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(en_Writeback,UVM_ALL_ON|UVM_BIN)
               `uvm_field_int(cy,UVM_ALL_ON|UVM_DEC)
               `uvm_field_int(zy,UVM_ALL_ON|UVM_DEC)
       `uvm_object_utils_end
       
       function new ( string name = "");
            super.new(name);
       endfunction
       
endclass
