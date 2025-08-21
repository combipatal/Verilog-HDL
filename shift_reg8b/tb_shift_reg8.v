`timescale 1ns/100ps
module tb_shift_reg8;

	reg clk,rst,sdin;
	wire [7:0] dout;
	
	shift_reg8b U0 (.clk(clk), .rst(rst), .sdin(sdin), .dout(dout));
	
	always begin
		#5 clk = ~clk;
	end
	
	initial begin
		clk = 0; 
		rst =1;
		#3 rst = 0;
		#10 rst = 1;
	end
	
	always begin
		sdin = 1;
		#20 sdin = 0;
		#10 sdin = 1;
		#10 sdin = 0;
		#20 sdin = 1;
		#30 sdin = 0;
		#10 sdin = 1;
		$finish;
		
	end
endmodule 