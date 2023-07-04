`timescale 1ns / 1ps

module counter_tb();
    reg reset;
    reg pixel_clk;
    wire [22:0] CNT;
    counter counter_u(
    .pixel_clk(pixel_clk),
    .reset(reset),
    .CNT(CNT));
    initial
    begin
        pixel_clk=1'b0;
        reset=1'b1;
        #4 reset=1'b0;
    end
    always #20 pixel_clk<=~pixel_clk;
endmodule