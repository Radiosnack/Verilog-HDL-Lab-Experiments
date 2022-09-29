`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2022 22:50:09
// Design Name: 
// Module Name: carry_skip
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
//Lab-3:Vedant A Sontake(B20EE095)
//Write a Program to Implement the following Fast Adders [32 bit]
//Carry Look Ahead Adder,Carry Skip Adder,Carry Select Adder

//code for 4-bit carry skip adder
module carry_skip(a,b,c0,s,cout);
input [3:0]a,b;
input c0;
output [3:0]s;
output cout;

wire c1,c2,c3,c4,p0,p1,p2,p3,m;
full_adder_delay FD1(a[0],b[0],c0,s[0],c1);
full_adder_delay FD2(a[1],b[1],c1,s[1],c2);
full_adder_delay FD3(a[2],b[2],c2,s[2],c3);
full_adder_delay FD4(a[3],b[3],c3,s[3],c4);
//calculating carry propogate
xor #10 (p0,a[0],b[0]);
xor #10 (p1,a[1],b[1]);
xor #10 (p2,a[2],b[2]);
xor #10 (p3,a[3],b[3]);

and #5 (m,p0,p1,p2,p3);
//applying 2x1 multiplexer
assign cout=m?c0:p3;
endmodule
