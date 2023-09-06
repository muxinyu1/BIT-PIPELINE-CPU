# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.cache/wt [current_project]
set_property parent.project_path C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/ZZZ/lab3/single_cycle/single_cycle.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/cpu_test.hex.coe
add_files C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/led_test.hex.coe
add_files C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/test1.hex.coe
read_verilog C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/myCPU/macro.vh
read_verilog -library xil_defaultlib {
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/myCPU/alu.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/confreg/confreg.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/myCPU/control.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/flag_gen.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/myCPU/pc.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/pipeline_reg_D.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/pipeline_reg_E.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/pipeline_reg_M.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/pipeline_reg_W.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/player.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/pred_pc.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/myCPU/regfile.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/myCPU/riscv_top.v
  C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/single_cycle.v
}
read_ip -quiet C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/ip/inst_rom/inst_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/ip/inst_rom/inst_rom_ooc.xdc]

read_ip -quiet C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/ip/data_ram/data_ram.xci
set_property used_in_implementation false [get_files -all c:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/sources_1/new/ip/data_ram/data_ram_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/constrs_1/new/single_cycle.xdc
set_property used_in_implementation false [get_files C:/Users/13614/Desktop/vivado_projects/BIT-PIPELINE-CPU/single_cycle/single_cycle.srcs/constrs_1/new/single_cycle.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top single_cycle -part xc7a35tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef single_cycle.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file single_cycle_utilization_synth.rpt -pb single_cycle_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
