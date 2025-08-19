module counter_4bit_up (clk,clr_n,seg_out);

input clk,clr_n;
output [7:0] seg_out;
wire [3:0] qout;

counter4 COUNT (.clk(clk),.clr_n(clr_n),.qout(qout));	
bin7seg SEG (.qout(qout), .seg_out(seg_out));

endmodule