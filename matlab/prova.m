clear;
f = 25;
B = 5;
k = 1.5;
d = 3;
s = 0.5;
w= 0;
    P_dB = 181;
    P = 10^(P_dB/10);

delta = 0.01;
freq = 22.5:delta:27.5;
i = 0;
dist = 0.3:0.1:100;
f_0 = zeros(1,length(dist));
B = zeros(1,length(dist));
P = zeros(1,length(dist));
C = zeros(1,length(dist));
for d=dist
    i = i+1;
    [f_min,f_max,f_0(i),P_3,C_3] = BW_3dB(d);
    B(i) = f_max - f_min;
    P(i) = P_3;
    C(i) = C_3;
end
figure();
plot(dist,f_0);
ylabel('optimal frequency  [kHz]');
grid on;
figure();
semilogy(dist,B);
ylabel('bandwith  [kHz]');
grid on;
figure();
plot(dist,10*log10(P));
ylabel('power');
grid on;
figure();
semilogy(dist,C);
ylabel('capacity [kbps]');
grid on;

% for f = freq
%     i = i+1;
%     a_dB = 0.11*f^2/(1+f^2) + 44*f^2/(4100+f)+f^2*2.75*10^(-4)+0.003;
%     a = 10^(a_dB/10);
% 
%     
%     N_t_dB= 17 - 30*log10(f);
%     N_t = 10^(N_t_dB/10);
%     N_s_dB = 40 + 20*(s-0.5) + 26*log10(f) - 60*log10(f+0.03);
%     N_s = 10^(N_s_dB/10);
%     N_w_dB = 50 + 7.5*w^0.5 + 20*log10(f) - 40*log10(f+0.4);
%     N_w = 10^(N_w_dB/10);
%     N_th_dB = -15 + 20*log10(25);
%     N_th = 10^(N_th_dB/10);
%     N = N_t+N_th+N_s+N_w;
%     %N = 10^(N_dB/10);
% %     
% %     A_dB = k*log10(d*100) + d*log10(a_dB);
% %     A2 = 10^(A_dB/10);
%     A = (d*1000)^k * a^(d);
% 
%     
%     snr_dB(i) = 10*log10(P/(A*N*length(freq)));
%     snr(i) = P/(A*N*B);
% end
% figure(1);
% plot(freq,snr_dB)
% hold on
% axis([22.5 27.5 -170 -70]);
% B = 5000;
% c = delta*sum(log2(1+snr));