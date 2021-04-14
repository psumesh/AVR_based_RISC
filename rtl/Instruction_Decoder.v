`timescale 1ns / 1ps

module Instruction_Decoder(clk, ID, en_dec, aluop, sel_alu_ip, sel_drd, sel_dwr, sel_pc_load, cy, zy,sel_LR_load,out_port_en);
	
	input [10:0] ID;		//16-bit Instruction REG
	input clk;
	input en_dec;
	output reg [4:0] aluop;	        //ALU function
	//output reg [4:0] RD_addr;		//Destination REG
	output reg [2:0] sel_alu_ip;          
	output reg sel_drd;      
	output reg sel_dwr;
	output reg sel_pc_load;
	output reg sel_LR_load;
	output reg out_port_en;
	input cy,zy;

initial begin
sel_alu_ip = 3'b000;
sel_drd = 1'b0;
sel_dwr = 1'b0;
sel_pc_load = 1'b0;
out_port_en <=0;
end

	
	always@(posedge clk)
	begin
		if(en_dec==1)
		begin
		
			//RD_addr[4:0]<=ID[8:4];	//Destination REG Address(RD_addr)-->d dddd
			
			case(ID[10:7])
			        
			//ADD , LSL
			4'b0000:begin
                        if(ID[6]==1)	
                                    aluop<=5'b00001;	             //ADD,LSL
                        else
                                    aluop <= 5'b00000;
                                    sel_alu_ip<=3'b000;
                                    sel_dwr<=1'b0;
                                    sel_drd<=1'b0;
                                    sel_pc_load <= 1'b0;
                                    sel_LR_load  <= 0;
                                    out_port_en <=0;
                     end
                                
			//ADC, SUB, CP, ROL
			4'b0001:begin
			             case(ID[6:5])
                             2'b01: aluop<=5'b01011;    //CP
                             2'b10: aluop<=5'b00011;    //SUB
                             2'b11: aluop<=5'b00010;    //ADC,ROL
			             endcase
						sel_alu_ip<=3'b000;
						sel_dwr<=1'b0;
                        sel_drd<=1'b0;
                        sel_pc_load <= 1'b0;
                        sel_LR_load  <= 0;
                        out_port_en <=0;
					end
			
			//AND,OR,EOR,MOV
			4'b0010:begin
						case(ID[6:5])
						
							2'b00:aluop<=5'b00100;	//AND
							
							2'b01:aluop<=5'b00110;	//EOR
							
							2'b10:aluop<=5'b00101;	//OR
							
							2'b11:aluop<=5'b11110;	//MOV
							
						endcase
						sel_alu_ip<=3'b000;
						sel_dwr<=1'b0;
                        sel_drd<=1'b0;
                        sel_pc_load <= 1'b0;
                        sel_LR_load  <= 0;
                        out_port_en <=0;
					end
			
            //CPI	
            4'b0011:begin
                         aluop<=5'b01011;
                         sel_alu_ip<=3'b100;
                         sel_dwr<=1'b0;
                         sel_drd<=1'b0;
                         sel_pc_load <= 1'b0;                       
                         sel_LR_load  <= 0;
                         out_port_en <=0;
                    end
            //OPI	
            4'b0110:begin
                         aluop<=5'b00101;
                         sel_alu_ip<=3'b100;
                         sel_dwr<=1'b0;
                         sel_drd<=1'b0;
                         sel_pc_load <= 1'b0;
                         sel_LR_load  <= 0;
                      out_port_en <=0;
                    end
                    
             //ANDI	
            4'b0111:begin
                         aluop<=5'b00100;
                         sel_alu_ip<=3'b100;
                         sel_dwr<=1'b0;
                         sel_drd<=1'b0;                       
                         sel_LR_load  <= 0;
                         sel_pc_load <= 1'b0;
                         out_port_en <=0;
                    end
        
           
                  
			//COM,NEG,SWAP,INC,ASR,LSR,ROR,DEC
			4'b1001:begin
						if(ID[6:4]==3'b010)
						begin
							case(ID[3:0])
							
							    4'b0000:aluop<=5'b01001;	//COM
							    
							    4'b0001:aluop<=5'b01101;    //NEG
							    
							    4'b0010:aluop<=5'b01111;    //SWAP
							    
								4'b0011:aluop<=5'b00111;	//INC
				
                                4'b0101:aluop<=5'b01110;    //ASR
											
								4'b0110:aluop<=5'b01010;	//LSR
								
								4'b0111:aluop<=5'b01100;    //ROR
								
								4'b1010:aluop<=5'b01000;	//DEC
								
							endcase
							sel_alu_ip<=3'b000;
							sel_dwr<=1'b0;
                            sel_drd<=1'b0;
                            sel_pc_load <= 1'b0;                       
                            sel_LR_load  <= 0;
                            out_port_en <=0;
						end
					  end
             
             //STS -> Store Direct to Data 
             4'b1010:begin
                          aluop<=5'b00000;
                          sel_alu_ip<=3'b000;
                          sel_dwr<=1'b1;
                          sel_drd<=1'b0;
                          sel_pc_load <= 1'b0;
                          sel_LR_load  <= 0;
                          out_port_en <=0;                          
                       end
           //LD
           4'b1000:begin
                  aluop<=5'b00000;    //LD
                 // RD_addr[4]<=1'b0;
                  sel_alu_ip<=3'b010;
                  sel_drd<=1'b1;
                  sel_dwr<=1'b0;
                  sel_pc_load <= 1'b0;
                  sel_LR_load  <= 0;
                  out_port_en <=0;
             end
                        
       //JMP,CALL,RET
       
 //***************************************************************************************************************sel_LR_load,sel_pc_load_src
       4'b1100:begin
                  if(ID[1:0]==2'b11)
                  begin
                       sel_LR_load  <= 0;
                       aluop<=5'b00000;    //JMP
                       sel_alu_ip<=3'b000;
                       sel_drd<=1'b0;
                       sel_dwr<=1'b0;
                       sel_pc_load <= 1'b1;
                       out_port_en <=0;
                       
                  end
                  else if(ID[1:0]==2'b01)      //CALL
                  begin
                      sel_LR_load  <= 1;
                      aluop<=5'b00000;
                      sel_alu_ip<=3'b000;
                      sel_drd<=1'b0;
                      sel_dwr<=1'b0;
                      sel_pc_load <= 1'b1;
                      out_port_en <=0;
                  end
                  else if(ID[1:0]==2'b00)      //RET
                  begin
                  sel_LR_load  <= 0;
                      aluop<=5'b00000;
                      sel_alu_ip<=3'b000;
                      sel_drd<=1'b0;
                      sel_dwr<=1'b0;
                      sel_pc_load <= 1'b1;
                      out_port_en <=0;
                  end
                      
              end
      
                     
                           
            //LDI -> load immediate value
            4'b1110:begin
                        out_port_en <=0;
                       aluop<=5'b11110;
                       sel_alu_ip<=3'b100;
                       sel_dwr<=1'b0;
                       sel_drd<=1'b0;
                       sel_pc_load <= 1'b0;                       
                       sel_LR_load  <= 0;
                    end
                       
         		
			//BRCC, BRCS, BREQ
			4'b1111:begin
			         case({ID[5],ID[1:0]})
                         3'b100:begin
                            if(cy==0)sel_pc_load<= 1'b1;
                            else sel_pc_load<= 1'b0;    //BRCC
                         end
                         3'b000:begin
                            if(cy==1)sel_pc_load<= 1'b1;
                            else sel_pc_load<= 1'b0;     //BRCS
                         end
                      
                         3'b001:begin
                         if(zy==1)sel_pc_load<= 1'b1;     //BREQ
                         else sel_pc_load<= 1'b0;
                         end
                         3'b101:begin
                         if(zy==0)sel_pc_load<= 1'b1;     //BRNE
                         else sel_pc_load<= 1'b0;
                         end
                         default:sel_pc_load <= 1'b0;
			         endcase
			         out_port_en <=0;
			         aluop<=5'b00000;
                     sel_alu_ip<=3'b000;
                     sel_dwr<=1'b0;
                     sel_drd<=1'b0;
                     sel_LR_load  <= 0;
			        end 
			         4'b1011:begin
                        if(ID[6])
                        begin
                            aluop<=5'b00000;
                            sel_alu_ip<=3'b000;
                            sel_dwr<=1'b0;
                            sel_drd<=1'b0;
                            sel_LR_load  <= 0;
                            out_port_en <=1;
                            sel_pc_load<= 1'b0;
                        end
                        else
                        begin
                            aluop<=5'b00000;
                            sel_alu_ip<=3'b001;
                            sel_dwr<=1'b0;
                            sel_drd<=1'b0;
                            sel_LR_load  <= 0;
                            out_port_en<=0;
                            sel_pc_load<= 1'b0;
                        end
			         end		  
			endcase
		end
	end
			
endmodule	

		   	

