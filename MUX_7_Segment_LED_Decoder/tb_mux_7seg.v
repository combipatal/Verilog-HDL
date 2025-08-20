`timescale 1ns/100ps

module tb_mux_7seg ;

reg clk, clr_n, select;
wire [6:0] seg_out;

MUX_7_Segment_LED_Decoder M1 (.clk(clk), .clr_n(clr_n), .select(select), .seg_out(seg_out));


initial
	clk = 1'b0;

always begin // 주기 10ns
	#5 clk = ~clk;
end


initial begin  // clr_n 을 13ns뒤에 1->0 으로 negaedge
	clr_n = 1'b0;
	#4 clr_n = 1'b1;
	#20 clr_n = 1'b0;
	#4 clr_n = 1'b1;

end

initial begin
	$monitor("Time=%0t clk=%b clr_n=%b select=%b", $time, clk, clr_n, select);
	select = 1'b0;
	#20 select = 1'b0;
	#20 select = 1'b1;
	#20 select = 1'b0;
	#40 select = 1'b1;
	#40 select = 1'b0;
	#20 select = 1'b1;
end

endmodule
