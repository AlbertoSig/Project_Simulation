clear;
range = 20:5:80;
dir = '';
metric = 'CTR packet delivery ratio';
save_flag = 0;
%1 Relay
load(['guard_time/',dir,'/figure/1Relay/simTDMA_1Relay'])
figure();
plot(range,adap_CTR_pdr);
hold on;
grid on;
title([metric, ' 1 relay']);
xlabel('time between 2 waipoint transmission [s]');
ylabel(metric);
load(['guard_time/',dir,'/figure/1Relay/simTDMAFRAME_1Relay'])
index = find(adap_CTR_pdr == 0);
if ~isempty(index)
    for i = index
        adap_CTR_pdr(i) = 1/realmax;
    end
end
plot(range,adap_CTR_pdr);
legend('simple TDMA','TDMA FRAME','Location','southeast','Location','southeast');%,'Location','southeast'
axis([20 80 0 1.1]);


if save_flag == 1
    savefig(['guard_time/figure/',dir,metric,'_1Relay.fig']);
    saveas(gcf,['guard_time/figure/',dir,metric,'_1Relay.png']);
    saveas(gcf,['guard_time/figure/',dir,metric,'_1Relay.eps']);
end



%2 Relay
load(['guard_time/',dir,'/figure/2Relay/simTDMA_2Relay'])
index = find(adap_CTR_pdr == 0);
if ~isempty(index)
    for i = index
        adap_CTR_pdr(i) = 1/realmax;
    end
end
figure();
plot(range,adap_CTR_pdr);
hold on;
grid on;
title([metric,' 2 relay']);
xlabel('time between 2 waipoint transmission [s]');
ylabel(metric);
load(['guard_time/',dir,'/figure/2Relay/simTDMAFRAME_2Relay'])
index = find(adap_CTR_pdr == 0);
if ~isempty(index)
    for i = index
        adap_CTR_pdr(i) = 1/realmax;
    end
end
plot(range,adap_CTR_pdr);
load(['guard_time/',dir,'/figure/2Relay/simTDMAFRAME_2Relay_pipeline2'])
index = find(adap_CTR_pdr == 0);
if ~isempty(index)
    for i = index
        adap_CTR_pdr(i) = 1/realmax;
    end
end
plot(range,adap_CTR_pdr);
axis([20 80 0 1.1]);
legend('simple TDMA','TDMA FRAME','TDMA FRAME pipeline','Location','southeast');%,'Location','southeast'


if save_flag == 1
    savefig(['guard_time/figure/',dir,metric,'_2Relay.fig']);
    saveas(gcf,['guard_time/figure/',dir,metric,'_2Relay.png']);
    saveas(gcf,['guard_time/figure/',dir,metric,'_2Relay.eps']);
end



%3 Relay
load(['guard_time/',dir,'/figure/3Relay/simTDMA_3Relay'])
index = find(adap_CTR_pdr == 0);
if ~isempty(index)
    for i = index
        adap_CTR_pdr(i) = 1/realmax;
    end
end
figure();
plot(range,adap_CTR_pdr);
hold on;
grid on;
title([metric, ' 3 relay']);
xlabel('time between 2 waipoint transmission [s]');
ylabel(metric);
load(['guard_time/',dir,'/figure/3Relay/simTDMAFRAME_3Relay'])
index = find(adap_CTR_pdr == 0);
if ~isempty(index)
    for i = index
        adap_CTR_pdr(i) = 1/realmax;
    end
end
plot(range,adap_CTR_pdr);
load(['guard_time/',dir,'/figure/3Relay/simTDMAFRAME_3Relay_pipeline'])
index = find(adap_CTR_pdr == 0);
if ~isempty(index)
    for i = index
        adap_CTR_pdr(i) = 1/realmax;
    end
end
plot(range,adap_CTR_pdr);
load(['guard_time/',dir,'/figure/3Relay/simTDMAFRAME_3Relay_pipeline2'])
index = find(adap_CTR_pdr == 0);
if ~isempty(index)
    for i = index
        adap_CTR_pdr(i) = 1/realmax;
    end
end
plot(range,adap_CTR_pdr);
axis([20 80 0 1.1]);
legend('simple TDMA','TDMA FRAME','TDMA FRAME pipeline','TDMA FRAME pipeline 2','Location','southeast');%,'Location','southeast'


if save_flag == 1
    savefig(['guard_time/figure/',dir,metric,'_3Relay.fig']);
    saveas(gcf,['guard_time/figure/',dir,metric,'_3Relay.png']);
    saveas(gcf,['guard_time/figure/',dir,metric,'_3Relay.eps']);
end

