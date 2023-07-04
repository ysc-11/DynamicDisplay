module text_layer(x_pos, y_pos, clk, RqFLag1, r1, g1, b1);
    //input x_pos;
	//input y_pos;
	input clk;
	output reg RqFLag1;
	output reg [7:0] r1,g1,b1;
	
	input[9:0] x_pos;
	input[8:0] y_pos;
	wire[9:0] next_x_disp;
	wire[8:0] next_y_disp;
	wire[9:0] next_x_pos;
	wire[8:0] next_y_pos;
        wire[9:0] x_disp;
        wire[8:0] y_disp;
        reg [1:0] addr_h=2'b00;
        reg [6:0] addr;
        reg [2:0] sel;
	assign next_x_pos=x_pos+1;
	assign next_y_pos=y_pos;
	
	assign x_disp=x_pos-208;
	assign y_disp=y_pos-48;
	
	assign next_x_disp=x_disp+1;
	assign next_y_disp=y_disp;
	
        always @(*)
          begin if((next_y_pos>=48)&&(next_y_pos<80)&&(next_x_pos>=208)&&(next_x_pos<240)) 
                  addr_h=2'b00;
                else if((next_y_pos>=48)&&(next_y_pos<80)&&(next_x_pos>=272)&&(next_x_pos<304))
                  addr_h=2'b01;
                else if((next_y_pos>=48)&&(next_y_pos<80)&&(next_x_pos>=336)&&(next_x_pos<368))
                  addr_h=2'b10;
                else if((next_y_pos>=48)&&(next_y_pos<80)&&(next_x_pos>=400)&&(next_x_pos<432))
                  addr_h=2'b11; 
                  else  addr_h=2'b00;
          end
	
        always@(*)
        addr={addr_h,next_y_disp[4:1],next_x_disp[4]};
	
        always @(*)
        sel=next_x_disp[3:1];
	
	always @(*)
        RqFLag1=((x_pos>=208)&&(x_pos<240)&&(y_pos>=48)&&(y_pos<80))
                || ((x_pos>=272)&&(x_pos<304)&&(y_pos>=48)&&(y_pos<80))
                || ((x_pos>=336)&&(x_pos<368)&&(y_pos>=48)&&(y_pos<80))
                || ((x_pos>=400)&&(x_pos<432)&&(y_pos>=48)&&(y_pos<80));
	

        wire [7:0] dout;
	HzROM HzROM_u(.clk(clk), .addr(addr), .dout(dout));
	wire pixel;
	mux8_to_1 mux8_to_1_u(.dout(dout), .sel(sel), .pixel(pixel));
	
	always @(*)
	  begin 
	    if(RqFLag1)begin r1={8{pixel}};g1={8{pixel}};b1={8{pixel}};end
	    else  begin r1=8'b00000000;g1=8'b00000000;b1=8'b00000000; end
          end
endmodule
	
	