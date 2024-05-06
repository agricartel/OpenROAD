source "helpers.tcl"

set OR $argv0
set server1 [exec $OR server1.tcl > results/server1.log &]
set server2 [exec $OR server2.tcl > results/server2.log &]
set balancer [exec $OR balancer.tcl > results/balancer.log &]
exec sleep 3
read_lef testcase/ispd18_test7/ispd18_test7.input.lef
read_def testcase/ispd18_test7/ispd18_test7.input.def
read_guides testcase/ispd18_test7/ispd18_test7.input.guide

# set_thread_count [expr [exec getconf _NPROCESSORS_ONLN] / 4]
detailed_route -output_drc results/ispd18_test7.output.drc.rpt \
               -output_maze results/ispd18_test7.output.maze.log \
               -output_guide_coverage results/ispd18_test7.coverage.csv \
               -verbose 1 \
	             -distributed \
	             -remote_host 127.0.0.1 \
	             -remote_port 1234 \
               -cloud_size 2 \
               -shared_volume results
exec kill $server1
exec kill $server2
exec kill $balancer
set def_file [make_result_file ispd18_test7.def]
write_def $def_file

exit
