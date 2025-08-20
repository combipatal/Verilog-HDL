module mux_4bit_2x1 (up_count, down_count, select, mux_out);

input [3:0] up_count, down_count;
input select;
output [3:0] mux_out;
reg[3:0] mux_out;

always@(*)
	begin
		case(select)
			1'b0 : mux_out <= up_count;
			1'b1 : mux_out <= down_count;
		default : mux_out <= up_count;
		endcase
	end
endmodule
