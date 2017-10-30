clear;
range = 1:60;
dir = '3';
save_flag = 1;

%TDMA
load(['TDMA',dir,'relay(new)30-10-17/figure/path.mat']);

%rmse
figure(1);
semilogy(range, adap_rmse,'-r*','MarkerSize',5);
grid on;
hold on;
axis([1 60 10^-3 10^4]);
title('RMSE');
xlabel('AUV period [s]');
ylabel('RMSE');

%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
title('AUV packet delivery ratio');
xlabel('AUV period [s]');
ylabel('Packet delivery ratio');
axis([1 60 0 1]);
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
title('CTR packet delivery ratio');
xlabel('AUV period [s]');
ylabel('Packet delivery ratio');
axis([1 60 0 1]);
%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-r*','MarkerSize',5);
grid on;
hold on;
axis([1 60 1 10^4]);
title('AUV packet delivery delay');
xlabel('AUV period [s]');
ylabel('Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-r*','MarkerSize',5);
grid on;
hold on;
axis([1 60 1 10^4]);
title('CTR packet delivery delay');
xlabel('AUV period [s]');
ylabel('Packet delivery delay [s]');
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-r*','MarkerSize',5);
grid on;
hold on;
axis([1 60 0 750]);
title('CTR throughput');
xlabel('AUV period [s]');
ylabel('CTR throughput [bit/s]');
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-r*','MarkerSize',5);
grid on;
hold on;
axis([1 60 0 100]);
title('AUV throughput');
xlabel('AUV period [s]');
ylabel('AUV throughput [bit/s]');

%TDMA FRAME
load(['TDMAframe',dir,'relay/figure/path.mat']);

%rmse
figure(1);
plot(range, adap_rmse,'-bo','MarkerSize',4.5,'MarkerFaceColor','b');
axis([1 60 10^-3 10^4]);
title('RMSE');
xlabel('AUV period [s]');
ylabel('RMSE');
if strcmp(dir,'1')
    legend('TDMA','TDMA FRAME');
end
if (save_flag == 1 && strcmp(dir,'1'))
    savefig(['comparison/rmse_',dir,'Relay.fig']);
    saveas(gcf,['comparison/rmse_',dir,'Relay.png']);
    saveas(gcf,['comparison/rmse_',dir,'Relay'],'epsc');
end
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-bo','MarkerSize',4.5,'MarkerFaceColor','b');

if strcmp(dir,'1')
    legend('TDMA','TDMA FRAME','Location','east');
end
if (save_flag == 1 && strcmp(dir,'1'))
    savefig(['comparison/ROV_pdr_',dir,'Relay.fig']);
    saveas(gcf,['comparison/ROV_pdr_',dir,'Relay.png']);
    saveas(gcf,['comparison/ROV_pdr_',dir,'Relay'],'epsc');
end

%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-bo','MarkerSize',4.5,'MarkerFaceColor','b');
grid on;
hold on;
if strcmp(dir,'1')
    legend('TDMA','TDMA FRAME','Location','east');
end
if (save_flag == 1 && strcmp(dir,'1'))
    savefig(['comparison/CTR_pdr_',dir,'Relay.fig']);
    saveas(gcf,['comparison/CTR_pdr_',dir,'Relay.png']);
    saveas(gcf,['comparison/CTR_pdr_',dir,'Relay'],'epsc');
end
%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-bo','MarkerSize',4.5,'MarkerFaceColor','b');
axis([1 60 1 10^4]);
grid on;
hold on;
if strcmp(dir,'1')
    legend('TDMA','TDMA FRAME');
end
if (save_flag == 1 && strcmp(dir,'1'))
    savefig(['comparison/ROV_pdd_',dir,'Relay.fig']);
    saveas(gcf,['comparison/ROV_pdd_',dir,'Relay.png']);
    saveas(gcf,['comparison/ROV_pdd_',dir,'Relay'],'epsc');
end
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-bo','MarkerSize',4.5,'MarkerFaceColor','b');
axis([1 60 1 10^4]);
grid on;
hold on;
if strcmp(dir,'1')
    legend('TDMA','TDMA FRAME');
