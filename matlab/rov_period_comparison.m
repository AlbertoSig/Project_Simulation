clear;
range = 1:1:60;
load('ROV_period/figure/simTDMA_1Relay.mat');
max_ROV_period_theo = slot_duration*3;
%rmse
figure(1);
semilogy(range, adap_rmse,'-r*','MarkerSize',5);
grid on;
hold on;
semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('ROV period [s]');
ylabel('CTR packet delivery ratio');
%ROV packet delivry delay
figure(4);
plot(range, adap_ROV_pdd,'-r*','MarkerSize',5);
axis([1 60 0 2500]);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
plot(range, adap_CTR_pdd,'-r*','MarkerSize',5);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
axis([1 60 0 800]);
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-r*','MarkerSize',5);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');

axis([1 60 0 750]);


%2 Relay
load('ROV_period/figure/simTDMA_2Relay.mat');
max_ROV_period_theo = slot_duration*4;
%rmse
figure(1);
semilogy(range, adap_rmse,'-b.','MarkerSize',12);
semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'-.k');
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-b.','MarkerSize',12);
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'-.k');
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-b.','MarkerSize',12);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'-.k');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('ROV period [s]');
ylabel('CTR packet delivery ratio');
%ROV packet delivry delay
figure(4);
plot(range, adap_ROV_pdd,'-b.','MarkerSize',12);
axis([1 60 0 2500]);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'-.k');
title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
plot(range, adap_CTR_pdd,'-b.','MarkerSize',12);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'-.k');
title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
axis([1 60 0 800]);
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-b.','MarkerSize',8);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'-.k');
title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');
axis([1 60 0 750]);


%3 realay
load('ROV_period/figure/simTDMA_3Relay.mat');
max_ROV_period_theo = slot_duration*5;
%rmse
figure(1);
semilogy(range, adap_rmse,'-mx','MarkerSize',8);
semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],':k');
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
axis([1 60 10^-3 1000]);
legend('rmse 1 relay','theoretical min ROV period 1 relay','rmse 2 relay',...
    'theoretical min ROV period 2 relay','rmse 3 realay',...
    'theoretical min ROV period 3 relay');

%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-mx','MarkerSize',8);
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],':k');
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
legend('ROV packet delivery ratio 1 realay','theoretical min ROV period 1 relay',...
    'ROV packet delivery ratio 2 relay','theoretical min ROV period 2 relay',...
    'ROV packet delivery ratio 3 relay','theoretical min ROV period 3 relay','Location','east');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-mx','MarkerSize',8);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],':k');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('time between 3 waipoint transmission [s]');
ylabel('CTR packet delivery ratio');
legend('CTR packet delivery ratio 1 realay','theoretical min ROV period 1 relay',...
    'CTR packet delivery ratio 2 relay','theoretical min ROV period 2 relay',...
    'CTR packet delivery ratio 3 relay','theoretical min ROV period 3 relay','Location','east');
%ROV packet delivry delay
figure(4);
plot(range, adap_ROV_pdd,'-mx','MarkerSize',8);
axis([1 60 0 5500]);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],':k');
title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('Packet delivery delay [s]');
legend('ROV packet delivery delay 1 realay','theoretical min ROV period 1 relay',...
    'ROV packet delivery delay 2 relay','theoretical min ROV period 2 relay',...
    'ROV packet delivery delay 3 relay','theoretical min ROV period 3 relay');
%CTR packet delivery delay
figure(5)
plot(range, adap_CTR_pdd,'-mx','MarkerSize',8);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],':k');
title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
legend('CTR packet delivery delay 1 realay','theoretical min ROV period 1 relay',...
    'CTR packet delivery delay 2 relay','theoretical min ROV period 2 relay',...
    'CTR packet delivery delay 3 relay','theoretical min ROV period 3 relay');
axis([1 60 0 1950]);
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-mx','MarkerSize',8);
grid on;
hold on;
plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],':k');
title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');
legend('CTR throughput 1 realay','theoretical min ROV period',...
    'CTR throughput 2 relay','theoretical min ROV period 2 relay',...
    'CTR throughput 3 relay','theoretical min ROV period 3 relay');
axis([1 60 0 750]);
