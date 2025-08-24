module led #(
	parameter WIDTH = 4 // LED 개수 4개 사용
	)(
	input [WIDTH-1:0] led_in,
	//input clk,
	//input rst_n,
	output [WIDTH-1:0] led_out
	);
	
	assign led_out = led_in;

endmodule	