end
if (save_flag == 1 && strcmp(dir,'1'))
    savefig(['comparison/CTR_pdd_',dir,'Relay.fig']);
    saveas(gcf,['comparison/CTR_pdd_',dir,'Relay.png']);
    saveas(gcf,['comparison/CTR_pdd_',dir,'Relay'],'epsc');
end
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-bo','MarkerSize',4.5,'MarkerFaceColor','b');
axis([1 60 0 700]);
grid on;
hold on;
if strcmp(dir,'1')
    legend('TDMA','TDMA FRAME');
end
if (save_flag == 1 && strcmp(dir,'1'))
    savefig(['comparison/CTR_thr_',dir,'Relay.fig']);
    saveas(gcf,['comparison/CTR_thr_',dir,'Relay.png']);
    saveas(gcf,['comparison/CTR_thr_',dir,'Relay'],'epsc');
end
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-bo','MarkerSize',4.5,'MarkerFaceColor','b');
axis([1 60 0 100]);
grid on;
hold on;
if strcmp(dir,'1')
    legend('TDMA','TDMA FRAME');
end
if (save_flag == 1 && strcmp(dir,'1'))
    savefig(['comparison/ROV_thr_',dir,'Relay.fig']);
    saveas(gcf,['comparison/ROV_thr_',dir,'Relay.png']);
    saveas(gcf,['comparison/ROV_thr_',dir,'Relay'],'epsc');
end



