clear;
range = 20:5:60;
dir = 'simTDMAFRAME_1Relay';
i = 0;
adap_rmse = zeros(1,length(range));
adap_pdr = zeros(1,length(range));
adap_mean_th = zeros(1,length(range));
adap_CTR_pdd = zeros(1,length(range));
adap_ROV_pdd = zeros(1,length(range));
for k = range
    i = i+1;
    load(['guard_time/',dir,'/adaptiveROVpath_Guard_time',int2str(k),'.mat'])
    adap_rmse(i) = rmse;
    adap_pdr(i) = pdr;
    adap_mean_th(i) = mean_th;
    adap_CTR_pdd(i) = CTR_pdd;
    adap_ROV_pdd(i) = ROV_pdd;
end
save_flag = 1;
figure();
plot(range, adap_rmse,'r');
grid on;
title('RMSE');
xlabel('Waipoint guard time');
ylabel('RMSE');
legend('adaptive ROV period');
%axis([20 60 0 25]);
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_RMSE.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_RMSE.png']);
    saveas(gcf,['guard_time/figure/',dir,'_RMSE.eps']);
end

figure();
plot(range, adap_mean_th,'r');
grid on;
title('Mean throughput');
xlabel('Waipoint guard time');
ylabel('Mean throughput');
legend('adaptive ROV period');
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_mean_th.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_mean_th.png']);
    saveas(gcf,['guard_time/figure/',dir,'_mean_th.eps']);
end

figure();
hold on;
plot(range, adap_pdr,'r');
grid on;
axis([20 60 0 1]);
title('Packet delivery ratio');
xlabel('Waipoint guard time');
ylabel('Packet delivery ratio');
legend('adaptive ROV period','Location','east');
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_pdr.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_pdr.png']);
    saveas(gcf,['guard_time/figure/',dir,'_pdr.eps']);
end
figure();
hold on;
plot(range, adap_CTR_pdd,'r');
grid on;
title('CTR packet delivery delay');
xlabel('Waipoint guard time');
ylabel('CTR packet delivery delay');
legend('adaptive ROV period');
axis([20 60 0 20]);
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_CTRpdd.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_CTRpdd.png']);
    saveas(gcf,['guard_time/figure/',dir,'_CTRpdd.eps']);
end
figure();
hold on;
plot(range, adap_ROV_pdd,'r');
axis([20 60 0 40]);
grid on;
title('ROV packet delivery delay');
xlabel('Waipoint guard time');
ylabel('Packet delivery delay');
legend('adaptive ROV period');
if save_flag == 1
    savefig(['guard_time/figure/',dir,'_ROVpdd.fig']);
    saveas(gcf,['guard_time/figure/',dir,'_ROVpdd.png']);
    saveas(gcf,['guard_time/figure/',dir,'_ROVpdd.eps']);
end
if save_flag == 1
    save(['guard_time/figure/',dir,'.mat'],'adap_rmse','adap_pdr',...
    'adap_mean_th','adap_CTR_pdd','adap_ROV_pdd');
end