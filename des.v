`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2024 19:57:52
// Design Name: 
// Module Name: des
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
module des(
    input clk,
    input areset,   
    input in,
    output out); 

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin 
        case(state)
        A:begin
        if(in==0)
        next_state<=B;
        else 
        next_state<=A;
        end
        
        B:begin
        if(in==0)
        next_state<=A;
        else
        next_state<=B;
        end
        
        default:begin
        next_state<=B;
        end
        endcase
    end

    always @(posedge clk, posedge areset) begin    
        if(areset)
        state<=B;
        else
        state<=next_state;
    end

    assign out=(state==A)?0:1;

endmodule