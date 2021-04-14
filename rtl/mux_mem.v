`timescale 1ns / 1ps

module mux_mem(en_dec, en_WD, sel_drd, sel_dwr, en_drd, en_dwr);

input en_dec,sel_drd;
output en_drd;
input en_WD,sel_dwr;
output en_dwr;

assign en_dwr = (sel_dwr==1) ? en_WD : 1'b0;

assign en_drd = (sel_drd==0) ? en_dec : 1'b1;

endmodule