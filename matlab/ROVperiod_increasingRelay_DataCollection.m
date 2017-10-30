clear;
close all;
save_flag = 1;
load('original_path.mat');
dir = 'path';
range = 1:1:60;
for period = range
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
    slot_duration = data(14);
    number_nodes = data(15);
    CTR_rtt = data(16);
    CTR_sent_pkts_APP = data(17);
    ROV_sent_pkts_APP = data(18);
    CTR_rcv_pkts_APP = data(19);
    ROV_rcv_pkts_APP = data(20);
    
    mean_th = (ROV_th + CTR_th)/2;
    ROV_pdr = CTR_rcv_pkts/ROV_sent_pkts;
    CTR_pdr = ROV_rcv_pkts/CTR_sent_pkts;  
    
    ROV_pdr_APP = CTR_rcv_pkts_APP/ROV_sent_pkts_APP;
    CTR_pdr_APP = ROV_rcv_pkts_APP/CTR_sent_pkts_APP;

    x_e = x_original - x;
    y_e = y_original - y;
    d = sqrt(x_e.^2 + y_e.^2);
    rmse = sqrt(sum(d.^2)/length(d));
    figure()
    plot(x,y);
    hold on
    plot(x_original,y_original,'--');
    xlabel('x');
    ylabel('y');
    title(['ROV period ',int2str(ROV_period)])
    legend('rov path','original path');
    %axis([900 1100 -100 100]);
    if save_flag == 1
        savefig(['simTesi/staticRt/',dir,'/ROVperiod',int2str(ROV_period),'.fig'])
        saveas(gcf,['simTesi/staticRt/',dir,'/ROVperiod',int2str(ROV_period),'.png']);
        saveas(gcf,['simTesi/staticRt/',dir,'/ROVperiod',int2str(ROV_period),'.eps'],'epsc');
        save(['simTesi/staticRt/',dir,'/ROVperiod',int2str(ROV_period),'.mat']);
    end
    
end
% figure();
% plot(d);
% hold on;
% plot(d_original);