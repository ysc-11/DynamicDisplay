module dog_layer_lh(k, lh, eat, ActionSel, DogPos_x, DogPos_y, x_pos, y_pos, pixel_clk, RqFLag0, r0, g0, b0);
    input [9:0]x_pos;
	input [8:0]y_pos;
	input pixel_clk;
	input [2:0] ActionSel;
	input [9:0]DogPos_x;
	input [8:0]DogPos_y;
	input k,lh,eat;
	output wire RqFLag0;
	output reg [7:0] r0,g0,b0;
	
	wire[9:0] next_x_disp;
	wire[8:0] next_y_disp;
	wire[9:0] next_x_pos;
	wire[8:0] next_y_pos;
    reg [11:0] addr;
	
	assign next_x_disp=(x_pos+1)-DogPos_x;
	assign next_y_disp=y_pos-DogPos_y;
	
	always @(*)
    case ({lh,k})
	2'b00: addr={next_y_disp[5:0],next_x_disp[5:0]};
	2'b10: addr={next_y_disp[5:0],next_x_disp[5:0]};
	2'b11: addr={next_y_disp[5:0],~next_x_disp[5:0]};
	endcase
	
	
        assign next_x_pos=x_pos+1;
	assign next_y_pos=y_pos;
	
	wire [7:0] r0_1,g0_1,b0_1,r0_2,g0_2,b0_2,r0_3,g0_3,b0_3,r0_4,g0_4,b0_4,r0_5,g0_5,b0_5;
	
	
	PictureROM2   ROMInst2 (
		.a(addr),
		.clk(pixel_clk),
		.qspo( {r0_1,g0_1,b0_1}),
		.qspo_ce(1)   
		);
	PictureROM3   ROMInst3 (
                .a(addr),
                .clk(pixel_clk),
                .qspo( {r0_2,g0_2,b0_2}),
                .qspo_ce(1)   
                );
    PictureROM4   ROMInst4 (
                        .a(addr),
                        .clk(pixel_clk),
                        .qspo( {r0_3,g0_3,b0_3}),
                        .qspo_ce(1)   
                        );
     PictureROM5   ROMInst5 (
                                .a(addr),
                                .clk(pixel_clk),
                                .qspo( {r0_4,g0_4,b0_4}),
                                .qspo_ce(1)   
                                );
	PictureROM6   ROMInst6 (
                                        .a(addr),
                                        .clk(pixel_clk),
                                        .qspo( {r0_5,g0_5,b0_5}),
                                        .qspo_ce(1)   
                                        );
        always @(*)
	case (ActionSel[2:0])
	3'd0 : {r0,g0,b0}={r0_1,g0_1,b0_1};
	3'd1 : {r0,g0,b0}={r0_2,g0_2,b0_2};
	3'd2 : {r0,g0,b0}={r0_3,g0_3,b0_3};
	3'd3 : {r0,g0,b0}={r0_4,g0_4,b0_4};
	3'd4 : {r0,g0,b0}={r0_5,g0_5,b0_5};
	endcase

	assign RqFLag0=(next_x_pos>=DogPos_x)&&(next_x_pos<(DogPos_x+64))&&(next_y_pos>=DogPos_y)&&(next_y_pos<(DogPos_y+64)&&({r0,g0,b0}!= 24'hffffcc)&&(eat==0));
endmodule