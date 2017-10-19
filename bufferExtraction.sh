#!/bin/bash
rm *.txt
echo "removing files *.txt"

for i in $(seq 1 1 60)
do
	echo "start of simulation with ROV period $i"
	ns $1 $i>> my_log.txt

	grep -io 'time_buffer[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> time_buffer$i.txt
	grep -io 'buffer CTR[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> CTR_buffer$i.txt
	grep -io 'buffer ROV[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> ROV_buffer$i.txt
	grep -io 'buffer Ra[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> R1_buffer$i.txt
	grep -io 'buffer Rb[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> R2_buffer$i.txt
	grep -io 'buffer Rc[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> R3_buffer$i.txt
	grep -io 'buffer Rd[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> R4_buffer$i.txt

	cp ./time_buffer$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./CTR_buffer$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./ROV_buffer$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./R1_buffer$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./R2_buffer$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./R3_buffer$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./R4_buffer$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab

	rm my_log.txt

done