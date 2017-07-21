#!/bin/bash
rm *.txt

echo "removing files *.txt"

for i in $(seq 3 1 12)
do
	echo "start of simulation with ROV period $i"
	ns $1 $i>> my_log.txt

	grep -Po 'x = ([-0-9.\n]*[,]*)' $2 | grep -o '[-0-9.]*' >> x$i.txt
	grep -Po 'y = ([-0-9.\n]*[,]*)' $2 | grep -o '[-0-9.]*' >> y$i.txt
	grep -Po 'z = ([-0-9.\n]*[,]*)' $2 | grep -o '[-0-9.]*' >> z$i.txt


	grep -io 'applicationROV Throughput[ ]* : [0-9.]*' my_log.txt | grep -io [0-9.]* >> data$i.txt
	grep -io 'applicationROV PER[ ]* : [-0-9.]*' my_log.txt | grep -io [0-9.]*  >> data$i.txt
	grep -io 'applicationCTR Throughput[ ]* : [0-9.]*' my_log.txt | grep -io [0-9.]* >> data$i.txt
	grep -io 'applicationCTR PER[ ]* : [-0-9.]*' my_log.txt | grep -io [0-9.]*  >> data$i.txt
	grep -io 'Sent Packets CTR --> ROV[ ]*: [0-9]*' my_log.txt | grep -io [0-9]* >> data$i.txt
	grep -io 'Sent Packets ROV --> CTR[ ]*: [0-9]*' my_log.txt | grep -io [0-9]* >> data$i.txt
	grep -io 'Received Packets ROV --> CTR[ ]*: [0-9]*' my_log.txt | grep -io [0-9]* >> data$i.txt
	grep -io 'Received Packets CTR --> ROV[ ]*: [0-9]*' my_log.txt | grep -io [0-9]* >> data$i.txt
	grep -io 'ROV period[]*: [0-9]*' my_log.txt | grep -io [0-9]* >> data$i.txt
	grep -i 'ROV packet delivery delay' my_log.txt | grep -io [0-9.]* >> data$i.txt
	grep -i 'ROV std packet delivery delay' my_log.txt | grep -io [0-9.]* >> data$i.txt
	grep -i 'CTR packet delivery delay' my_log.txt | grep -io [0-9.]* >> data$i.txt
	grep -i 'CTR std packet delivery delay' my_log.txt | grep -io [0-9.]* >> data$i.txt
	grep -i 'adaptive' my_log.txt | grep -io [0-9] >> data$i.txt
	grep -i 'constant' my_log.txt | grep -io [0-9] >> data$i.txt
	grep -i 'opt(send_ack_immediately)' my_log.txt | grep -io [0-9] >> data$i.txt
	grep -i 'slot duration[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> data$i.txt
	grep -i 'number of nodes[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> data$i.txt
	grep -i 'CTR round trip time[ ]*: [0-9.]*' my_log.txt | grep -io [0-9.]* >> data$i.txt

	cp ./x$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./y$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./z$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
	cp ./data$i.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab

	rm my_log.txt
	echo "end of simulation with ROV period $i"
done