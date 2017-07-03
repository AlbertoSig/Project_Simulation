clear;
close all;
save_flag = 0;
load('original_path.mat');
x = importdata('x.txt');
y = importdata('y.txt');
z = importdata('z.txt');
data = importdata('data.txt');
%data contains 6 values
% data(1) = ROV throughput
% data(2) = ROV Packet Error Rate
% data(3) = CTR throughput
% data(4) = CTR Packet Error Rate
% data(5) = total sent packets
% data(6) = total received packets
% data(7) = ROV period
% data(8) = adaptive or constant CTR period
x = x(2:end);
y = y(2:end);
ROV_th = data(1);
ROV_per = data(2);
CTR_th = data(3);
CTR_per = data(4);
sent_pkts = data(5);
rcv_pkts = data(6);
ROV_period = data(7);
if data(8) == 0
    type = 'constant';
else
    type = 'adaptive';
end
mean_th = (ROV_th + CTR_th)/2;
pdr = rcv_pkts/sent_pkts;

d = sqrt(x.^2 + y.^2);
d_original = sqrt(x_original.^2 + y_original.^2);
rmse = sqrt(sum((d-d_original).^2)/length(d_original));
figure()
plot(x,y);
hold on
plot(x_original,y_original,'--');
xlabel('x');
ylabel('y');
legend('rov path','original path');
if save_flag == 1
    savefig(['sim60tdma\',type,'ROVpath_ROVperiod',int2str(ROV_period)])
    saveas(gcf,['sim60tdma\',type,'ROVpath_ROVperiod',int2str(ROV_period),'.png']);
    save(['sim60tdma\',type,'ROVpath_ROVperiod',int2str(ROV_period),'.mat']);
end
% figure();
% plot(d);
% hold on;
% plot(d_original);