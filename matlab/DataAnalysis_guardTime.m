clear;
i = 0;
range = 20:5:60;
const_rmse = zeros(1,length(range));
const_pdr = zeros(1,length(range));
const_mean_th = zeros(1,length(range));
const_CTR_pdd = zeros(1,length(range));
const_ROV_pdd = zeros(1,length(range));
dir = 'simProva';
save_flag = 0;
% for k = range
%     i = i+1;
%     load([dir,'/constantROVpath_Guard time',int2str(k),'.mat'])
%     const_rmse(i) = rmse;
%     const_pdr(i) = pdr;
%     const_mean_th(i) = mean_th;
%     const_CTR_pdd(i) = CTR_pdd;
%     const_ROV_pdd(i) = ROV_pdd;
% end
i = 0;
adap_rmse = zeros(1,length(range));
adap_pdr = zeros(1,length(range));
adap_mean_th = zeros(1,length(range));
adap_CTR_pdd = zeros(1,length(range));
adap_ROV_pdd = zeros(1,length(range));
for k = range
    i = i+1;
    load([dir,'/adaptiveROVpath_Guard time',int2str(k),'.mat'])
    adap_rmse(i) = rmse;
    adap_pdr(i) = pdr;
    adap_mean_th(i) = mean_th;
    adap_CTR_pdd(i) = CTR_pdd;
    adap_ROV_pdd(i) = ROV_pdd;
end
figure();
plot(range, const_rmse);
title('RMSE');
hold on;
plot(range, adap_rmse);
grid on;
xlabel('Waipoint guard time');
ylabel('RMSE');
legend('constant ROV period','adaptive ROV period');
%axis([0 60 0 10]);
if save_flag == 1
    savefig(['figure\',dir,'_RMSE.fig']);
    saveas(gcf,['figure/',dir,'_RMSE.png']);
    saveas(gcf,['figure/',dir,'_RMSE.eps']);
end

figure();
plot(range, const_mean_th);
hold on;
plot(range, adap_mean_th);
grid on;
title('Mean throughput');
xlabel('Waipoint guard time');
ylabel('Mean throughput');
legend('constant ROV period','adaptive ROV period');
if save_flag == 1
    savefig(['figure/',dir,'_mean_th.fig']);
    saveas(gcf,['figure/',dir,'_mean_th.png']);
    saveas(gcf,['figure/',dir,'_mean_th.eps']);
end

figure();
plot(range, const_pdr);
grid on;
hold on;
plot(range, adap_pdr);
title('Packet delivery ratio');
xlabel('Waipoint guard time');
ylabel('Packet delivery ratio');
legend('constant ROV period','adaptive ROV period');
if save_flag == 1
    savefig(['figure/',dir,'_pdr.fig']);
    saveas(gcf,['figure/',dir,'_pdr.png']);
    saveas(gcf,['figure/',dir,'_pdr.eps']);
end
figure();
plot(range, const_CTR_pdd);
grid on;
hold on;
plot(range, adap_CTR_pdd);
title('CTR packet delivery delay');
xlabel('Waipoint guard time');
ylabel('CTR packet delivery delay');
legend('constant ROV period','adaptive ROV period');
%axis([0 60 0 25]);
if save_flag == 1
    savefig(['figure/',dir,'_CTRpdd.fig']);
    saveas(gcf,['figure/',dir,'_CTRpdd.png']);
    saveas(gcf,['figure/',dir,'_CTRpdd.eps']);
end
figure();
plot(range, const_ROV_pdd);
grid on;
hold on;
plot(range, adap_ROV_pdd);
title('ROV packet delivery delay');
xlabel('Waipoint guard time');
ylabel('Packet delivery delay');
legend('constant ROV period','adaptive ROV period');
if save_flag == 1
    savefig(['figure/',dir,'_ROVpdd.fig']);
    saveas(gcf,['figure/',dir,'_ROVpdd.png']);
    saveas(gcf,['figure/',dir,'_ROVpdd.eps']);
end