source "helpers.tcl"
read_lef Nangate45/Nangate45_tech.lef
read_lef Nangate45/Nangate45_stdcell.lef
read_def des3_nangate45_preroute.def
read_guides des3_nangate45.route_guide
set_thread_count [expr [exec getconf _NPROCESSORS_ONLN] / 4 * 3]
detailed_route -output_drc results/des3_nangate45.output.drc.rpt \
               -output_maze results/des3_nangate45.output.maze.log \
               -verbose 1 
set def_file results/des3_nangate45.defok
write_def $def_file

exit