#!/bin/bash
rm *.txt
rm my_log_file.csv
echo "removing files *.txt"
rm dbs/tdma_frame_matrix/bruteForceAlg/*.txt

for i in $(seq 1 1 25200)
do
	rm my_log.txt

	ns test_uwPosBasedRt.tcl $i >> my_log.txt

	grep -i 'ROV packet delivery delay' my_log.txt | grep -io [0-9.]* >> dbs/tdma_frame_matrix/bruteForceAlg/ROV_del$i.txt
	grep -i 'CTR packet delivery delay' my_log.txt | grep -io [0-9.]* >> dbs/tdma_frame_matrix/bruteForceAlg/CTR_del$i.txt

done