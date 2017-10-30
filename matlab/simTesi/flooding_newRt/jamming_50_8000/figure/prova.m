range = 1:60;
save_flag = 0;
%CTR packet delivery ratio
figure();
plot(range, adap_CTR_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
axis([1 60 0 1]);
title('CTR packet delivery ratio');
xlabel('AUV period [s]');
ylabel('Packet delivery ratio');
legend('CTR packet delivery ratio','Location','east');
if save_flag == 1
    savefig(['simTesi/flooding_newRt/figure/',dir,'CTR_pdr.fig']);
    saveas(gcf,['simTesi/flooding_newRt/figure/',dir,'CTR_pdr.png']);
    saveas(gcf,['simTesi/flooding_newRt/figure/',dir,'CTR_pdr.eps'],'epsc');
end



%ROV packet delivery ratio
figure();
plot(range, adap_ROV_pdr,'-r*','MarkerSize',5);
grid on;
hold on;
axis([1 60 0 1]);
title('AUV packet delivery ratio');
xlabel('AUV period [s]');
ylabel('Packet delivery ratio');
legend('ROV packet delivery ratio','Location','east');
if save_flag == 1
    savefig(['simTesi/flooding_newRt/figure/',dir,'ROV_pdr.fig']);
    saveas(gcf,['simTesi/flooding_newRt/figure/',dir,'ROV_pdr.png']);
    saveas(gcf,['simTesi/flooding_newRt/figure/',dir,'ROV_pdr.eps'],'epsc');
end
