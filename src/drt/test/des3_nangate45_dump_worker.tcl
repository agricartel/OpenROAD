source "helpers.tcl"
read_lef Nangate45/Nangate45_tech.lef
read_lef Nangate45/Nangate45_stdcell.lef
read_def des3_nangate45_preroute.def
read_guides des3_nangate45.route_guide
set_thread_count [exec getconf _NPROCESSORS_ONLN]

detailed_route_debug -dump_dr -dump_dir results -iter 2

detailed_route -output_guide results/des3_nangate45.output.guide.mod \
               -output_drc results/des3_nangate45.output.drc.rpt \
               -output_maze results/des3_nangate45.output.maze.log \
               -verbose 1
set def_file results/des3_nangate45.defok
write_def $def_file

exit