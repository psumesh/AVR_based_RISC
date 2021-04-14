class driver extends uvm_driver #(txn_pkg);

       `uvm_component_utils(driver)

        virtual intf vif;                                                      //interface
        txn_pkg t;                                                             //txn

        function new(string name, uvm_component parent);
             super.new(name,parent);
        endfunction;


        function void build_phase(uvm_phase phase);
              
              if(!uvm_config_db#(virtual intf)::get(this,"","pif",vif))
                  `uvm_error("driver","No resources found in database")
        endfunction

        task run_phase(uvm_phase phase);	
               repeat(12) begin
               seq_item_port.get_next_item(t);
                       @(negedge vif.clk);
                       vif.wr_data=t.wr_data;
                       vif.wr_addr=t.wr_addr;
                       vif.we=t.we;
                       vif.in_port=8'd7;
                       $display("------Driver-----  Time=%0t",$time);
                       t.print();
                      
                seq_item_port.item_done();
              end
       endtask
       	
endclass
