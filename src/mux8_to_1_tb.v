`timescale 1ns / 1ps

module mux8_to_1_tb_v;
parameter dely=100;

reg [2:0] sel;
reg [7:0] dout;
wire pixel;
mux8_to_1 dut(.clk(clk), .sel(sel), .dout(dout), .pixel(pixel));

initial 
  begin
  clk=0;  
  end

initial begin
sel=3'b000;
#(dely*2) sel=3'b001;
#(dely*2) sel=3'b100;
#(dely*2) sel=3'b000;
#(dely*2) sel=3'b111;
#(dely*2) sel=3'b010;
#(dely*2) sel=3'b010;
#(dely*2) sel=3'b101;
#(dely*2) sel=3'b000;
#(dely*2) sel=3'b011;
#(dely*2) sel=3'b110;
#(dely*2) sel=3'b101;
#(dely*2) $stop;
end
always #(dely/2)clk=~clk;
endmodule
