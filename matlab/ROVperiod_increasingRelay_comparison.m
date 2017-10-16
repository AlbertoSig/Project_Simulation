 clear;
range = 1:1:60;
dir = '';
load(['simTesi/staticRT/TDMAframe1relay/figure/path.mat']);
save_flag =0;

%rmse
figure(1);
plot(range, adap_rmse,'-r*','MarkerSize',5);
grid on;
hold on;
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-r*','MarkerSize',5);
grid on;
hold on;

axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-r*','MarkerSize',5);
grid on;
hold on;

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

title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-r*','MarkerSize',5);
grid on;
hold on;

title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
axis([1 60 0 800]);
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-r*','MarkerSize',5);
grid on;
hold on;

title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');

axis([1 60 0 750]);
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-r*','MarkerSize',5);
grid on;
hold on;
title('ROV throughput');
xlabel('ROV period [s]');
ylabel('ROV throughput [bit/s]');
axis([1 60 0 450]);

%2 Relay
load(['simTesi/staticRT/TDMApipeline2relay/figure/path.mat']);

%rmse
figure(1);
plot(range, adap_rmse,'-b.','MarkerSize',12);
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-b.','MarkerSize',12);

axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('ROV packet delivery ratio');
%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-b.','MarkerSize',12);
grid on;
hold on;

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

title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('Packet delivery delay [s]');
%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-b.','MarkerSize',12);
grid on;
hold on;

title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('CTR packet delivery delay [s]');
axis([1 60 0 800]);
%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-b.','MarkerSize',12);
grid on;
hold on;

title('CTR throughput');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');
axis([1 60 0 750]);
%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-b.','MarkerSize',12);
grid on;
hold on;

title('ROV throughput');
xlabel('ROV period [s]');
ylabel('ROV throughput [bit/s]');
axis([1 60 0 450]);


%3 realay
load(['simTesi/staticRT/TDMApropDelay3relay/figure/path.mat']);

%rmse
figure(1);
plot(range, adap_rmse,'-mx','MarkerSize',8);
title('RMSE');
xlabel('ROV period [s]');
ylabel('RMSE');
axis([1 60 0 4]);
legend('rmse 1 relay','rmse 2 relays','rmse 3 relays');
if save_flag == 1
    savefig(['simTesi/staticRT/',dir,'/comparison/rmse.fig']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/rmse.png']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/rmse'],'epsc');
end



%ROV packet delivery ratio
figure(2)
plot(range, adap_ROV_pdr,'-mx','MarkerSize',8);
axis([1 60 0 1]);
title('ROV packet delivery ratio');
xlabel('ROV period [s]');
ylabel('Packet delivery ratio');
legend('1 relay', '2 relays', '3 relays','Location','east');
if save_flag == 1
    savefig(['simTesi/staticRT/',dir,'/comparison/ROV_pdr.fig']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/ROV_pdr.png']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/ROV_pdr'],'epsc');
end

%CTR packet delivery ratio
figure(3)
plot(range, adap_CTR_pdr,'-mx','MarkerSize',8);
grid on;
hold on;
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('ROV period [s]');
ylabel('Packet delivery ratio');
legend('1 relay', '2 relays', '3 relays','Location','east');
if save_flag == 1
    savefig(['simTesi/staticRT/',dir,'/comparison/CTR_pdr.fig']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/CTR_pdr.png']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/CTR_pdr'],'epsc');
end

%ROV packet delivry delay
figure(4);
semilogy(range, adap_ROV_pdd,'-mx','MarkerSize',8);
axis([1 60 1 10^2]);
grid on;
hold on;
title('ROV packet delivery delay');
xlabel('ROV period [s]');
ylabel('Packet delivery delay [s]');
legend('1 relay', '2 relays', '3 relays','Location','east');
if save_flag == 1
    savefig(['simTesi/staticRT/',dir,'/comparison/ROV_pdd.fig']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/ROV_pdd.png']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/ROV_pdd'],'epsc');
end

%CTR packet delivery delay
figure(5)
semilogy(range, adap_CTR_pdd,'-mx','MarkerSize',8);
grid on;
hold on;
title('CTR packet delivery delay');
xlabel('ROV period [s]');
ylabel('Packet delivery delay [s]');
legend('1 relay',' 2 relays','3 relays');
axis([1 60 1 10^2]);
if save_flag == 1
    savefig(['simTesi/staticRT/',dir,'/comparison/CTR_pdd.fig']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/CTR_pdd.png']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/CTR_pdd'],'epsc');
end


%CTR throughput
figure(6)
plot(range, adap_CTR_th,'-mx','MarkerSize',8);
grid on;
hold on;
title('CTR throughput [bit/s]');
xlabel('ROV period [s]');
ylabel('CTR throughput [bit/s]');
legend('1 relay',' 2 relays','3 relays');
axis([1 60 0 700]);
if save_flag == 1
    savefig(['simTesi/staticRT/',dir,'/comparison/CTR_thr.fig']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/CTR_thr.png']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/CTR_thr'],'epsc');
end

%ROV throughput
figure(7)
plot(range, adap_ROV_th,'-mx','MarkerSize',8);
grid on;
hold on;
title('ROV throughput [bit/s]');
xlabel('ROV period [s]');
ylabel('ROV throughput [bit/s]');
legend('1 relay',' 2 relays','3 relays');
axis([1 60 0 150]);

if save_flag == 1
    savefig(['simTesi/staticRT/',dir,'/comparison/ROV_thr.fig']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/ROV_thr.png']);
    saveas(gcf,['simTesi/staticRT/',dir,'/comparison/ROV_thr'],'epsc');
end