clear;
range = 20:5:80;
dir = 'simTDMAFRAME_1Relay';
i = 0;
adap_rmse = zeros(1,length(range));
adap_ROV_pdr = zeros(1,length(range));
adap_CTR_pdr = zeros(1,length(range));
adap_ROV_th = zeros(1,length(range));
adap_CTR_th = zeros(1,length(range));
adap_CTR_pdd = zeros(1,length(range));
adap_ROV_pdd = zeros(1,length(range));
for k = range
    i = i+1;
    load(['guard_time/',dir,'/adaptiveROVpath_Guard_time',int2str(k),'.mat'])
    adap_rmse(i) = rmse;
    adap_ROV_pdr(i) = ROV_pdr;
    adap_CTR_pdr(i) = CTR_pdr;
    adap_ROV_th(i) = ROV_th;
    adap_CTR_th(i) = CTR_th;
    adap_CTR_pdd(i) = CTR_pdd;
    adap_ROV_pdd(i) = ROV_pdd;
end
save_flag = 0;

%RMSE
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end

figure();
semilogy(range, adap_rmse,'r');
grid on;
title('RMSE');
xlabel('time between 2 waipoint transmission [s]');
ylabel('RMSE');
legend('adaptive ROV period');
axis([20 80 10^-3 1000]);
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_RMSE.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_RMSE.png']);
    saveas(gcf,['guard_time/figure/',dir,'_RMSE.eps']);
end

%ROV Throughput
figure();
plot(range, adap_ROV_th,'r');
grid on;
title('ROV throughput');
xlabel('time between 2 waipoint transmission [s]');
ylabel('ROV throughput [bit/s]');
legend('adaptive ROV period');
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_ROV_th.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_ROV_th.png']);
    saveas(gcf,['guard_time/figure/',dir,'_ROV_th.eps']);
end

%CTR Throughput
figure();
plot(range, adap_CTR_th,'r');
grid on;
title('CTR throughput');
xlabel('time between 2 waipoint transmission [s]');
ylabel('CTR throughput [bit/s]');
legend('adaptive ROV period');
axis([20 80 0 500]);
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_CTR_th.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_CTR_th.png']);
    saveas(gcf,['guard_time/figure/',dir,'_CTR_th.eps']);
end


%ROV packet delivery ratio
figure();
hold on;
plot(range, adap_ROV_pdr,'r');
grid on;
axis([20 80 0 1]);
title('ROV packet delivery ratio');
xlabel('time between 2 waipoint transmission [s]');
ylabel('ROV packet delivery ratio');
legend('adaptive ROV period','Location','east');
if save_flag == 1
    savefig(['guard_time/figure/',dir,'ROV_pdr.fig']);
    saveas(gcf,['guard_time/figure/',dir,'ROV_pdr.png']);
    saveas(gcf,['guard_time/figure/',dir,'ROV_pdr.eps']);
end

%CTR packet delivery ratio
figure();
hold on;
plot(range, adap_CTR_pdr,'r');
grid on;
axis([20 80 0 1]);
title('CTR packet delivery ratio');
xlabel('time between 2 waipoint transmission [s]');
ylabel('CTR packet delivery ratio');
legend('adaptive ROV period','Location','northeast');
if save_flag == 1
    savefig(['guard_time/figure/',dir,'CTR_pdr.fig']);
    saveas(gcf,['guard_time/figure/',dir,'CTR_pdr.png']);
    saveas(gcf,['guard_time/figure/',dir,'CTR_pdr.eps']);
end

%CTR packet delivery delay
figure();
hold on;
plot(range, adap_CTR_pdd,'r');
grid on;
title('CTR packet delivery delay');
xlabel('time between 2 waipoint transmission [s]');
ylabel('CTR packet delivery delay [s]');
legend('adaptive ROV period');
axis([20 80 0 2000]);
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_CTRpdd.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_CTRpdd.png']);
    saveas(gcf,['guard_time/figure/',dir,'_CTRpdd.eps']);
end

%ROV packet delivery delay
figure();
hold on;
plot(range, adap_ROV_pdd,'r');
axis([20 80 0 4800]);
grid on;
title('ROV packet delivery delay');
xlabel('time between 2 waipoint transmission [s]');
ylabel('Packet delivery delay [s]');
legend('adaptive ROV period');
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_ROVpdd.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_ROVpdd.png']);
    saveas(gcf,['guard_time/figure/',dir,'_ROVpdd.eps']);
end



if save_flag == 1
    save(['guard_time/figure/',dir,'.mat'],'adap_rmse','adap_ROV_pdr',...
    'adap_CTR_pdr','adap_ROV_th','adap_CTR_th','adap_CTR_pdd','adap_ROV_pdd');
end