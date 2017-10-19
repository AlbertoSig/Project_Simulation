clear

% R1 = zeros(60,402);
% R2 = zeros(60,402);
% R3 = zeros(60,402);
% R4 = zeros(60,402);
% ROV = zeros(60,402);
% CTR = zeros(60,402);
% 
% for j = 1:60
%     R1(j,:) = importdata(['R1_buffer',int2str(j),'.txt']);
%     R2(j,:) = importdata(['R2_buffer',int2str(j),'.txt']);
%     R3(j,:) = importdata(['R3_buffer',int2str(j),'.txt']);
%     R4(j,:) = importdata(['R4_buffer',int2str(j),'.txt']);
%     CTR(j,:) = importdata(['CTR_buffer',int2str(j),'.txt']);
%     ROV(j,:) = importdata(['ROV_buffer',int2str(j),'.txt']);
%     time = importdata(['time_buffer',int2str(j),'.txt']);
% end

load('buffer.mat');

figure();
plot(time,R1(1,:),'-r*','MarkerSize',5);
title('Buffer size(AUV period 1)');
hold on;
grid on;
plot(time,R2(1,:),'-b.','MarkerSize',12);
plot(time,R3(1,:),'-g^','MarkerSize',4,'MarkerFaceColor','g');
plot(time,R4(1,:),'-mx','MarkerSize',8);
axis([0 time(402) 0 100]);
xlabel('time [s]');
ylabel('buffer size');
legend('relay R1','relay R2','relay R3','relay R4');


figure();
plot(time,R1(30,:),'-r*','MarkerSize',5);
title('Buffer size(AUV period 30)');
hold on;
grid on;
plot(time,R2(30,:),'-b.','MarkerSize',12);
plot(time,R3(30,:),'-g^','MarkerSize',4,'MarkerFaceColor','g');
plot(time,R4(30,:),'-mx','MarkerSize',8);
axis([0 time(402) 0 100]);
xlabel('time [s]');
ylabel('buffer size');
legend('relay R1','relay R2','relay R3','relay R4');

figure();
plot(time,R1(60,:),'-r*','MarkerSize',5);
title('Buffer size(AUV period 60)');
hold on;
grid on;
plot(time,R2(60,:),'-b.','MarkerSize',12);
plot(time,R3(60,:),'-g^','MarkerSize',4,'MarkerFaceColor','g');
plot(time,R4(60,:),'-mx','MarkerSize',8);
axis([0 time(402) 0 100]);
xlabel('time [s]');
ylabel('buffer size');
legend('relay R1','relay R2','relay R3','relay R4');