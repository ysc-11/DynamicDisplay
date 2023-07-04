`timescale 1ns / 1ps
  

module action_tb;
  parameter delay=10;
	reg pixel_clk;
	reg run;
	reg reset;
	wire [2:0] ActionSel;
	wire [9:0] DogPos_x;
	wire [8:0] DogPos_y;
	
	initial begin pixel_clk=0; reset=1; run=0;end
	
	action action_u(.pixel_clk(pixel_clk), .run(run), .reset(reset), .ActionSel(ActionSel[2:0]), .DogPos_x(DogPos_x), .DogPos_y(DogPos_y));
	
	initial
	  begin
          #(delay) reset=0;
	  #(delay) run=1;
      #(delay*10000000) $stop;
      end
always 		#(delay/2) pixel_clk=~pixel_clk;
endmodule	  