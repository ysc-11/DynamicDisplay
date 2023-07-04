module action(pixel_clk, run, reset, ActionSel, DogPos_x, DogPos_y);
    input pixel_clk;
	input run;
	input reset;
	output reg [2:0] ActionSel=0;
	output reg [9:0] DogPos_x=0;
	output wire [8:0] DogPos_y;
	
	
	assign DogPos_y=300;
	wire [22:0] CNT;                     //计数器，控制ActionSel每0.2s+1
	counter counter_u(.pixel_clk(pixel_clk), .reset(reset), .CNT(CNT));
	
	always @(posedge pixel_clk)
	  begin 
            if(reset) begin ActionSel=3'd0;DogPos_x=10'd0;end   //reset初始化
	    else if(!run) ActionSel=3'd0;                         //run信号输入
            else if((CNT==23'd4999999) && (ActionSel<3'd4)) begin ActionSel=ActionSel+3'd1;DogPos_x=DogPos_x+10'd20;end   //每次前进20
	    else if((CNT==23'd4999999) && (ActionSel==3'd4)) begin ActionSel=3'd0;DogPos_x=DogPos_x+10'd20;end
		else if((CNT==23'd4999999) && (DogPos_x==640)) begin ActionSel=3'd0;DogPos_x=10'd0;end       //到最右边后清零
          end
endmodule