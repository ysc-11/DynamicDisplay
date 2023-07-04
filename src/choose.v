module choose(RqFLag2, RqFLag1, RqFLag0, RqFLag3, r3, g3, b3, r2, g2, b2, r1, g1, b1, r0, g0, b0, red, green, blue);
    input RqFLag0;        //输入四个输出申请信号
	input RqFLag1;
	input RqFLag2;
	input RqFLag3;
	input [7:0] r0,g0,b0; //输入三个图层以及名字的rgb信号
	input [7:0] r1,g1,b1;
	input [7:0] r2,g2,b2;
	input [7:0] r3,g3,b3;
	output reg [7:0] red,green,blue;
	always @(*)
	  case({RqFLag0,RqFLag1,RqFLag2,RqFLag3})
	    4'b0000: begin red=8'b00000000;green=8'b00000000;blue=8'b00000000;end
		4'b0001: {red,green,blue}={r3,g3,b3};            //根据输出优先级来决定输出谁
		4'b0011: {red,green,blue}={r3,g3,b3};
		4'b0101: {red,green,blue}={r3,g3,b3};
		4'b0110: {red,green,blue}={r3,g3,b3};
		4'b0111: {red,green,blue}={r3,g3,b3};
		4'b1001: {red,green,blue}={r3,g3,b3};
		4'b1011: {red,green,blue}={r3,g3,b3};
		4'b1100: {red,green,blue}={r3,g3,b3};
		4'b1101: {red,green,blue}={r3,g3,b3};
		4'b1110: {red,green,blue}={r3,g3,b3};
		4'b1111: {red,green,blue}={r3,g3,b3};
		
		4'b0010: {red,green,blue}={r2,g2,b2};
		4'b0100: {red,green,blue}={r1,g1,b1};
		4'b1000: {red,green,blue}={r0,g0,b0};
		4'b1010: {red,green,blue}={r0,g0,b0};
		default: begin red=8'b00000000;green=8'b00000000;blue=8'b00000000;end
	  endcase
endmodule
	