module divider(
     pixel_clk,
     reset,
     clk_div
 );
     input pixel_clk;
     input reset;
     output clk_div;
     reg clk_div;
     
     parameter NUM_DIV = 5000000;
     reg    [21:0] cnt;
     
    always @(posedge pixel_clk or negedge reset)
     if(reset) begin
         cnt     <= 22'd0;
         clk_div    <= 1'b0;
     end
     else if(cnt < NUM_DIV / 2 - 1) begin
         cnt     <= cnt + 1'b1;
         clk_div    <= clk_div;
     end
     else begin
         cnt     <= 22'd0;
         clk_div    <= ~clk_div;
     end
endmodule