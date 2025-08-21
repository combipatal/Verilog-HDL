module shift_reg8b (
	input clk,
	input rst, //reset
	input sdin,// 추가된 data
	output [7:0] led_out
	);
	
	wire [7:0] dout; // 출력 벡터 -> LED input
	reg [7:0] q; // q 수정되는 벡터

	LED #(.WIDTH(8)) led_8bit_module (.led_in(dout), .led_out(led_out)); //WIDTH : 필요한 LED 개수
	
	
	assign dout = q;
	// shift 연산자를 이용한 방법
	always @(negedge clk or negedge rst)begin // clk 를 button 으로 지정, 1->0일 때 data input
		if(!rst) q <= 8'b0000_0000;
		else begin
			q <= q << 1;
			q[0] <= sdin;
		end
	end
	
	/*
	//결합 연산자 {}를 이용한 방법
	always @(posedge clk or negedge rst)begin
		if(!rst) q<= 8'b0000_0000;
		else begin
			q <= {q[6:0], sdin};
		end
	end 
	
	//for 반복문을 이용한 방법
	always @(posedge clk or negedge rst)begin
		if(!rst) q<= 8'b0000_0000;
		else begin
			for (i = 0; i < 8 ; i++)begin
				q[i+1] = q[i];
			end
			q[0] <= sdin;
		end
	*/
	
	
endmodule