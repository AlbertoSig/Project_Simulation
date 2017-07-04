#!/bin/bash
rm my_log.txt x.txt y.txt z.txt data.txt

ns $1 >> my_log.txt

grep -Po 'x = ([-0-9.\n]*[,]*)' $2 | grep -o '[-0-9.]*' >> x.txt
grep -Po 'y = ([-0-9.\n]*[,]*)' $2 | grep -o '[-0-9.]*' >> y.txt
grep -Po 'z = ([-0-9.\n]*[,]*)' $2 | grep -o '[-0-9.]*' >> z.txt


grep -io 'applicationROV Throughput[ ]* : [0-9.]*' my_log.txt | grep -io [0-9.]* >> data.txt
grep -io 'applicationROV PER[ ]* : [-0-9.]*' my_log.txt | grep -io [0-9.]*  >> data.txt
grep -io 'applicationCTR Throughput[ ]* : [0-9.]*' my_log.txt | grep -io [0-9.]* >> data.txt
grep -io 'applicationCTR PER[ ]* : [-0-9.]*' my_log.txt | grep -io [0-9.]*  >> data.txt
grep -io 'Sent Packets[ ]*: [0-9]*' my_log.txt | grep -io [0-9]* >> data.txt
grep -io 'Received[ ]*: [0-9]*' my_log.txt | grep -io [0-9]* >> data.txt
grep -io 'ROV period[]*: [0-9]*' my_log.txt | grep -io [0-9]* >> data.txt
grep -i 'adaptive' my_log.txt | grep -io [0-9] >> data.txt
grep -i 'constant' my_log.txt | grep -io [0-9] >> data.txt

cp ./x.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
cp ./y.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
cp ./z.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab
cp ./data.txt  /home/alberto_signori/Desktop/Project_Simulation/matlab