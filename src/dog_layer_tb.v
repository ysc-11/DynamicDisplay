`timescale 1ns / 1ps

module dog_layer_tb;
  parameter delay=10;
    //inputs
    reg clk;
	reg x_pos;
	reg y_pos;
	reg [2:0] ActionSel;
	reg DogPos_x;
	reg DogPos_y;
	//outputs
	wire RqFLag0;
	wire [7:0] r0,g0,b0;
	
	dog_layer dog_layer_u(.clk(clk), .x_pos(x_pos), .y_pos(y_pos), .DogPos_x(DogPos_x), .DogPos_y(DogPos_y), .ActionSel(ActionSel), .RqFLag0(RqFLag0), .r0(r0), .g0(g0), .b0(b0));
	
	initial begin
	clk=0;
	x_pos=0;
	y_pos=0;
	DogPos_x=0;
	DogPos_y=300;
	ActionSel=3'd0;
	repeat(10)
	begin
	#(delay) ActionSel=3'd1;DogPos_x=DogPos_x+10;
	#(delay) ActionSel=3'd2;DogPos_x=DogPos_x+10;
	#(delay) ActionSel=3'd3;DogPos_x=DogPos_x+10;
	#(delay) ActionSel=3'd4;DogPos_x=DogPos_x+10;
	end
	while(y_pos<480)
		begin
		while(x_pos<640)
		begin
		#(delay) x_pos=x_pos+1;
		end
		#(delay) y_pos=y_pos+1;
        end
        #(delay*350000) $stop;	
		end
	always 		#(delay/2) clk=~clk;
endmodule