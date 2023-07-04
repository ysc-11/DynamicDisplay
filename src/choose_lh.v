module choose_lh(RqFLag2, RqFLag1, RqFLag0, RqFLag3, RqFLag4, RqFLag5, r41, r42, g41, g42, b41, b42, r3, g3, b3, r2, g2, b2, r1, g1, b1, r0, g0, b0, red, green, blue);
    input RqFLag0;
	input RqFLag1;
	input RqFLag2;
	input RqFLag3;
	input RqFLag4;
	input RqFLag5;
	input [7:0] r0,g0,b0;
	input [7:0] r1,g1,b1;
	input [7:0] r2,g2,b2;
	input [7:0] r3,g3,b3;
	input [7:0] r41,g41,b41;
	input [7:0] r42,g42,b42;
	output reg [7:0] red,green,blue;
	always @(*)
	  case({RqFLag0,RqFLag1,RqFLag2,RqFLag3,RqFLag4,RqFLag5})
	    6'b000000: begin red=8'b00000000;green=8'b00000000;blue=8'b00000000;end
		6'b000001: {red,green,blue}={r42,g42,b42};
		6'b000010: {red,green,blue}={r41,g41,b41};
		6'b001001: {red,green,blue}={r42,g42,b42};
		6'b001010: {red,green,blue}={r41,g41,b41};
		6'b000100: {red,green,blue}={r3,g3,b3};
		6'b001000: {red,green,blue}={r2,g2,b2};
		6'b010000: {red,green,blue}={r1,g1,b1};
		6'b100000: {red,green,blue}={r0,g0,b0};
		6'b101000: {red,green,blue}={r0,g0,b0};
	  endcase
endmodule
	