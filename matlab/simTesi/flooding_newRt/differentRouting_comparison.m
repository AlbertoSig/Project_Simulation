clear;
range = 1:1:60;
save_flag = 1;
dir = '';
load('posBasedRt_TDMAframe/figure/path.mat');
%max_ROV_period_theo = slot_duration*3;
%rmse
figure(1);
semilogy(range, adap_rmse,'-r*','MarkerSize',5);
grid on;
hold on;
%semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
axis([1 60 10^-3 10^4]);
title('RMSE');
xlabel('AUV period [s]');
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('AUV period [s]');
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('AUV period [s]');
ylabel('CTR packet delivery ratio');
%ROV packet delivry delay
figure(4);
plot(range, adap_ROV_pdd,'-r*','MarkerSize',5);
axis([1 60 0 2500]);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV packet delivery delay');
xlabel('AUV period [s]');
ylabel('ROV Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
plot(range, adap_CTR_pdd,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR packet delivery delay');
xlabel('AUV period [s]');
ylabel('CTR packet delivery delay [s]');
axis([1 60 0 800]);
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR throughput');
xlabel('AUV period [s]');
ylabel('CTR throughput [bit/s]');

axis([1 60 0 750]);
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV throughput');
xlabel('AUV period [s]');
ylabel('ROV throughput [bit/s]');
axis([1 60 0 450]);


% load('posBasedRt_TDMAframe/figure/path.mat');
% %max_ROV_period_theo = slot_duration*3;
% %rmse
% figure(1);
% semilogy(range, adap_rmse,'-b.','MarkerSize',12);
% grid on;
% hold on;
% %semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
% title('RMSE');
% xlabel('AUV period [s]');
% ylabel('RMSE');
% %ROV packet delivery ratio
% figure(2)
% plot(range, adap_ROV_pdr,'-b.','MarkerSize',12);
% grid on;
% hold on;
% %plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
% axis([1 60 0 1]);
% title('ROV packet delivery ratio');
% xlabel('AUV period [s]');
% ylabel('ROV packet delivery ratio');
% %CTR packet delivery ratio
% figure(3)
% plot(range, adap_CTR_pdr,'-b.','MarkerSize',12);
% grid on;
% hold on;
% %plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
% axis([1 60 0 1]);
% title('CTR packet delivery ratio');
% xlabel('AUV period [s]');
% ylabel('CTR packet delivery ratio');
% %ROV packet delivry delay
% figure(4);
% semilogy(range, adap_ROV_pdd,'-b.','MarkerSize',12);
% axis([1 60 0 2500]);
% grid on;
% hold on;
% %plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
% title('ROV packet delivery delay');
% xlabel('AUV period [s]');
% ylabel('ROV Packet delivery delay [s]');
% %CTR packet delivery delay
% figure(5)
% semilogy(range, adap_CTR_pdd,'-b.','MarkerSize',12);
% grid on;
% hold on;
% %plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
% title('CTR packet delivery delay');
% xlabel('AUV period [s]');
% ylabel('CTR packet delivery delay [s]');
% axis([1 60 0 800]);
% %CTR throughput
% figure(6)
% plot(range, adap_CTR_th,'-b.','MarkerSize',12);
% grid on;
% hold on;
% %plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
% title('CTR throughput');
% xlabel('AUV period [s]');
% ylabel('CTR throughput [bit/s]');
% 
% axis([1 60 0 750]);
% %ROV throughput
% figure(7)
% plot(range, adap_ROV_th,'-b.','MarkerSize',12);
% grid on;
% hold on;
% %plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
% title('ROV throughput');
% xlabel('AUV period [s]');
% ylabel('ROV throughput [bit/s]');
% axis([1 60 0 450]);
% 


load('posBasedRt_TDMApipeline/figure/path.mat');
max_ROV_period_theo = slot_duration*3;
%rmse
figure(1);
semilogy(range, adap_rmse,'-b.','MarkerSize',12);
grid on;
hold on;
%semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
title('RMSE');
xlabel('AUV period [s]');
ylabel('RMSE');
legend('TDMA frame',...
        'TDMA brute force');

if save_flag == 1
    savefig(['comparison/rmse.fig']);
    saveas(gcf,['comparison/rmse.png']);
    saveas(gcf,['comparison/rmse'],'epsc');
end
    
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-b.','MarkerSize',12);
grid on;
%hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
axis([1 60 0 1]);
title('AUV packet delivery ratio');
xlabel('AUV period [s]');
ylabel('Packet delivery ratio');
legend('TDMA frame',...
        'TDMA brute force','Location','east');
if save_flag == 1
    savefig(['comparison/ROV_pdr.fig']);
    saveas(gcf,['comparison/ROV_pdr.png']);
    saveas(gcf,['comparison/ROV_pdr'],'epsc');
end    

%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('AUV period [s]');
ylabel('Packet delivery ratio');
legend('TDMA frame',...
        'TDMA brute force','Location','east');
  
if save_flag == 1
    savefig(['comparison/CTR_pdr.fig']);
    saveas(gcf,['comparison/CTR_pdr.png']);
    saveas(gcf,['comparison/CTR_pdr'],'epsc');
end
    
%ROV packet delivry delay
figure(4);
plot(range, adap_ROV_pdd,'-b.','MarkerSize',12);
axis([1 60 0 10^2]);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('AUV packet delivery delay');
xlabel('AUV period [s]');
ylabel('Packet delivery delay [s]');
legend('TDMA frame',...
        'TDMA brute force');

if save_flag == 1
    savefig(['comparison/ROV_pdd.fig']);
    saveas(gcf,['comparison/ROV_pdd.png']);
    saveas(gcf,['comparison/ROV_pdd'],'epsc');
end

    
%CTR packet delivery delay
figure(5)
plot(range, adap_CTR_pdd,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR packet delivery delay');
xlabel('AUV period [s]');
ylabel('Packet delivery delay [s]');
axis([1 60 0 35]);
legend('TDMA frame',...
        'TDMA brute force','Location','east');
if save_flag == 1
    savefig(['comparison/CTR_pdd.fig']);
    saveas(gcf,['comparison/CTR_pdd.png']);
    saveas(gcf,['comparison/CTR_pdd'],'epsc');
end
    
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR throughput');
xlabel('AUV period [s]');
ylabel('CTR throughput [bit/s]');
axis([1 60 0 350]);
legend('TDMA frame',...
        'TDMA brute force');
    
if save_flag == 1
    savefig(['comparison/CTR_thr.fig']);
    saveas(gcf,['comparison/CTR_thr.png']);
    saveas(gcf,['comparison/CTR_thr'],'epsc');
end
    
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV throughput');
xlabel('AUV period [s]');
ylabel('ROV throughput [bit/s]');
axis([1 60 0 50]);
legend('TDMA frame',...
        'TDMA brute force');
    
if save_flag == 1
    savefig(['comparison/ROV_thr.fig']);
    saveas(gcf,['comparison/ROV_thr.png']);
    saveas(gcf,['comparison/ROV_thr'],'epsc');
end
   