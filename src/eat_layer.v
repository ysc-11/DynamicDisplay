module eat_layer(ActionS, run, DogPos_x1, DogPos_x2, DogPos_y, x_pos, y_pos, pixel_clk, RqFLag4, RqFLag5, r41, g41, b41,r42,g42,b42);
    input [9:0]x_pos;
	input [8:0]y_pos;
	input pixel_clk;
	input ActionS;
	input [9:0]DogPos_x1, DogPos_x2;
	input [8:0]DogPos_y;
	input run;
	output wire RqFLag4,RqFLag5;
	output reg [7:0] r41,g41,b41,r42,g42,b42;
	
	wire[9:0] next_x_disp1,next_x_disp2;
	wire[8:0] next_y_disp1,next_y_disp2;
	wire[9:0] next_x_pos1,next_x_pos2;
	wire[8:0] next_y_pos1,next_y_pos2;
    reg[11:0] addr1;
	reg[11:0] addr2;
	
    wire [9:0]DogPos_x1,DogPos_x2;
	wire [8:0]DogPos_y;
	
	assign next_x_disp1=(x_pos+1)-DogPos_x1;
	assign next_x_disp2=(x_pos+1)-DogPos_x2;
	assign next_y_disp1=y_pos-DogPos_y;
	assign next_y_disp2=y_pos-DogPos_y;
	
    assign next_x_pos1=x_pos+1;
	assign next_x_pos2=x_pos+1;
	assign next_y_pos1=y_pos;
	assign next_y_pos2=y_pos;
	
	wire [7:0] r4_1,g4_1,b4_1,r4_2,g4_2,b4_2,r4_3,g4_3,b4_3,r4_4,g4_4,b4_4;
	
	always @(*)
	case(x_pos[9:6])
	4'b0100: addr1={next_y_disp1[5:0],next_x_disp1[5:0]};
	4'b0101: addr2={next_y_disp2[5:0],next_x_disp2[5:0]};
	endcase
	
	PictureROM7   ROMInst7 (
		.a(addr1),
		.clk(pixel_clk),
		.qspo( {r4_1,g4_1,b4_1}),
		.qspo_ce(1)   
		);
	PictureROM8   ROMInst8 (
                .a(addr2),
                .clk(pixel_clk),
                .qspo( {r4_2,g4_2,b4_2}),
                .qspo_ce(1)   
                );
    PictureROM9   ROMInst9 (
                        .a(addr1),
                        .clk(pixel_clk),
                        .qspo( {r4_3,g4_3,b4_3}),
                        .qspo_ce(1)   
                        );
     PictureROM10   ROMInst10 (
                                .a(addr2),
                                .clk(pixel_clk),
                                .qspo( {r4_4,g4_4,b4_4}),
                                .qspo_ce(1)   
                                );

        always @(*)
	case (ActionS)
	1'd0 : begin {r41,g41,b41}={r4_1,g4_1,b4_1};{r42,g42,b42}={r4_2,g4_2,b4_2};end
	1'd1 : begin {r41,g41,b41}={r4_3,g4_3,b4_3};{r42,g42,b42}={r4_4,g4_4,b4_4};end
	endcase

	assign RqFLag4=(next_x_pos1>=DogPos_x1)&&(next_x_pos1<(DogPos_x1+64))&&(next_y_pos1>=DogPos_y)&&(next_y_pos1<(DogPos_y+64)&&({r41,g41,b41}!= 24'hffffcc)&&(run==0));
	assign RqFLag5=(next_x_pos2>=DogPos_x2)&&(next_x_pos2<(DogPos_x2+64))&&(next_y_pos2>=DogPos_y)&&(next_y_pos2<(DogPos_y+64)&&({r42,g42,b42}!= 24'hffffcc)&&(run==0));
endmodule