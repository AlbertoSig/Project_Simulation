clear;
range = 20:5:80;
dir = 'NOqueueROV_pdrMAClayer';
metric = 'RMSE';
save_flag = 1;
%1 Relay
load(['guard_time/',dir,'/figure/1Relay/simTDMA_1Relay'])
figure();
semilogy(range,adap_rmse,'-*b','markersize',8);
hold on;
grid on;
title([metric, ' 1 relay']);
xlabel('time between 2 waipoint transmission [s]');
ylabel(metric);
load(['guard_time/',dir,'/figure/1Relay/simTDMAFRAME_1Relay'])
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse,'.-r','markersize',12);
legend('simple TDMA','TDMA FRAME');%,'Location','southeast'
axis([20 80 10^-3 10^4]);


if save_flag == 1
    savefig(['guard_time/',dir,'/figure/',metric,'_1Relay.fig']);
    saveas(gcf,['guard_time/',dir,'/figure/',metric,'_1Relay.png']);
    saveas(gcf,['guard_time/',dir,'/figure/',metric,'_1Relay.eps']);
end



%2 Relay
load(['guard_time/',dir,'/figure/2Relay/simTDMA_2Relay'])
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
figure();
semilogy(range,adap_rmse,'-*b','markersize',8);
hold on;
grid on;
title([metric,' 2 relay']);
xlabel('time between 2 waipoint transmission [s]');
ylabel(metric);
load(['guard_time/',dir,'/figure/2Relay/simTDMAFRAME_2Relay'])
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse,'.-r','markersize',12);
load(['guard_time/',dir,'/figure/2Relay/simTDMAFRAME_2Relay_pipeline2'])
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse,'x-m','markersize',10);
axis([20 80 10^-3 10^4]);
legend('simple TDMA','TDMA FRAME','TDMA FRAME pipeline');%,'Location','southeast'


if save_flag == 1
    savefig(['guard_time/',dir,'/figure/',metric,'_2Relay.fig']);
    saveas(gcf,['guard_time/',dir,'/figure/',metric,'_2Relay.png']);
    saveas(gcf,['guard_time/',dir,'/figure/',metric,'_2Relay.eps']);
end



%3 Relay
load(['guard_time/',dir,'/figure/3Relay/simTDMA_3Relay'])
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
figure();
semilogy(range,adap_rmse,'-*b','markersize',8);
hold on;
grid on;
title([metric, ' 3 relay']);
xlabel('time between 2 waipoint transmission [s]');
ylabel(metric);
load(['guard_time/',dir,'/figure/3Relay/simTDMAFRAME_3Relay'])
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse,'.-r','markersize',12);
load(['guard_time/',dir,'/figure/3Relay/simTDMAFRAME_3Relay_pipeline'])
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse,'x-m','markersize',10);
load(['guard_time/',dir,'/figure/3Relay/simTDMAFRAME_3Relay_pipeline2'])
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse,'^-g');
axis([20 80 10^-3 10^4]);
legend('simple TDMA','TDMA FRAME','TDMA FRAME pipeline','TDMA FRAME pipeline 2');%,'Location','southeast'


if save_flag == 1
    savefig(['guard_time/',dir,'/figure/',metric,'_3Relay.fig']);
    saveas(gcf,['guard_time/',dir,'/figure/',metric,'_3Relay.png']);
    saveas(gcf,['guard_time/',dir,'/figure/',metric,'_3Relay.eps']);
end

