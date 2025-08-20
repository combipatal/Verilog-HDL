module D_flip_flop (clk, din, qout, qout_B);

input clk,din;
output qout, qout_B;

reg qout;//qout_B;

assign qout_B = ~qout;

always @(posedge clk) begin
	qout <= din;
	//qout_B <= ~qout; DFF가 두개가 생김 
	
end
endmodule