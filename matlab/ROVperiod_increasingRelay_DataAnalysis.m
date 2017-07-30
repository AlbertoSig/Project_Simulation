clear;
range = 1:1:60;
dir = 'simProva';
i = 0;
adap_rmse = zeros(1,length(range));
adap_ROV_pdr = zeros(1,length(range));
adap_CTR_pdr = zeros(1,length(range));
adap_ROV_th = zeros(1,length(range));
adap_CTR_th = zeros(1,length(range));
adap_CTR_pdd = zeros(1,length(range));
adap_CTR_pdd_CI = zeros(1,length(range)); %confidence interval at 95%
adap_ROV_pdd = zeros(1,length(range));
adap_ROV_pdd_CI = zeros(1,length(range));
for k = range
    i = i+1;
    load(['ROV_period_increasingRelay/',dir,'/adaptiveROVpath_ROVperiod',int2str(k),'.mat'])
    adap_rmse(i) = rmse;
    adap_ROV_pdr(i) = ROV_pdr;
    adap_CTR_pdr(i) = CTR_pdr;
    adap_ROV_th(i) = ROV_th;
    adap_CTR_th(i) = CTR_th;
    adap_CTR_pdd(i) = CTR_pdd;
    adap_CTR_pdd_CI(i) = CTR_pdd_std*1.96/sqrt(ROV_rcv_pkts);
    adap_ROV_pdd(i) = ROV_pdd;
    adap_ROV_pdd_CI(i) = ROV_pdd_std*1.96/sqrt(CTR_rcv_pkts);
end
max_ROV_period_theo = slot_duration*number_nodes;
save_flag = 0;

%RMSE
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end

figure();
semilogy(range, adap_rmse,'-r*','MarkerSize',5);
grid on;
hold on;
semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
legend('rmse','theoretical min ROV period');
axis([1 60 10^-3 1000]);
if save_flag == 1
    savefig(['ROV_period_increasingRelay/figure/',dir,'_RMSE.fig']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_RMSE.png']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_RMSE.eps']);
end

%ROV Throughput
figure();
plot(range, adap_ROV_th,'-r*','MarkerSize',5);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV throughput');
xlabel('ROV period [s]');
ylabel('ROV throughput [bit/s]');
legend('ROV throughput','theoretical min ROV period');
axis([1 60 0 300]);
if save_flag == 1
    savefig(['ROV_period_increasingRelay/figure/',dir,'_ROV_th.fig']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_ROV_th.png']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_ROV_th.eps']);
end

%CTR Throughput
figure();
plot(range, adap_CTR_th,'-r*','MarkerSize',5);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');
legend('CTR throughput','theoretical min ROV period');
axis([1 60 0 750]);
if save_flag == 1
    savefig(['ROV_period_increasingRelay/figure/',dir,'_CTR_th.fig']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_CTR_th.png']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_CTR_th.eps']);
end


%ROV packet delivery ratio
figure();
plot(range, adap_ROV_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
legend('ROV packet delivery ratio','theoretical min ROV period','Location','east');
if save_flag == 1
    savefig(['ROV_period_increasingRelay/figure/',dir,'ROV_pdr.fig']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'ROV_pdr.png']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'ROV_pdr.eps']);
end

%CTR packet delivery ratio
figure();
plot(range, adap_CTR_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('ROV period [s]');
ylabel('CTR packet delivery ratio');
legend('CTR packet delivery ratio','theoretical min ROV period','Location','east');
if save_flag == 1
    savefig(['ROV_period_increasingRelay/figure/',dir,'CTR_pdr.fig']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'CTR_pdr.png']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'CTR_pdr.eps']);
end

%CTR packet delivery delay
figure();
plot(range, adap_CTR_pdd,'-r*','MarkerSize',5);
%errorbar(range,adap_CTR_pdd,adap_CTR_pdd_CI,'r');
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
legend('CTR packet delivery delay','theoretical min ROV period');
axis([1 60 0 50]);
if save_flag == 1
    savefig(['ROV_period_increasingRelay/figure/',dir,'_CTRpdd.fig']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_CTRpdd.png']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_CTRpdd.eps']);
end

%ROV packet delivery delay
figure();
%errorbar(range, adap_ROV_pdd,adap_ROV_pdd_CI,'r');
plot(range, adap_ROV_pdd,'-r*','MarkerSize',5);
axis([1 60 0 2200]);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('Packet delivery delay [s]');
legend('ROV packet delivery delay','theoretical min ROV period');
if save_flag == 1
    savefig(['ROV_period_increasingRelay/figure/',dir,'_ROVpdd.fig']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_ROVpdd.png']);
    saveas(gcf,['ROV_period_increasingRelay/figure/',dir,'_ROVpdd.eps']);
end



if save_flag == 1
    save(['ROV_period_increasingRelay/figure/',dir,'.mat'],'adap_rmse','adap_ROV_pdr',...
    'adap_CTR_pdr','adap_ROV_th','adap_CTR_th','adap_CTR_pdd','adap_ROV_pdd',...
    'slot_duration');
end