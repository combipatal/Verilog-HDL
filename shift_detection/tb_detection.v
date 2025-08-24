`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/24 01:11:58
// Design Name: 
// Module Name: tb_detection
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_detection;

    // DUT(Device Under Test)의 입력으로 사용할 reg 선언
    reg din_bit;
    reg clk;
    reg rst_n;

    // DUT의 출력으로 사용할 wire 선언
    wire detect_out;

    // 테스트 대상 모듈(detection) 인스턴스화
    shift_detection uut (
        .din(din_bit),
        .clk(clk),
        .rst_n(rst_n),
        .dout(detect_out)
    );

    // 1. 클럭 생성 (100MHz, 10ns 주기)
    initial begin
        clk = 0;
    end
    always #5 clk = ~clk;

    // 2. 입력 신호 생성 (테스트 시나리오)
    initial begin
        // --- 0ns: 리셋 활성화 ---
        rst_n = 0;
        din_bit = 0;
        #10; // 10ns 동안 리셋 유지

        // --- 10ns: 리셋 비활성화 ---
        rst_n = 1;
        @(posedge clk);

        // --- 테스트 1: "0110" 패턴 입력 (성공 케이스) ---
        $display(">> Test 1: Input '0110'");
        din_bit <= 0; @(posedge clk);
        din_bit <= 1; @(posedge clk);
        din_bit <= 1; @(posedge clk);
        din_bit <= 0; @(posedge clk); // 이 시점에 패턴 완성
        @(posedge clk); // 한 클럭 뒤에 detect_out이 1이 됨
        #10;

        // --- 테스트 2: "0101" 패턴 입력 (실패 케이스) ---
        $display(">> Test 2: Input '0101'");
        din_bit <= 0; @(posedge clk);
        din_bit <= 1; @(posedge clk);
        din_bit <= 0; @(posedge clk);
        din_bit <= 1; @(posedge clk);
        #10;

        // --- 테스트 3: "0110110" 패턴 입력 (중첩 케이스) ---
        $display(">> Test 3: Input '0110110'");
        din_bit <= 0; @(posedge clk); // 0
        din_bit <= 1; @(posedge clk); // 1
        din_bit <= 1; @(posedge clk); // 1
        din_bit <= 0; @(posedge clk); // 0 -> 첫 번째 감지
        @(posedge clk);
        din_bit <= 1; @(posedge clk); // 1
        din_bit <= 1; @(posedge clk); // 1
        din_bit <= 0; @(posedge clk); // 0 -> 두 번째 감지
        @(posedge clk);
        #20;

        // --- 시뮬레이션 종료 ---
        $display(">> Simulation Finished");
        $stop;
    end

    // 3. 신호 모니터링
    initial begin
        // 시뮬레이션 중 신호 값이 변할 때마다 콘솔에 출력
        // uut.state 처럼 계층적으로 접근하여 내부 신호도 볼 수 있음
        $monitor("Time=%0t | rst_n=%b din=%b  detect=%b", $time, rst_n, din_bit, detect_out);
    end

endmodule