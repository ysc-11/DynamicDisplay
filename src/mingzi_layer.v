module mingzi_layer(x_pos, y_pos, clk, RqFLag3, r3, g3, b3);
    //input x_pos;
	//input y_pos;
	input clk;
	output reg RqFLag3;
	output reg [7:0] r3,g3,b3;
	
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
	
	assign x_disp=x_pos-512;
	assign y_disp=y_pos-96;
	
	assign next_x_disp=x_disp+1;
	assign next_y_disp=y_disp;
	
        always @(*)
          begin if((next_y_pos>=96)&&(next_y_pos<112)&&(next_x_pos>=512)&&(next_x_pos<528)) 
                  addr_h=2'b00;
                else if((next_y_pos>=96)&&(next_y_pos<112)&&(next_x_pos>=544)&&(next_x_pos<560))
                  addr_h=2'b01;
                else if((next_y_pos>=96)&&(next_y_pos<112)&&(next_x_pos>=576)&&(next_x_pos<592))
                  addr_h=2'b10;
          end
	
        always@(*)
        addr={addr_h,next_y_disp[3:0],next_x_disp[3]};
	
        always @(*)
        sel=next_x_disp[2:0];
	
	always @(*)
        RqFLag3=((x_pos>=512)&&(x_pos<528)&&(y_pos>=96)&&(y_pos<112))
                || ((x_pos>=544)&&(x_pos<560)&&(y_pos>=96)&&(y_pos<112))
                || ((x_pos>=576)&&(x_pos<592)&&(y_pos>=96)&&(y_pos<112));
                
        wire [7:0] dout;
	//HzROM1 HzROM1_u(.clk(clk), .addr(addr), .dout(dout));
	HzROM_new HzROM_new_u(.clk(clk),.addr(addr), .dout(dout));
	
	wire pixel;
	mux8_to_1 mux8_to_1_u(.dout(dout), .sel(sel), .pixel(pixel));
	
	always @(*)
	  begin 
	    if(RqFLag3)begin r3={8{pixel}};g3={8{pixel}};b3={8{pixel}};end
	    else  begin r3=8'b00000000;g3=8'b00000000;b3=8'b00000000; end
          end
endmodule
	