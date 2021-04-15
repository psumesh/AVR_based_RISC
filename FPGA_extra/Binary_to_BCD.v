
module BCD( input      [7:0]Binary,
            output reg [3:0]Hundreds,
            output reg [3:0]Tens,
            output reg [3:0]Ones);

       integer i;
	
       always @(*) begin
             Hundreds = 0;
             Tens     = 0;
             Ones     = 0;
             
             for(i=7; i>=0; i=i-1) begin
                  if(Hundreds >= 5)
                      Hundreds=Hundreds+3;
                       
                  if(Tens >= 5)
                     Tens=Tens+3;
                     
                  if(Ones >= 5)
                     Ones=Ones+3;
                     
                  Hundreds    = Hundreds << 1;
                  Hundreds[0] = Tens[3];
                  Tens        = Tens << 1;
                  Tens[0]     = Ones[3];
                  Ones        = Ones << 1;
                  Ones[0]     = Binary[i];
             end
       end

endmodule



/*

module BCD_test;
  
  reg [7:0]Binary;
	wire [3:0]Hundreds;
	wire [3:0]Tens;
	wire [3:0]Ones; 
  
  BCD uut(Binary, Hundreds, Tens, Ones);
  
  initial Binary=0;
  
  always #50 Binary=Binary+1;
  
endmodule

*/

