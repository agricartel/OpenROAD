source "helpers.tcl"

read_lef testcase/ispd18_test1/ispd18_test1.input.lef
read_def testcase/ispd18_test1/ispd18_test1.input.def
read_guides testcase/ispd18_test1/ispd18_test1.input.guide
detailed_route -output_drc results/ispd18_test1.output.drc.rpt \
               -output_maze results/ispd18_test1.output.maze.log \
               -output_guide_coverage results/ispd18_test1.coverage.csv \
               -verbose 1

set def_file [make_result_file ispd18_test1.def]
write_def $def_file
exit
