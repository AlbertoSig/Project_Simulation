clear;
range = 1:1:60;
save_flag = 1;
dir = '';
load('PosBasedRouting/TDMAframe/figure/simPosBasedRt_NewPath.mat');
%max_ROV_period_theo = slot_duration*3;
%rmse
figure(1);
semilogy(range, adap_rmse,'-r*','MarkerSize',5);
grid on;
hold on;
%semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
axis([1 60 10^-3 10^4]);
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('ROV period [s]');
ylabel('CTR packet delivery ratio');
%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-r*','MarkerSize',5);
axis([1 60 0 2500]);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('ROV Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
axis([1 60 0 800]);
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');

axis([1 60 0 750]);
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-r*','MarkerSize',5);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV throughput');
xlabel('ROV period [s]');
ylabel('ROV throughput [bit/s]');
axis([1 60 0 450]);


load('PosBasedRouting/TDMApipeline/figure/simPosBasedRt_NewPath.mat');
%max_ROV_period_theo = slot_duration*3;
%rmse
figure(1);
semilogy(range, adap_rmse,'-b.','MarkerSize',12);
grid on;
hold on;
%semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('ROV period [s]');
ylabel('CTR packet delivery ratio');
%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-b.','MarkerSize',12);
axis([1 60 0 2500]);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('ROV Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
axis([1 60 0 800]);
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');

axis([1 60 0 750]);
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-b.','MarkerSize',12);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV throughput');
xlabel('ROV period [s]');
ylabel('ROV throughput [bit/s]');
axis([1 60 0 450]);



load('Routing/figure/simFlooding_newPath.mat');
max_ROV_period_theo = slot_duration*3;
%rmse
figure(1);
semilogy(range, adap_rmse,'-mx','MarkerSize',8);
grid on;
hold on;
%semilogy(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
legend('Position Based Routing(TDMA FRAME)','Position Based Routing(TDMA PIPELINE)',...
        'Flooding(TDMA FRAME)');

if save_flag == 1
    savefig(['PosBasedRouting/',dir,'/comparison/rmse.fig']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/rmse.png']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/rmse'],'epsc');
end
    
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-mx','MarkerSize',8);
grid on;
%hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'--k');
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
legend('Position Based Routing(TDMA FRAME)','Position Based Routing(TDMA PIPELINE)',...
        'Flooding(TDMA FRAME)','Location','southeast');

if save_flag == 1
    savefig(['PosBasedRouting/',dir,'/comparison/ROV_pdr.fig']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/ROV_pdr.png']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/ROV_pdr'],'epsc');
end    

%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-mx','MarkerSize',8);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('ROV period [s]');
ylabel('CTR packet delivery ratio');
legend('Position Based Routing(TDMA FRAME)','Position Based Routing(TDMA PIPELINE)',...
        'Flooding(TDMA FRAME)','Location','east');
  
if save_flag == 1
    savefig(['PosBasedRouting/',dir,'/comparison/CTR_pdr.fig']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/CTR_pdr.png']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/CTR_pdr'],'epsc');
end
    
%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-mx','MarkerSize',8);
axis([1 60 1 10^4]);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('ROV Packet delivery delay [s]');
legend('Position Based Routing(TDMA FRAME)','Position Based Routing(TDMA PIPELINE)',...
        'Flooding(TDMA FRAME)');

if save_flag == 1
    savefig(['PosBasedRouting/',dir,'/comparison/ROV_pdd.fig']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/ROV_pdd.png']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/ROV_pdd'],'epsc');
end

    
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-mx','MarkerSize',8);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
axis([1 60 1 10^4]);
legend('Position Based Routing(TDMA FRAME)','Position Based Routing(TDMA PIPELINE)',...
        'Flooding(TDMA FRAME)');
if save_flag == 1
    savefig(['PosBasedRouting/',dir,'/comparison/CTR_pdd.fig']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/CTR_pdd.png']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/CTR_pdd'],'epsc');
end
    
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-mx','MarkerSize',8);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');
axis([1 60 0 500]);
legend('Position Based Routing(TDMA FRAME)','Position Based Routing(TDMA PIPELINE)',...
        'Flooding(TDMA FRAME)');
    
if save_flag == 1
    savefig(['PosBasedRouting/',dir,'/comparison/CTR_thr.fig']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/CTR_thr.png']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/CTR_thr'],'epsc');
end
    
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-mx','MarkerSize',8);
grid on;
hold on;
%plot(ones(1,2)*max_ROV_period_theo,[10^-5 , 10^5],'k--');
title('ROV throughput');
xlabel('ROV period [s]');
ylabel('ROV throughput [bit/s]');
axis([1 60 0 250]);
legend('Position Based Routing(TDMA FRAME)','Position Based Routing(TDMA PIPELINE)',...
        'Flooding(TDMA FRAME)');
    
if save_flag == 1
    savefig(['PosBasedRouting/',dir,'/comparison/ROV_thr.fig']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/ROV_thr.png']);
    saveas(gcf,['PosBasedRouting/',dir,'/comparison/ROV_thr'],'epsc');
end
    