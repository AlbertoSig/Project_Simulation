range = 1:60;
lambda = 1./range;
CTR_packets = 180;
sim_length = 40000;
prob = exp(-lambda*10);
l = 8000; %bit
c = 1500;
d_max = 3000;
r = 4800;
t_slot = d_max/c + l/r +0.3;
N_slot = 7;
t_frame = t_slot*N_slot;
N_packet = 1; %number of packets per frame
thr_ack = l*CTR_packets*prob/sim_length;
thr_frame = N_packet*l/t_frame;
thr_pp = l*lambda + thr_ack; %throughput poisson process
thr_th = min(thr_pp,thr_frame);
hold on;
plot(range,thr_th,'--b');
axis([1,60,0,350]);

%plot(range,adap_CTR_th);