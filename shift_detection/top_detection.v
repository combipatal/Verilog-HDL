module top_detection(
	input d_in,
	input clk,
	input rst_n,
	output led_out,
	output [6:0] seg_out0,
	output [6:0] seg_out1,
	output [6:0] seg_out2,
	output [6:0] seg_out3
);


wire [3:0] d_arry;
wire [3:0] led_in;

clk_div CLK(
	.clk(clk), 
	.clr_n(rst_n), 
	.clk_enable(clk_1S)
	);

shift_detection DET(
    .din(d_in),							// input d_in
    .clk(clk_1S),							// clk
    .rst_n(rst_n),						// reset
    .dout(led_out),						// 0110을 감지 -> LED_IN (wire)
	 .save_data(d_arry)    				// 입력값을 seg로 연결 -> seg_in(wire)
    );
	 
bin7seg SEG0(
	.seg_in(d_arry[0]),
	.seg_out(seg_out0));
	
bin7seg SEG1(
	.seg_in(d_arry[1]),
	.seg_out(seg_out1));
	
bin7seg SEG2(
	.seg_in(d_arry[2]),
	.seg_out(seg_out2));
	
bin7seg SEG3(
	.seg_in(d_arry[3]),
	.seg_out(seg_out3));
	
	
endmodule






