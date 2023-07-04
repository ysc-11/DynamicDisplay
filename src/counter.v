module counter(
        input pixel_clk,
        input reset,
        output reg [22:0] CNT
        );
   
        always @(posedge pixel_clk)
        begin
            if(reset)
            begin
                CNT<=23'd0;
            end
            else
            begin
                if(CNT==23'd4999999)
                begin
                    CNT<=23'd0;
                end
                else
                begin
                    CNT<=CNT+23'd1;
                end
            end
        end

endmodule