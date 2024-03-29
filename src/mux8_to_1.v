module mux8_to_1(dout, sel, pixel);
    input [2:0] sel;
	input [7:0] dout;
	output reg pixel;
	always@(*)
	 case(sel)
	  3'b000: pixel=dout[7];
	  3'b001: pixel=dout[6];
	  3'b010: pixel=dout[5];
	  3'b011: pixel=dout[4];
	  3'b100: pixel=dout[3];
	  3'b101: pixel=dout[2];
	  3'b110: pixel=dout[1];
	  3'b111: pixel=dout[0];
	  endcase
endmodule