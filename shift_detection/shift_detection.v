`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2025/08/24 13:02:18
// Design Name: shift_detection
// Module Name: shift_detection
// Project Name: 
// Target Devices: 

// Additional Comments:
// 기존의 fsm 을 활용하여 dectection 대신 shift 연산자를 활용하여 코딩
//////////////////////////////////////////////////////////////////////////////////


module shift_detection(
       input din,
       input clk,
       input rst_n,
       output reg dout,
		 output reg[3:0]save_data
    );
 
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n) begin 
        save_data <= 0;
        dout <= 0;
        end
        else begin
            dout <= 0;
          /*  save_data  <= save_data << 1;
            save_data[0] <= din; */
            save_data <= {save_data[2:0], !din};
            
            if(save_data == 4'b0011 && !din == 0) begin
                dout <= 1;
            end
        end
    end      
endmodule
