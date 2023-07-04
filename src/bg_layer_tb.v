module bg_layer_tb;
  parameter delay=10;
    reg clk;
	reg x_pos;
	reg y_pos;
	wire RqFLag2;
	wire [7:0] r2,g2,b2;
	
	initial begin clk=0;   forever  #5 clk = ~clk;   end
	
	bg_layer uut(.clk(clk), .x_pos(x_pos), .y_pos(y_pos), .RqFLag2(RqFLag2), .r2(r2), .g2(g2), .b2(b2));
	
	initial
	  begin 
	    clk=0;
		x_pos=0;
		y_pos=0;
		while(y_pos<480)
		begin
		while(x_pos<640)
		begin
		#(delay) x_pos=x_pos+1;
		end
		#(delay) y_pos=y_pos+1;
        end
        #(delay*10) $stop;	
      end
	always 		#(delay/2) clk=~clk;
endmodule