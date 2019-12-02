
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name SEC_PROJ -dir "C:/SEC/SECPROJ/SEC_PROJ/planAhead_run_1" -part xc3s100ecp132-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "C:/SEC/SECPROJ/SEC_PROJ/xilinx/14.7/picoversat/xtop.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {rtl/include/xdefs.vh}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/xregf.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/xram.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/xctrl.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/xaddr_decoder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/switch_driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/sequencer_loop_controller.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/push_button_driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/led_driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/src/xtop.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top xtop $srcset
add_files [list {C:/SEC/SECPROJ/SEC_PROJ/xilinx/14.7/picoversat/xtop.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-4
