clear;
range = 20:5:60;
%1 Relay
load('guard_time\max_ROVperiod\figure\1Relay\simTDMA_1Relay')
figure();
semilogy(range,adap_rmse);
hold on;
grid on;
title('RMSE 1 relay');
xlabel('waypoints guard time');
ylabel('RMSE');
load('guard_time\max_ROVperiod\figure\1Relay\simTDMAFRAME_1Relay')
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse);
legend('simple TDMA','TDMA FRAME');
axis([20 60 10^(-3) 10^3]);


%2 Relay
load('guard_time\max_ROVperiod\figure\2Relay\simTDMA_2Relay')
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
figure();
semilogy(range,adap_rmse);
hold on;
grid on;
title('RMSE 2 relay');
xlabel('waypoints guard time');
ylabel('RMSE');
load('guard_time\max_ROVperiod\figure\2Relay\simTDMAFRAME_2Relay')
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse);
load('guard_time\max_ROVperiod\figure\2Relay\simTDMAFRAME_2Relay_pipeline2')
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse);
axis([20 60 10^(-3) 10^3]);
legend('simple TDMA','TDMA FRAME','TDMA FRAME pipeline');

%3 Relay
load('guard_time\max_ROVperiod\figure\3Relay\simTDMA_3Relay')
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
figure();
semilogy(range,adap_rmse);
hold on;
grid on;
title('RMSE 3 relay');
xlabel('waypoints guard time');
ylabel('RMSE');
load('guard_time\max_ROVperiod\figure\3Relay\simTDMAFRAME_3Relay')
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse);
load('guard_time\max_ROVperiod\figure\3Relay\simTDMAFRAME_3Relay_pipeline')
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse);
load('guard_time\max_ROVperiod\figure\3Relay\simTDMAFRAME_3Relay_pipeline2')
index = find(adap_rmse == 0);
if ~isempty(index)
    for i = index
        adap_rmse(i) = 1/realmax;
    end
end
semilogy(range,adap_rmse);
axis([20 60 10^(-3) 10^3]);
legend('simple TDMA','TDMA FRAME','TDMA FRAME pipeline','TDMA FRAME pipeline 2');