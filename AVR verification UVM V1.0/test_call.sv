class test_call extends uvm_test;

        env e;
        sequence_call s;
        
        `uvm_component_utils(test_call)
        
        function new(string name, uvm_component parent);
              super.new(name,parent);
        endfunction
     
     
        function void build_phase(uvm_phase phase);
              e=env::type_id::create("e",this);
        endfunction
        
        
        task run_phase(uvm_phase phase);
             
             phase.raise_objection(this);
             begin
               repeat(8) begin
                    s=sequence_call::type_id::create("s", this);
                    s.start(e.a.seq);
               end
             end
             phase.drop_objection(this);
        endtask

endclass
