`timescale 1ns/100ps
module counter_4bit_up_tb;

reg clk,clr_n;
wire [6:0] seg_out;

//test 하고자 하는 top module instant화

counter_4bit_up COUNTER_4 (.clk(clk), .clr_n(clr_n), .seg_out(seg_out));

initial
	clk = 1'b0; //0초로 시작

	always begin
		#10 clk = ~clk;  //5ns후에 clk의 값을 변화
	end

initial
	begin
		clr_n = 1'b1; // clr_n을 1으로 설정
		#35 clr_n = 1'b0; //4ns후에 clr_n의 값을 변화
		#38 clr_n = 1'b1; //3ns후에 clr_n의 값을 변화
	end
endmodule