set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN R4 [get_ports clk]
set_property PACKAGE_PIN B22 [get_ports reset]

set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN E22 [get_ports run]
set_property IOSTANDARD LVCMOS33 [get_ports run]
set_property PACKAGE_PIN F21 [get_ports eat]
set_property IOSTANDARD LVCMOS33 [get_ports eat]
set_property PACKAGE_PIN G21 [get_ports lh]
set_property IOSTANDARD LVCMOS33 [get_ports lh]
set_property PACKAGE_PIN T1 [get_ports TMDSp_clk]
set_property IOSTANDARD TMDS_33 [get_ports TMDSn_clk]
set_property IOSTANDARD TMDS_33 [get_ports TMDSp_clk]
set_property PACKAGE_PIN W1 [get_ports {TMDSp[0]}]
set_property PACKAGE_PIN AA1 [get_ports {TMDSp[1]}]
set_property PACKAGE_PIN AB3 [get_ports {TMDSp[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDSn[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDSp[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDSn[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDSp[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDSn[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDSp[2]}]
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]







