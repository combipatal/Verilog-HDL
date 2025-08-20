`timescale 1ns/100ps
module tb_full_adder_4bit;


reg [3:0]a,b;
reg sel;

full_adder_4bit FDD1 (.a(a),.b(b),.sel(sel));

initial begin

   $dumpfile("dump.vcd");
   $dumpvars(0, tb_full_adder_4bit);

	a = 4'b0010;
	b = 4'b0100; // 2 + 4 = 6 (0110)
	sel = 1'b0;
	#20
	a = 4'b1100;
	b = 4'b0110; //12 - 6 = 6 (0110)
	sel = 1'b1; // 
	#20
	a = 4'b1101;
	b = 4'b1111; // 15 + 13 = 28 (1_1100)
	sel = 1'b0;
	

	end
endmodule