 module full_adder_4bit (a,b,sel);
  
 input [3:0] a,b;
 input sel;
 wire [2:0] Wcout;
 wire [3:0] bin,sum; 
 wire [6:0] seg_out1,seg_out2;
 wire [7:0] led;
 wire cout; //시뮬레이션용 코드 -> 업로드시 수정

 
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
 
 assign led[0] = a[0];
 assign led[1] = a[1];
 assign led[2] = a[2];
 assign led[3] = a[3];
 assign led[4] = b[0];
 assign led[5] = b[1];
 assign led[6] = b[2];
 assign led[7] = b[3];

 endmodule