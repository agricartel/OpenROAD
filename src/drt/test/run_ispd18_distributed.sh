#!/bin/bash
# Bash script to run all of the ISPD '18 designs with the distributed router
# THIS SCRIPT WILL POTENTIALLY TAKE DAYS TO RUN
# USE WITH CAUTION

for j in {1..3} ; do
  # Skipping test2 because it throws an error.
  for i in 1 {3..10} ; do
      # ../../../../install/OpenROAD/bin/openroad ispd18_test${i}_distributed.tcl | tee results/ispd18_test${i}_distributed_run${j}.log
      ../../../../install/OpenROAD/bin/openroad ispd18_test${i}.tcl | tee results/ispd18_test${i}_run${j}.log
  done
done
