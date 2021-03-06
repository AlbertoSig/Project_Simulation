clear;
close all;
save_flag = 1;
load('original_path.mat');
dir = 'simProva';
range = 20:5:80;
for time = range
    x = importdata(['x',int2str(time),'.txt']);
    y = importdata(['y',int2str(time),'.txt']);
    z = importdata(['z',int2str(time),'.txt']);
    data = importdata(['data',int2str(time),'.txt']);
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
    guard_time = data(9);
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
    mean_th = (ROV_th + CTR_th)/2;
    ROV_pdr = CTR_rcv_pkts/ROV_sent_pkts;
    CTR_pdr = ROV_rcv_pkts/CTR_sent_pkts;
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
    title(['Guard time ',int2str(guard_time)])
    legend('rov path','original path');
    %axis([900 1100 -100 100]);
    if save_flag == 1
        savefig(['guard_time_increasingRelay/',dir,'/',type,'ROVpath_Guard_time',int2str(guard_time),ack,'.fig'])
        saveas(gcf,['guard_time_increasingRelay/',dir,'/',type,'ROVpath_Guard_time',int2str(guard_time),ack,'.png']);
        save(['guard_time_increasingRelay/',dir,'/',type,'ROVpath_Guard_time',int2str(guard_time),'.mat']);
    end
    
end
% figure();
% plot(d);
% hold on;
% plot(d_original);