clear;
%close all;
save_flag = 0;
load('original_path.mat');
dir = 'TDMA FRAME';
range = 3:12;
rtt = zeros(1, length(range));
j = 0;
for period = range
    j = j+1;
    x = importdata(['x',int2str(period),'.txt']);
    y = importdata(['y',int2str(period),'.txt']);
    z = importdata(['z',int2str(period),'.txt']);
    data = importdata(['data',int2str(period),'.txt']);
    %data contains 6 values
    % data(1) = ROV throughput
    % data(2) = ROV Packet Error Rate
    % data(3) = CTR throughput
    % data(4) = CTR Packet Error Rate
    % data(5) = CTR sent packets
    % data(6) = ROV sent packets
    % data(7) = CTR received packets
    % data(8) = ROV received packets
    % data(9) = ROV period
    % data(10) = ROV packet delivery delay(pdd)
    % data(11) = standard deviation of ROV pdd
    % data(12) = ROV packet delivery delay(pdd)
    % data(13) = standard deviation of ROV pdd
    % data(14) = adaptive or constant CTR period
    % data(15) = ack immediately or piggybacking
    % data(16) = slot duration
    % data(17) = number of nodes
    % data(18) = rtt
    x = x(2:end);
    y = y(2:end);
    ROV_th = data(1);
    ROV_per = data(2);
    CTR_th = data(3);
    CTR_per = data(4);
    CTR_sent_pkts = data(5);
    ROV_sent_pkts = data(6);
    CTR_rcv_pkts = data(7);
    ROV_rcv_pkts = data(8);
    ROV_period = data(9);
    ROV_pdd = data(10);
    ROV_pdd_std = data(11);
    CTR_pdd = data(12);
    CTR_pdd_std = data(13);
    if data(14) == 0
        type = 'constant';
    else
        type = 'adaptive';
    end
    if data(15) == 0
        ack = 'ack_pgbk';
    else
        ack = 'ack_imm';
    end
    slot_duration = data(16);
    number_nodes = data(17);
    rtt(j) = data(18);
    
    mean_th = (ROV_th + CTR_th)/2;
    ROV_pdr = CTR_rcv_pkts/ROV_sent_pkts;
    CTR_pdr = ROV_rcv_pkts/CTR_sent_pkts;    

    
end

if strcmp(dir,'TDMA')
    rtt_th = (range.^2 - 2*range + 2)*slot_duration + slot_duration*range/2;
end
if strcmp(dir,'TDMA FRAME')
    rtt_th = (range*2 - 2)*slot_duration + slot_duration*(2*range-2)/2;
end
figure();
plot(range,rtt,'-*b','linewidth',1.5);
hold on;
plot(range,rtt_th,'r--','linewidth',2.5);
grid on;
title(['RTT for ',dir,' at application layer'])
legend('simulated RTT','theoretical RTT','Location','northwest');

if save_flag == 1
    savefig(['RTT/',dir,'_RTT_AppLayer.fig']);
    saveas(gcf,['RTT/',dir,'_RTT_AppLayer.png']);
    saveas(gcf,['RTT/',dir,'_RTT_AppLayer.eps']);
end

