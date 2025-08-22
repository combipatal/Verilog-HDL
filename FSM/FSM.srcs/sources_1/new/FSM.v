`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/23 00:45:02
// Design Name: 
// Module Name: FSM
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

//clk rst_n in out 
module FSM(
    input b_in,     // 입력 값 
    input clk,      // clock
    input rst_n,    // reset
    output reg b_out    // 출력 값
    );
    
    reg [1:0] state; //2bit state (00,01,10,11)
    reg [1:0] next_state; // next state reg
    
    parameter s0 = 0; //파라미터 선언
    parameter s1 = 2'b01;
    parameter s2 = 2'b10; 
    parameter s3 = 2'b11;
    
    //Next state -  현재 state 와 input 에 따라 next state 결정 
    always @(*)begin
        next_state = state; // 기본적으로 현재 상태 유지 -> 의도치 않은 latch 방지 
        
        case (state)
        
            s0 : begin                              //s0 state 에서 b_in = 0 -> next_state = s1
                 if(b_in == 0 ) begin               //b_in = 0 -> next_state = s1
                    next_state = s1;
                    end
                 else  begin
                    next_state = s3;                //bin = 1 -> next_state = s3
                    end
                 end  
                 
            s1 : if(b_in == 0 ) next_state = s2;    //s1 state 에서 bin = 0 -> next_state = s2
            
            s2 : begin 
                 if(b_in == 0 ) begin               //s2 state 에서 bin = 0 -> next_state = s1
                    next_state = s1;
                    end
                 else begin 
                    next_state = s3;                //bin = 1 -> next state = s3;
                    end
                 end
                    
            s3 : if (b_in == 1) next_state = s0;     // s3 state 에서 bin = 1 -> next state = s0
        endcase  
     end
    
    //state transition logic - state를 clk 에 맞춰 변화시키는 부
    always @(posedge clk or negedge rst_n) begin
        if (rst_n == 0) state = s0;
        else  state = next_state;
    end
    
    //state ouput logic - state 에 맞는 output 출력
    always @(posedge clk or negedge rst_n) begin     
        if (rst_n == 0) b_out = 0;
        
        case (state)
            
            s0 : b_out = 0;
            s1 : b_out = 0;
            s2 : b_out = 1;
            s3 : b_out = 1;
    
        endcase
    end
endmodule
