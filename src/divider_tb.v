`timescale 1ns / 1ps

module divider_tb;
  parameter delay=10;
    reg pixel_clk;
	reg reset;
	
	wire clk_div;
	
	
	divider divider_u(.pixel_clk(pixel_clk), .reset(reset), .clk_div(clk_div));
	
	initial begin
	pixel_clk=0;
	reset=1;
	
	#(delay+1) reset=0;
    #(delay*30000000) $stop;
    end
always 		#(delay*2) pixel_clk=~pixel_clk;	
endmodule