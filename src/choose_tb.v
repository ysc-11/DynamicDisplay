`timescale 1ns / 1ps


module choose_tb;
  parameter delay=10;
    reg RqFLag0;
	reg RqFLag1;
	reg RqFLag2;
	reg [7:0] r0,g0,b0;
	reg [7:0] r1,g1,b1;
	reg [7:0] r2,g2,b2;
	wire [7:0] red,green,blue;
	
	choose choose_u(.RqFLag0(RqFLag0), .RqFLag1(RqFLag1), .RqFLag2(RqFLag2), .r0(r0), .g0(g0), .b0(b0), .r1(r1), .g1(g1), .b1(b1), .r2(r2), .g2(g2), .b2(b2), .red(red), .green(green), .blue(blue));
	
	initial begin
	clk=0;
	RqFLag0=0;
	RqFLag1=0;
	RqFLag2=0;
	r0=8'b00000000;g0=8'b00000000;b0=8'b00000000;
	r1=8'b00000000;g1=8'b00000000;b1=8'b00000000;
	r2=8'b00000000;g2=8'b00000000;b2=8'b00000000;
	
	#(delay) 