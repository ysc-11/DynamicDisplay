//背景层
module bg_layer(pixel_clk, x_pos, y_pos, RqFLag2, r2, g2, b2);
    input pixel_clk;
	input [9:0]x_pos;
	input [8:0]y_pos;
	output wire RqFLag2;
	output [7:0] r2,g2,b2;
	
	wire[9:0] dis_x_pos;
	wire[9:0] dis_y_pos;
	assign dis_x_pos=x_pos;
	assign dis_y_pos=y_pos-128;
	reg [13:0] addr;
        
    assign RqFLag2=(y_pos>=128)&&(y_pos<384); //输出申请RqFLag2的判断
	always@(*)
	case(dis_x_pos[9:6])                      //利用x显示坐标的高四位来划分背景图的显示位置
	   4'b0000: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b0001: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b0010: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b0011: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b0100: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b0101: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b0110: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b0111: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b1000: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   4'b1001: addr={dis_y_pos[7:0],dis_x_pos[5:0]};
	   endcase
	   
	
	
	wire[7:0] r2,g2,b2;                    //ROM输出rgb信号
	PictureROM1   ROMInst1 (
		.a(addr),
		.clk(pixel_clk),
		.qspo( {r2,g2,b2}),
		.qspo_ce(1)   
		);
endmodule