module action_lh(pixel_clk, run, lh, reset, ActionSel, DogPos_x, DogPos_y);
    input pixel_clk;
	input run,lh;
	input reset;
	output reg [2:0] ActionSel;
	output reg [9:0] DogPos_x;
	output wire [8:0] DogPos_y;
	reg k;
	
	assign DogPos_y=300;
	wire [22:0] CNT;
	counter counter_u(.pixel_clk(pixel_clk), .reset(reset), .CNT(CNT));
	
	always @(posedge pixel_clk)
	  begin 
            if(reset) begin ActionSel=3'd0;DogPos_x=10'd0;k=0;end
	    else if(!run) ActionSel=3'd0;
            else if((CNT==23'd4999999) && (ActionSel<3'd4) && (k==0)) begin ActionSel=ActionSel+3'd1;DogPos_x=DogPos_x+10'd20;end
	    else if((CNT==23'd4999999) && (ActionSel==3'd4) && (k==0)) begin ActionSel=3'd0;DogPos_x=DogPos_x+10'd20;end
		else if((DogPos_x==640) && !lh) begin ActionSel=3'd0;DogPos_x=10'd0;end
		else if((DogPos_x==640) && lh) begin ActionSel=3'd0;DogPos_x=DogPos_x-10'd20;k=1;end
		else if((CNT==23'd4999999) && (DogPos_x>0) && lh && (k==1)) begin ActionSel=ActionSel+3'd1;DogPos_x=DogPos_x-10'd20;end
		else if((CNT==23'd4999999) && (DogPos_x==0)) begin ActionSel=3'd0;k=0;end
          end
endmodule