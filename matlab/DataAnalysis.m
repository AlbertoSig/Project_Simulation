clear;
i = 0;
range = 5:5:60;
const_rmse = zeros(1,length(range));
const_pdr = zeros(1,length(range));
const_mean_th = zeros(1,length(range));
for k = range
    i = i+1;
    load(['sim60tdma\constantROVpath_ROVperiod',int2str(k),'.mat'])
    const_rmse(i) = rmse;
    const_pdr(i) = pdr;
    const_mean_th(i) = mean_th;
end
i = 0;
range = 5:5:60;
adap_rmse = zeros(1,length(range));
adap_pdr = zeros(1,length(range));
adap_mean_th = zeros(1,length(range));
for k = range
    i = i+1;
    load(['sim60tdma\adaptiveROVpath_ROVperiod',int2str(k),'.mat'])
    adap_rmse(i) = rmse;
    adap_pdr(i) = pdr;
    adap_mean_th(i) = mean_th;
end
figure();
plot(range, const_rmse);
title('RMSE');
hold on;
plot(range, adap_rmse);
grid on;
xlabel('ROV period');
ylabel('RMSE');
legend('constant ROV period','adaptive ROV period');
figure();
plot(range, const_mean_th);
hold on;
plot(range, adap_mean_th);
grid on;
title('Mean throughput');
xlabel('ROV period');
ylabel('Mean throughput');
legend('constant ROV period','adaptive ROV period');
figure();
plot(range, const_pdr);
grid on;
hold on;
plot(range, adap_pdr);
title('Packet delivery ratio');
xlabel('ROV period');
ylabel('Packet delivery ratio');
legend('constant ROV period','adaptive ROV period');