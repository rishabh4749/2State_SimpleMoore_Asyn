`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2024 19:58:11
// Design Name: 
// Module Name: des_tb
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


module des_tb(

    );
    reg clk,areset,in;
    wire out;
    always #5 clk=~clk;
    des dut(.clk(clk),.areset(areset),.in(in),.out(out));
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%t areset=%b in=%b out=%b",$time,areset,in,out);
    clk<=0;
    areset<=0;
    in<=0;
    #4 in<=1;areset<=1;
    #10 areset<=0;
    #10 in<=0; areset<=0;
    #10 in<=1; areset<=1;
    #10 $finish;
    end
endmodule
