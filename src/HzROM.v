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
module HzROM(clk,addr, dout);
    input clk;
    input [6:0] addr;
    output [7:0] dout;
     
  //
    reg[7:0] dout;
	 always @(posedge clk)
        case (addr)
		//∂Ø
		0:dout=8'h00;
		1:dout=8'h20;
		2:dout=8'h00;
		3:dout=8'h20;
		4:dout=8'h7E;
		5:dout=8'h20;
		6:dout=8'h00;
		7:dout=8'h20;
		8:dout=8'h00;
		9:dout=8'hFC;
		10:dout=8'hFF;
		11:dout=8'h24;
		12:dout=8'h10;
		13:dout=8'h24;
		14:dout=8'h10;
		15:dout=8'h24;
		16: dout=8'h24;
		17:dout=8'h24;
		18:dout=8'h22;
		19:dout=8'h24;
		20:dout=8'h4F;
		21:dout=8'h44;
		22:dout=8'hFA;
		23:dout=8'h44;
		24:dout=8'h40;
		25:dout=8'h84;
		26:dout=8'h01;
		27:dout=8'h14;
		28:dout=8'h02;
		29:dout=8'h08;
		30:dout=8'h00;
		31:dout=8'h00;
		//Ã¨
		32:dout=8'h01;
		33:dout=8'h00;
		34:dout=8'h01;
		35:dout=8'h00;
		36:dout=8'h7F;
		37:dout=8'hFC;
		38:dout=8'h01;
		39:dout=8'h00;
		40:dout=8'h02;
		41:dout=8'h80;
		42:dout=8'h02;
		43:dout=8'h40;
		44:dout=8'h05;
		45:dout=8'h20;
		46:dout=8'h08;
		47:dout=8'h98;
		48:dout=8'h30;
		49:dout=8'h06;
		50:dout=8'h01;
		51:dout=8'h00;
		52:dout=8'h04;
		53:dout=8'h88;
		54:dout=8'h24;
		55:dout=8'h84;
		56:dout=8'h24;
		57:dout=8'h12;
		58:dout=8'h64;
		59:dout=8'h12;
		60:dout=8'h43;
		61:dout=8'hF0;
		62:dout=8'h00;
		63:dout=8'h00;
		// œ‘ 
		64:dout=8'h00;
		65:dout=8'h00;
		66:dout=8'h1F;
		67:dout=8'hF0;
		68:dout=8'h10;
		69:dout=8'h10;
		70:dout=8'h1F;
		71:dout=8'hF0;
		72:dout=8'h10;
		73:dout=8'h10;
		74:dout=8'h1F;
		75:dout=8'hF0;
		76:dout=8'h04;
		77:dout=8'h40;
		78:dout=8'h04;
		79:dout=8'h40;
		80:dout=8'h44;
		81:dout=8'h48;
		82:dout=8'h24;
		83:dout=8'h48;
		84:dout=8'h14;
		85:dout=8'h50;
		86:dout=8'h14;
		87:dout=8'h60;
		88:dout=8'h04;
		89:dout=8'h40;
		90:dout=8'hFF;
		91:dout=8'hFE;
		92:dout=8'h00;
		93:dout=8'h00;
		94:dout=8'h00;
		95:dout=8'h00;
		//  æ  
		96:dout=8'h00;
		97:dout=8'h00;
		98:dout=8'h1F;
		99:dout=8'hF8;
		100:dout=8'h00;
		101:dout=8'h00;
		102:dout=8'h00;
		103:dout=8'h00;
		104:dout=8'h00;
		105:dout=8'h00;
		106:dout=8'h7F;
		107:dout=8'hFE;
		108:dout=8'h01;
		109:dout=8'h00;
		110:dout=8'h01;
		111:dout=8'h00;
		112:dout=8'H11;
		113:dout=8'h20;
		114:dout=8'h11;
		115:dout=8'h10;
		116:dout=8'h21;
		117:dout=8'h08;
		118:dout=8'h41;
		119:dout=8'h0C;
		120:dout=8'h81;
		121:dout=8'h04;
		122:dout=8'h01;
		123:dout=8'h00;
		124:dout=8'h05;
		125:dout=8'h00;
		126:dout=8'h02;
		default:dout=8'h00;
	endcase
endmodule
