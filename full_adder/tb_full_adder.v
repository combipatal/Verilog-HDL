`timescale 1ns/100ps
module tb_full_adder;

reg a,b,cin;
wire sum,cout;

full_adder U0(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout)); 

initial begin
	//$dumpfile("dump.vcd");
	//어떤 이름으로 waveform 파일을 만들지 지정합니다. VCD(Value Change Dump)는 표준 waveform 파일 형식입니다.
	//$dumpvars(0, tb_full_adder); 
	// dumpvars 어떤 모듈의 신호들을 저장할지 지정합니다.
	//0: 지정한 모듈을 포함한 모든 하위 모듈의 신호를 저장하라는 의미입니다.
	//tb_full_adder: 신호를 저장할 최상위 테스트벤치 모듈의 이름을 적어줍니다.
		 
	// 모니터링 코드 추가
	$monitor("Time=%0t a=%b b=%b cin=%b | sum=%b cout=%b", $time, a, b, cin, sum, cout);
	//$time은 Verilog 시뮬레이션에서 현재 시뮬레이션 시간이 얼마인지를 알려주는 시스템 함수(System Function)입니다. 
	//주로 테스트벤치(Testbench)에서 현재 시간이 얼마인지 확인하고 출력할 때 사용합니다.
		 a = 0; b = 0; cin = 0; // sum = 0, cout = 0
	#10 a = 0; b = 1; cin = 0; // sum = 1, cout = 0
	#10 a = 0; b = 0; cin = 1; // sum = 1, cout = 0
	#10 a = 0; b = 1; cin = 1; // sum = 0, cout = 1
	#10 a = 1; b = 0; cin = 0; // sum = 1, cout = 0
	#10 a = 1; b = 1; cin = 0; // sum = 0, cout = 1
	#10 a = 1; b = 0; cin = 1; // sum = 0, cout = 1
	#10 a = 1; b = 1; cin = 1; // sum = 1, cout = 1
	#10 $finish;
end

endmodule