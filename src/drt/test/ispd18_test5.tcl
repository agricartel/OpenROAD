source "helpers.tcl"

set_thread_count [expr [exec getconf _NPROCESSORS_ONLN] / 4 * 3]
read_lef testcase/ispd18_test5/ispd18_test5.input.lef
read_def testcase/ispd18_test5/ispd18_test5.input.def
read_guides testcase/ispd18_test5/ispd18_test5.input.guide
detailed_route -output_drc results/ispd18_test5.output.drc.rpt \
               -output_maze results/ispd18_test5.output.maze.log \
               -output_guide_coverage results/ispd18_test5.coverage.csv \
               -verbose 1

set def_file [make_result_file ispd18_test5.def]
write_def $def_file
exit
