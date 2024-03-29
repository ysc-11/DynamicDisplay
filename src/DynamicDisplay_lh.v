module DynamicDisplay_lh(clk, ,lh, eat, reset, run, TMDSp, TMDSn, TMDSp_clk, TMDSn_clk);
    input clk;
	input reset;
	input run;
	input eat, lh;
	output [2:0]TMDSn;
	output [2:0]TMDSp;
	output TMDSn_clk;
	output TMDSp_clk;
	
	//DCM实例
    wire   pixel_clk,tmds_clk;   
    DCM_PLL DCM_INST(  
      .clk_in1(clk), //CLK100M IN   
      .clk_out1(pixel_clk),//CLK25M_OUT   
      .clk_out2(tmds_clk),//CLK250M_OUT   
      .locked(),  
      .reset(1'b0));  
	
	//计数噿
	
	//弿关电跿
	//wire ButtonOut;
	//button_process_unit button_process_unit_u(.clk(clk), .reset(reset), .ButtonIn(ButtonIn), .ButtonOut(ButtonOut));
	
	//行帧同步产生电路
	wire[9:0] x_pos;
    wire[8:0] y_pos;
    wire hSync,vSync,DE;
    syncGenarator sync_inst(  
      .pixel_clk(pixel_clk), // 
      .reset(0), 
      .x_pos(x_pos) , 
      .y_pos(y_pos) , 
      .hSync(hSync) ,
      .vSync(vSync) , 
      .ActiveArea(DE)); 
	     
       
	//动画控制
	wire [2:0] ActionSel;
	wire [9:0] DogPos_x;
	wire [8:0] DogPos_y;
	action_lh action_lh_u(.pixel_clk(pixel_clk), .run(run), .lh(lh), .reset(reset), .ActionSel(ActionSel), .DogPos_x(DogPos_x), .DogPos_y(DogPos_y));
	
	//动画控制new
	wire ActionS;
	action_new action_new_u(.pixel_clk(pixel_clk), .eat(eat), .reset(reset), .ActionS(ActionS), .DogPos_x1(DogPos_x1), .DogPos_x2(DogPos_x2), .DogPos_y(DogPos_y));
	
	//背景屿
	wire RqFLag2;
	wire [7:0] r2,g2,b2;
	bg_layer bg_layer_u(.x_pos(x_pos), .y_pos(y_pos), .pixel_clk(pixel_clk), .RqFLag2(RqFLag2), .r2(r2), .g2(g2), .b2(b2));
	
	//字符显示屿
	wire RqFLag1;
	wire [7:0] r1,g1,b1;
	text_layer text_layer_u(.clk(clk), .x_pos(x_pos), .y_pos(y_pos), .RqFLag1(RqFLag1), .r1(r1), .g1(g1), .b1(b1));
	
	//名字
	wire RqFLag3;
	wire [7:0] r3,g3,b3;
	mingzi_layer mingzi_layer_u(.clk(clk), .x_pos(x_pos), .y_pos(y_pos), .RqFLag3(RqFLag3), .r3(r3), .g3(g3), .b3(b3));
	
	//小狗奔跑的动画层
	wire RqFLag0;
	wire [7:0] r0,g0,b0;
	dog_layer_lh dog_layer_lh_u(.k(k), .lh(lh), .eat(eat), .pixel_clk(pixel_clk), .x_pos(x_pos), .y_pos(y_pos), .DogPos_x(DogPos_x), .DogPos_y(DogPos_y), .ActionSel(ActionSel), .RqFLag0(RqFLag0), .r0(r0), .g0(g0), .b0(b0));
	
	//小狗吃饭的动画层
	wire RqFLag4;
	wire RqFLag5;
	wire [7:0] r41,g41,b41,r42,g42,b42;
	eat_layer eat_layer_u(.ActionS(ActionS), .run(run), .DogPos_x1(DogPos_x1), .DogPos_x2(DogPos_x2), .DogPos_y(DogPos_y), .x_pos(x_pos), .y_pos(y_pos), .pixel_clk(pixel_clk), .RqFLag4(RqFLag4), .RqFLag5(RqFLag5), .r41(r41), .g41(g41), .b41(b41), .r42(r42), .g42(g42), .b42(b42));
	
	//图层选择
	wire [7:0] red,green,blue;
	choose_lh choose_lh_u(.RqFLag0(RqFLag0), .RqFLag1(RqFLag1), .RqFLag2(RqFLag2), .RqFLag3(RqFLag3), .RqFLag4(RqFLag4), .RqFLag5(RqFLag5), .r0(r0), .g0(g0), .b0(b0), .r1(r1), .g1(g1), .b1(b1), .r2(r2), .g2(g2), .b2(b2), .r3(r3), .g3(g3), .b3(b3), .r41(r41), .g41(g41), .b41(b41), .r42(r42), .g42(g42), .b42(b42), .red(red), .green(green), .blue(blue));
	
	TMDSencode  TMDS_inst(  
    //时钟
	  .tmds_clk(tmds_clk),  //  
      .pixel_clk(pixel_clk), 
	//复位信号，高电平有效
	  .reset(reset),
    //视频信号
      .red(red),
	  .green(green),
	  .blue(blue),
	  .hSync(hSync),
	  .vSync(vSync),
	  .ActiveArea(DE),
	//TMDS通道输出数据
      .TMDSch0(TMDSch0),
	  .TMDSch1(TMDSch1),
	  .TMDSch2(TMDSch2)
    ); 
    //HDMI 差分输出
    OBUFDS OBUFDS_red  (.I(TMDSch2), .O(TMDSp[2]), .OB(TMDSn[2]));  
    OBUFDS OBUFDS_green(.I(TMDSch1), .O(TMDSp[1]), .OB(TMDSn[1]));  
    OBUFDS OBUFDS_blue (.I(TMDSch0), .O(TMDSp[0]), .OB(TMDSn[0]));  
    OBUFDS OBUFDS_clk(.I(pixel_clk), .O(TMDSp_clk), .OB(TMDSn_clk));    
   
endmodule   

	