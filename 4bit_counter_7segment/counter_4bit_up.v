module counter_4bit_up (clk,clr_n,seg_out);

input clk,clr_n;
output [6:0] seg_out;
wire [3:0] qout;
wire clk_1hz;

clk_div CDIV(.clk(clk), .clr_n(clr_n), .clk_1hz(clk_1hz));
counter4 COUNT (.clk(clk_1hz),.clr_n(clr_n),.qout(qout));	
bin7seg SEG (.qout(qout), .seg_out(seg_out));

endmodule