if (strcmp(dir,'2') || strcmp(dir,'3'))
    load(['TDMApipeline',dir,'relay/figure/path.mat']);
    
    %rmse
    figure(1);
    plot(range, adap_rmse,'-g^','MarkerSize',4,'MarkerFaceColor','g');
    title('RMSE');
    xlabel('AUV period [s]');
    ylabel('RMSE');
    if strcmp(dir,'2')
        legend('TDMA','TDMA FRAME','TDMA PIPELINE');
    end
    if (save_flag == 1 && strcmp(dir,'2'))
        savefig(['comparison/rmse_',dir,'Relay.fig']);
        saveas(gcf,['comparison/rmse_',dir,'Relay.png']);
        saveas(gcf,['comparison/rmse_',dir,'Relay'],'epsc');
    end
    
    
    
    %ROV packet delivery ratio
    figure(2)
    plot(range, adap_ROV_pdr,'-g^','MarkerSize',4,'MarkerFaceColor','g');
    title('AUV packet delivery ratio');
    xlabel('AUV period [s]');
    ylabel('Packet delivery ratio');
    if strcmp(dir,'2')
        legend('TDMA','TDMA FRAME','TDMA PIPELINE','Location','east');
    end
    if (save_flag == 1 && strcmp(dir,'2'))
        savefig(['comparison/ROV_pdr_',dir,'Relay.fig']);
        saveas(gcf,['comparison/ROV_pdr_',dir,'Relay.png']);
        saveas(gcf,['comparison/ROV_pdr_',dir,'Relay'],'epsc');
    end
    
    %CTR packet delivery ratio
    figure(3)
    plot(range, adap_CTR_pdr,'-g^','MarkerSize',4,'MarkerFaceColor','g');
    grid on;
    hold on;
    title('CTR packet delivery ratio');
    xlabel('AUV period [s]');
    ylabel('Packet delivery ratio');
    if strcmp(dir,'2')
        legend('TDMA','TDMA FRAME','TDMA PIPELINE','Location','east');
    end
    if (save_flag == 1 && strcmp(dir,'2'))
        savefig(['comparison/CTR_pdr_',dir,'Relay.fig']);
        saveas(gcf,['comparison/CTR_pdr_',dir,'Relay.png']);
        saveas(gcf,['comparison/CTR_pdr_',dir,'Relay'],'epsc');
    end
    
    %ROV packet delivry delay
    figure(4);
    semilogy(range, adap_ROV_pdd,'-g^','MarkerSize',4,'MarkerFaceColor','g');
    grid on;
    hold on;
    title('AUV packet delivery delay');
    xlabel('AUV period [s]');
    ylabel('Packet delivery delay [s]');
    if strcmp(dir,'2')
        legend('TDMA','TDMA FRAME','TDMA PIPELINE');
    end
    if (save_flag == 1 && strcmp(dir,'2'))
        savefig(['comparison/ROV_pdd_',dir,'Relay.fig']);
        saveas(gcf,['comparison/ROV_pdd_',dir,'Relay.png']);
        saveas(gcf,['comparison/ROV_pdd_',dir,'Relay'],'epsc');
    end
    
    %CTR packet delivery delay
    figure(5)
    semilogy(range, adap_CTR_pdd,'-g^','MarkerSize',4,'MarkerFaceColor','g');
    grid on;
    hold on;
    title('CTR packet delivery delay');
    xlabel('AUV period [s]');
    ylabel('Packet delivery delay [s]');
    if strcmp(dir,'2')
        legend('TDMA','TDMA FRAME','TDMA PIPELINE');
    end

    if (save_flag == 1 && strcmp(dir,'2'))
        savefig(['comparison/CTR_pdd_',dir,'Relay.fig']);
        saveas(gcf,['comparison/CTR_pdd_',dir,'Relay.png']);
        saveas(gcf,['comparison/CTR_pdd_',dir,'Relay'],'epsc');
    end
    
    
    %CTR throughput
    figure(6)
    plot(range, adap_CTR_th,'-g^','MarkerSize',4,'MarkerFaceColor','g');
    grid on;
    hold on;
    title('CTR throughput');
    xlabel('AUV period [s]');
    ylabel('CTR throughput [bit/s]');
    if strcmp(dir,'2')
        legend('TDMA','TDMA FRAME','TDMA PIPELINE');
    end
    if (save_flag == 1 && strcmp(dir,'2'))
        savefig(['comparison/CTR_thr_',dir,'Relay.fig']);
        saveas(gcf,['comparison/CTR_thr_',dir,'Relay.png']);
        saveas(gcf,['comparison/CTR_thr_',dir,'Relay'],'epsc');
    end
    
    %ROV throughput
    figure(7)
    plot(range, adap_ROV_th,'-g^','MarkerSize',4,'MarkerFaceColor','g');
    grid on;
    hold on;
    title('AUV throughput');
    xlabel('AUV period [s]');
    ylabel('AUV throughput [bit/s]');
    if strcmp(dir,'2')
        legend('TDMA','TDMA FRAME','TDMA PIPELINE');
    end
    
    if (save_flag == 1 && strcmp(dir,'2'))
        savefig(['comparison/ROV_thr_',dir,'Relay.fig']);
        saveas(gcf,['comparison/ROV_thr_',dir,'Relay.png']);
        saveas(gcf,['comparison/ROV_thr_',dir,'Relay'],'epsc');
    end
end


