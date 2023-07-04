module action_new(pixel_clk, eat, reset, ActionS, DogPos_x1, DogPos_x2, DogPos_y);
    input pixel_clk;
	input eat;
	input reset;
	output reg ActionS;
	output reg [9:0] DogPos_x1, DogPos_x2;
	output wire [8:0] DogPos_y;
	
	
	assign DogPos_y=300;
	wire [22:0] CNT;
	counter counter1_u(.pixel_clk(pixel_clk), .reset(reset), .CNT(CNT));
	
	always @(posedge pixel_clk)
	  begin 
            if(reset) begin ActionS=1'd0;DogPos_x1=10'd256;DogPos_x2=10'd320;end
	    else if(!eat) ActionS=1'd0;
            else if((CNT==23'd4999999) && (ActionS<1'd1)) begin ActionS=ActionS+1'd1;end
	    else if((CNT==23'd4999999) && (ActionS==1'd1)) begin ActionS=1'd0;end
          end
endmodule