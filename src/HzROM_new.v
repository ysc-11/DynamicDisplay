`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:19 11/19/2009 
// Design Name:    QMJ 
// Module Name:    BottomLayer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module HzROM_new(clk,addr, dout);
    input clk;
    input [6:0] addr;
    output [7:0] dout;
     
  
    reg[7:0] dout;
	 always @(posedge clk)
        case (addr)
        /*---×ª»»×Ö·û Ñî ---*/
        0: dout=8'h10;
		1: dout=8'h00;
		2: dout=8'h11;
		3: dout=8'hF8;
		4: dout=8'h10;
		5: dout=8'h10;
		6: dout=8'h10;
		7: dout=8'h20;
		8: dout=8'hFC;
		9: dout=8'h40;
		10: dout=8'h10;
		11: dout=8'h80;
		12: dout=8'h31;
		13: dout=8'hFE;
		14: dout=8'h38;
		15: dout=8'h92;
        16: dout=8'h54;
		17: dout=8'h92;
		18: dout=8'h54;
		19: dout=8'h92;
		20: dout=8'h91;
		21: dout=8'h12;
		22: dout=8'h11;
		23: dout=8'h22;
		24: dout=8'h12;
		25: dout=8'h22;
		26: dout=8'h14;
		27: dout=8'h42;
		28: dout=8'h10;
		29: dout=8'h94;
		30: dout=8'h11;
		31: dout=8'h08;
        /*---×ª»»×Ö·û Ê« ---*/
        32: dout=8'h00;
		33: dout=8'h40;
		34: dout=8'h20;
		35: dout=8'h40;
		36: dout=8'h10;
		37: dout=8'h40;
		38: dout=8'h13;
		39: dout=8'hFC;
		40: dout=8'h00;
		41: dout=8'h40;
		42: dout=8'h00;
		43: dout=8'h40;
		44: dout=8'hF7;
		45: dout=8'hFE;
		46: dout=8'h10;
		47: dout=8'h10;
	    48: dout=8'h10;
		49: dout=8'h10;
		50: dout=8'h17;
		51: dout=8'hFE;
		52: dout=8'h10;
		53: dout=8'h10;
		54: dout=8'h12;
		55: dout=8'h10;
		56: dout=8'h15;
		57: dout=8'h10;
		58: dout=8'h19;
		59: dout=8'h10;
		60: dout=8'h10;
		61: dout=8'h50;
		62: dout=8'h00;
		63: dout=8'h20;
        /*---×ª»»×Ö·û ³Ð ---*/
        64: dout=8'h1F;
		65: dout=8'hE0;
		66: dout=8'h00;
		67: dout=8'h40;
		68: dout=8'h00;
		69: dout=8'h80;
		70: dout=8'h01;
		71: dout=8'h04;
		72: dout=8'h79;
		73: dout=8'h28;
		74: dout=8'h0F;
		75: dout=8'hF0;
		76: dout=8'h09;
		77: dout=8'h20;
		78: dout=8'h11;
		79: dout=8'h10;
        80: dout=8'h17;
		81: dout=8'hD0;
		82: dout=8'h21;
		83: dout=8'h08;
		84: dout=8'h21;
		85: dout=8'h08;
		86: dout=8'h4F;
		87: dout=8'hE4;
		88: dout=8'h81;
		89: dout=8'h02;
		90: dout=8'h01;
		91: dout=8'h00;
		92: dout=8'h05;
		93: dout=8'h00;
		94: dout=8'h02;
		95: dout=8'h00;
        default:dout=8'h00;
	endcase
endmodule