module MUX_7_Segment_LED_Decoder (clk, clr_n, select, seg_out);

input clk,clr_n,select;
output [6:0] seg_out;
wire [3:0] Wup_count, Wdown_count, Wmux_out;

clk_div CDIV(.clk(clk), .clr_n(clr_n), .clk_1hz(clk_1hz));
up_counter_4bit UP1(.clk(clk_1hz), .clr_n(clr_n), .up_count(Wup_count));
down_counter_4bit DOWN1(.clk(clk_1hz), .clr_n(clr_n), .down_count(Wdown_count));
mux_4bit_2x1 MUX(.up_count(Wup_count), .down_count(Wdown_count), .select(select), .mux_out(Wmux_out));
bin7seg SEG(.mux_out(Wmux_out), .seg_out(seg_out));

endmodule