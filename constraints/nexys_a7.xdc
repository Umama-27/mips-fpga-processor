## -------------------------------------------------------
## Clock (100 MHz on-board oscillator)
## -------------------------------------------------------
set_property PACKAGE_PIN E3      [get_ports CLK100MHZ]
set_property IOSTANDARD  LVCMOS33 [get_ports CLK100MHZ]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK100MHZ]

## -------------------------------------------------------
## Reset - BTNC (Center Button mapped as Hardware Reset)
## -------------------------------------------------------
set_property PACKAGE_PIN E16     [get_ports reset]
set_property IOSTANDARD  LVCMOS33 [get_ports reset]

## -------------------------------------------------------
## Manual Execution Clock - BTND (Down Button for stepping instruction)
## -------------------------------------------------------
set_property PACKAGE_PIN V10     [get_ports clk]
set_property IOSTANDARD  LVCMOS33 [get_ports clk]

## -------------------------------------------------------
## Slide Switches SW[4:0] - Select register to display
## -------------------------------------------------------
set_property PACKAGE_PIN U9      [get_ports {sw[0]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {sw[0]}]

set_property PACKAGE_PIN U8      [get_ports {sw[1]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {sw[1]}]

set_property PACKAGE_PIN R7      [get_ports {sw[2]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {sw[2]}]

set_property PACKAGE_PIN R6      [get_ports {sw[3]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {sw[3]}]

set_property PACKAGE_PIN R5      [get_ports {sw[4]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {sw[4]}]

## -------------------------------------------------------
## 7-Segment Display - Anodes an[7:0] (Active LOW)
## -------------------------------------------------------
set_property PACKAGE_PIN N6      [get_ports {an[0]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN M6      [get_ports {an[1]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN M3      [get_ports {an[2]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN N5      [get_ports {an[3]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {an[3]}]

set_property PACKAGE_PIN N2      [get_ports {an[4]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {an[4]}]

set_property PACKAGE_PIN N4      [get_ports {an[5]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {an[5]}]

set_property PACKAGE_PIN L1      [get_ports {an[6]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {an[6]}]

set_property PACKAGE_PIN M1      [get_ports {an[7]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {an[7]}]

## -------------------------------------------------------
## 7-Segment Display - Cathodes seg[6:0] (Active LOW)
## -------------------------------------------------------
set_property PACKAGE_PIN L3      [get_ports {seg[0]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN N1      [get_ports {seg[1]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN L5      [get_ports {seg[2]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN L4      [get_ports {seg[3]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN K3      [get_ports {seg[4]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN M2      [get_ports {seg[5]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN L6      [get_ports {seg[6]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {seg[6]}]

## Decimal Point (Optional)
set_property PACKAGE_PIN M4      [get_ports dp]
set_property IOSTANDARD  LVCMOS33 [get_ports dp]


set_property PACKAGE_PIN U4     [get_ports sw5]
set_property IOSTANDARD  LVCMOS33 [get_ports sw5]