if strcmp(dir,'3')
    
    load(['TDMApropDelay',dir,'relay/figure/path.mat']);
    
    %rmse
    figure(1);
    plot(range, adap_rmse,'-mx','MarkerSize',8);
    title('RMSE');
    xlabel('AUV period [s]');
    ylabel('RMSE');
    legend('TDMA','TDMA FRAME','TDMA PIPELINE','TDMA PROPAGATION DELAY');
    if (save_flag == 1 && strcmp(dir,'3'))
        savefig(['comparison/rmse_',dir,'Relay.fig']);
        saveas(gcf,['comparison/rmse_',dir,'Relay.png']);
        saveas(gcf,['comparison/rmse_',dir,'Relay'],'epsc');
    end
    
    
    
    %ROV packet delivery ratio
    figure(2)
    plot(range, adap_ROV_pdr,'-mx','MarkerSize',8);
    title('AUV packet delivery ratio');
    xlabel('AUV period [s]');
    ylabel('Packet delivery ratio');
    legend('TDMA','TDMA FRAME','TDMA PIPELINE','TDMA PROPAGATION DELAY','Location','east');
    if (save_flag == 1 && strcmp(dir,'3'))
        savefig(['comparison/ROV_pdr_',dir,'Relay.fig']);
        saveas(gcf,['comparison/ROV_pdr_',dir,'Relay.png']);
        saveas(gcf,['comparison/ROV_pdr_',dir,'Relay'],'epsc');
    end
    
    %CTR packet delivery ratio
    figure(3)
    plot(range, adap_CTR_pdr,'-mx','MarkerSize',8);
    grid on;
    hold on;
    title('CTR packet delivery ratio');
    xlabel('AUV period [s]');
    ylabel('Packet delivery ratio');
    legend('TDMA','TDMA FRAME','TDMA PIPELINE','TDMA PROPAGATION DELAY','Location','east');
    if (save_flag == 1 && strcmp(dir,'3'))
        savefig(['comparison/CTR_pdr_',dir,'Relay.fig']);
        saveas(gcf,['comparison/CTR_pdr_',dir,'Relay.png']);
        saveas(gcf,['comparison/CTR_pdr_',dir,'Relay'],'epsc');
    end
    
    %ROV packet delivry delay
    figure(4);
    semilogy(range, adap_ROV_pdd,'-mx','MarkerSize',8);
    grid on;
    hold on;
    title('ROV packet delivery delay');
    xlabel('AUV period [s]');
    ylabel('Packet delivery delay [s]');
    legend('TDMA','TDMA FRAME','TDMA PIPELINE','TDMA PROPAGATION DELAY');
    if (save_flag == 1 && strcmp(dir,'3'))
        savefig(['comparison/ROV_pdd_',dir,'Relay.fig']);
        saveas(gcf,['comparison/ROV_pdd_',dir,'Relay.png']);
        saveas(gcf,['comparison/ROV_pdd_',dir,'Relay'],'epsc');
    end
    
    %CTR packet delivery delay
    figure(5)
    semilogy(range, adap_CTR_pdd,'-mx','MarkerSize',8);
    grid on;
    hold on;
    title('CTR packet delivery delay');
    xlabel('AUV period [s]');
    ylabel('Packet delivery delay [s]');
    legend('TDMA','TDMA FRAME','TDMA PIPELINE','TDMA PROPAGATION DELAY');
    if (save_flag == 1 && strcmp(dir,'3'))
        savefig(['comparison/CTR_pdd_',dir,'Relay.fig']);
        saveas(gcf,['comparison/CTR_pdd_',dir,'Relay.png']);
        saveas(gcf,['comparison/CTR_pdd_',dir,'Relay'],'epsc');
    end
    
    
    %CTR throughput
    figure(6)
    plot(range, adap_CTR_th,'-mx','MarkerSize',8);
    grid on;
    hold on;
    title('CTR throughput');
    xlabel('AUV period [s]');
    ylabel('CTR throughput [bit/s]');
    legend('TDMA','TDMA FRAME','TDMA PIPELINE','TDMA PROPAGATION DELAY');
    if (save_flag == 1 && strcmp(dir,'3'))
        savefig(['comparison/CTR_thr_',dir,'Relay.fig']);
        saveas(gcf,['comparison/CTR_thr_',dir,'Relay.png']);
        saveas(gcf,['comparison/CTR_thr_',dir,'Relay'],'epsc');
    end
    
    %ROV throughput
    figure(7)
    plot(range, adap_ROV_th,'-mx','MarkerSize',8);
    grid on;
    hold on;
    title('AUV throughput');
    xlabel('AUV period [s]');
    ylabel('AUV throughput [bit/s]');
    legend('TDMA','TDMA FRAME','TDMA PIPELINE','TDMA PROPAGATION DELAY');
    
    if (save_flag == 1 && strcmp(dir,'3'))
        savefig(['comparison/ROV_thr_',dir,'Relay.fig']);
        saveas(gcf,['comparison/ROV_thr_',dir,'Relay.png']);
        saveas(gcf,['comparison/ROV_thr_',dir,'Relay'],'epsc');
    end
end

