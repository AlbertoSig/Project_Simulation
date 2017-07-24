clear;
range = 20:5:80;
dir = '';
load(['guard_time_increasingRelay',dir,'/figure/simTDMAFRAME_1Relay.mat']);
save_flag = 1;

%rmse
figure(1);
semilogy(range, adap_rmse,'-r*','MarkerSize',5);
grid on;
hold on;
title('RMSE');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
title('ROV packet delivery ratio');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
title('CTR packet delivery ratio');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR packet delivery ratio');
%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-r*','MarkerSize',5);
grid on;
hold on;

title('ROV packet delivery delay');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-r*','MarkerSize',5);
grid on;
hold on;

title('CTR packet delivery delay');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR packet delivery delay [s]');
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-r*','MarkerSize',5);
grid on;
hold on;
title('CTR throughput');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR throughput [bit/s]');
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-r*','MarkerSize',5);
grid on;
hold on;
title('ROV throughput');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('ROV throughput [bit/s]');

%2 Relay
load(['guard_time_increasingRelay',dir,'/figure/simTDMAFRAME_pipeline2_2Relay.mat']);

%rmse
figure(1);
semilogy(range, adap_rmse,'-b.','MarkerSize',12);
title('RMSE');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-b.','MarkerSize',12);
title('ROV packet delivery ratio');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-b.','MarkerSize',12);
grid on;
hold on;
title('CTR packet delivery ratio');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR packet delivery ratio');
%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-b.','MarkerSize',12);
grid on;
hold on;

title('ROV packet delivery delay');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-b.','MarkerSize',12);
grid on;
hold on;
title('CTR packet delivery delay');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR packet delivery delay [s]');

%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-b.','MarkerSize',8);
grid on;
hold on;
title('CTR throughput');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR throughput [bit/s]');

%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-b.','MarkerSize',8);
grid on;
hold on;
title('ROV throughput');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('ROV throughput [bit/s]');


%3 realay
load(['guard_time_increasingRelay',dir,'/figure/simTDMAFRAME_pipeline2_3Relay.mat']);
%rmse
figure(1);
semilogy(range, adap_rmse,'-mx','MarkerSize',8);
title('RMSE');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('RMSE');
axis([20 80 10^-3 10^4]);
legend('rmse 1 relay','rmse 2 relay','rmse 3 realay');
if save_flag == 1
    savefig(['guard_time_increasingRelay/',dir,'/comparison/rmse.fig']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/rmse.png']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/rmse.eps']);
end

%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-mx','MarkerSize',8);
axis([20 80 0 1]);
title('ROV packet delivery ratio');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('ROV packet delivery ratio');
legend('ROV packet delivery ratio 1 realay',...
    'ROV packet delivery ratio 2 relay',...
    'ROV packet delivery ratio 3 relay','Location','east');
if save_flag == 1
    savefig(['guard_time_increasingRelay/',dir,'/comparison/ROV_pdr.fig']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/ROV_pdr.png']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/ROV_pdr.eps']);
end

%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-mx','MarkerSize',8);
grid on;
hold on;
axis([20 80 0 1]);
title('CTR packet delivery ratio');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR packet delivery ratio');
legend('CTR packet delivery ratio 1 realay',...
    'CTR packet delivery ratio 2 relay',...
    'CTR packet delivery ratio 3 relay','Location','east');
if save_flag == 1
    savefig(['guard_time_increasingRelay/',dir,'/comparison/CTR_pdr.fig']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/CTR_pdr.png']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/CTR_pdr.eps']);
end


%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-mx','MarkerSize',8);
axis([20 80 1 10^4]);
grid on;
hold on;
title('ROV packet delivery delay');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('Packet delivery delay [s]');
legend('ROV packet delivery delay 1 realay',...
    'ROV packet delivery delay 2 relay',...
    'ROV packet delivery delay 3 relay');%,'Location','southeast'
if save_flag == 1
    savefig(['guard_time_increasingRelay/',dir,'/comparison/ROV_pdd.fig']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/ROV_pdd.png']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/ROV_pdd.eps']);
end

%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-mx','MarkerSize',8);
grid on;
hold on;
title('CTR packet delivery delay');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR packet delivery delay [s]');
legend('CTR packet delivery delay 1 realay',...
    'CTR packet delivery delay 2 relay',...
    'CTR packet delivery delay 3 relay');%,'Location','southeast'
axis([20 80 1 10^4]);
if save_flag == 1
    savefig(['guard_time_increasingRelay/',dir,'/comparison/CTR_pdd.fig']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/CTR_pdd.png']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/CTR_pdd.eps']);
end

%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-mx','MarkerSize',8);
grid on;
hold on;
title('CTR throughput');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('CTR throughput [bit/s]');
legend('CTR throughput 1 realay',...
    'CTR throughput 2 relay',...
    'CTR throughput 3 relay');%,'Location','southeast'
axis([20 80 0 600]);

if save_flag == 1
    savefig(['guard_time_increasingRelay/',dir,'/comparison/CTR_thr.fig']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/CTR_thr.png']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/CTR_thr.eps']);
end

%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-mx','MarkerSize',8);
grid on;
hold on;
title('ROV throughput');
xlabel('time between 2 waipoint transmission [s]'); 
ylabel('ROV throughput [bit/s]');
legend('ROV throughput 1 realay',...
    'ROV throughput 2 relay',...
    'ROV throughput 3 relay');
axis([20 80 0 400]);

if save_flag == 1
    savefig(['guard_time_increasingRelay/',dir,'/comparison/ROV_thr.fig']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/ROV_thr.png']);
    saveas(gcf,['guard_time_increasingRelay/',dir,'/comparison/ROV_thr.eps']);
end
