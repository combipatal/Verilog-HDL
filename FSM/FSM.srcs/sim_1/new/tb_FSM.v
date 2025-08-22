`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/23 01:38:31
// Design Name: 
// Module Name: tb_FSM
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


module tb_FSM;
    
    reg b_in;
    reg clk;
    reg rst_n;
    wire b_out;
    
    FSM statemachine (.b_in(b_in), .clk(clk), .rst_n(rst_n), .b_out(b_out));   
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin 
       clk = 1;
       rst_n = 0; #15
       rst_n = 1; b_in = 0; #20
       b_in = 1; #40
       b_in = 0; #20
       b_in = 1; #20
       b_in = 0; 

    end
           
endmodule
