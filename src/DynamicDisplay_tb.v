`timescale 1ns / 1ps

module DynamicDisplay_tb;
    reg clk;
	reg reset;
    reg run;
	wire [2:0] TMDSp, TMDSn;
	wire TMDSp_clk, TMDSn_clk;
	glbl glbl();
	
	
	initial
	  begin 
	    clk=0;   
	    run=1;    
	    forever  #5 clk = ~clk;   
	  end
	
	initial begin  
	    reset = 1;
		repeat(3)@(posedge clk);  reset = 0;   
		end
		
	DynamicDisplay DynamicDisplay_inst(.clk(clk), .reset(reset), .run(run), .hSync(hSync), .vSync(vSync), .DE(DE), .red(red), .green(green), .blue(blue));
	
	integer frame_num;
	integer file_rgb;
	
	initial begin    
	    frame_num = 0;
		file_rgb= $fopen("rgb.rgb24","wb");
		while(1)begin    
		    @(posedge clk);
			if(DE)
			begin 
			    WRITE_BYTE(blue,file_rgb);
			   WRITE_BYTE(green,file_rgb);
			   WRITE_BYTE(red,file_rgb);
		    end
			if(DynamicDisplay_tb.DynamicDisplay_inst.sync_inst.EndLine==1)
			begin
			    $display("Line %d",DynamicDisplay_tb.DynamicDisplay_inst.y_pos);
				if(DynamicDisplay_tb.DynamicDisplay_inst.sync_inst.EndFrame==1)
				    frame_num = frame_num + 1;
			end
			if ((frame_num == 1) && (DynamicDisplay_tb.DynamicDisplay_inst.sync_inst.EndFrame)) 
			   begin
				$fclose(file_rgb);
				$stop;
			    end
	    end
    end
	
	task WRITE_BYTE;
	    input [7:0] data;
		input integer file_ptr;
		$fwriteb(file_ptr,"%s",data);
	endtask
endmodule