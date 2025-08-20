 /* 
 a : 입력값 : SW 0123  sw4는 간격을 두기 위해 설정하지 않음
 b : 입력값 : sw 5678
 sel : 0이면 덧셈 1이면 뺄셈 : 뺄쎔일때 음수라면 cout = 1이 된다.
 sum : 출력값 : 4비트의 합
 cout : 4비트를 초과하는 올림값,sum이 16이상이라면 1, 16이하라면 0이된다. 
 */
  module full_adder_4bit (a,b,sel,seg_out1,seg_out2,led);
  
 input [3:0] a,b;
 input sel;
 
 output [6:0] seg_out1,seg_out2;
 output [7:0] led;
 
 reg [7:0] led;
 
 wire [2:0] Wcout;
 wire [3:0] bin,sum; 
 wire cout; 

 
 full_adder ADD1 (.a(a[0]),.b(bin[0]),.cin(sel),.sum(sum[0]),.cout(Wcout[0]));
 full_adder ADD2 (.a(a[1]),.b(bin[1]),.cin(Wcout[0]),.sum(sum[1]),.cout(Wcout[1]));
 full_adder ADD3 (.a(a[2]),.b(bin[2]),.cin(Wcout[1]),.sum(sum[2]),.cout(Wcout[2]));
 full_adder ADD4 (.a(a[3]),.b(bin[3]),.cin(Wcout[2]),.sum(sum[3]),.cout(cout));
 
 assign bin[0] = b[0]^sel;
 assign bin[1] = b[1]^sel; 
 assign bin[2] = b[2]^sel;
 assign bin[3] = b[3]^sel;
 
 bin7seg SEG_SUM (.qout(sum), .seg_out(seg_out1));
 bin7seg SEG_Cout (.qout(cout), .seg_out(seg_out2));
 
 always@(*)begin
   led[0] = a[0];
	led[1] = a[1];
	led[2] = a[2];
	led[3] = a[3];
	led[4] = b[0];
	led[5] = b[1];
	led[6] = b[2];
	led[7] = b[3];
end
 endmodule