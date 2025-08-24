`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/23 23:59:21
// Design Name: 
// Module Name: detection
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
// 비트 단위로 입력되는 din_bit에서 비트 패턴 0110 이 검출되면 출력 detect_out = 1, 그렇지 않은 경우 0
//////////////////////////////////////////////////////////////////////////////////


module detection(
    input din_bit,
    input clk,
    input rst_n,
    output reg detect_out
    );
    //next_state
    reg [2:0] state;
    reg [2:0] next_state;
    
    parameter  start = 3'd00;
    parameter  st1 = 3'd1;
    parameter  st2 = 3'd2;
    parameter  st3 = 3'd3;
    parameter  st4 = 3'd4;    
    
   // clk_div CLK(.clk(clk), .clr_n(rst_n), .clk_enable(clk_1C));


    //다음 상태 결정
    always @(*) begin
        next_state = state;
        
        case (state)
            start : if(!din_bit) next_state = st1; 
            
				st1 : if(din_bit) next_state = st2;        // state = st0 이고 din = 1 이면 next_state = st1
            
				st2 : begin if(din_bit) next_state = st3;
                  else next_state = st1;end
            
				st3 : begin if(!din_bit) next_state = st4;
                  else next_state = start;end
            
				st4 : begin if (din_bit) next_state = st2;
                  else next_state = st1;end
						
            default : next_state = start;
        endcase
    end
    
    // 다음상태를 현재 상태에 입력
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n) begin
            state <= start; 
            
        end else if (din_bit) begin 
				state <= next_state;
				detect_out <= next_state;
				end
    end
    
endmodule
