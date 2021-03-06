function [f_min,f_max,f_0,P,C] = BW_3dB(d) %d = distance in Km

k = 1.5;
s = 0.5;
w= 0;
delta = 0.1;
freq = 0.1:delta:100; %KHz
snr= zeros(1,length(freq));
i = 0;
N = zeros(1,length(freq));
A = zeros(1,length(freq));
for f = freq
    i = i+1;
    a_dB = 0.11*f^2/(1+f^2) + 44*f^2/(4100+f)+f^2*2.75*10^(-4)+0.003;
    a = 10^(a_dB/10);
    
    
    N_t_dB= 17 - 30*log10(f);
    N_t = 10^(N_t_dB/10);
    N_s_dB = 40 + 20*(s-0.5) + 26*log10(f) - 60*log10(f+0.03);
    N_s = 10^(N_s_dB/10);
    N_w_dB = 50 + 7.5*w^0.5 + 20*log10(f) - 40*log10(f+0.4);
    N_w = 10^(N_w_dB/10);
    N_th_dB = -15 + 20*log10(25);
    N_th = 10^(N_th_dB/10);
    N(i) = N_t+N_th+N_s+N_w;
    %N = 10^(N_dB/10);
    %
    %     A_dB = k*log10(d*100) + d*log10(a_dB);
    %     A2 = 10^(A_dB/10);
    A(i) = (d*1000)^k * a^(d);
    
    snr(i) = 1/(A(i)*N(i));
    
end

%figure()
% plot(freq,10*log10(snr));
% grid on
[snr_0,index] = max(snr);
f_0 = freq(index);
index_Bw = find(snr > snr_0/2);
f_min = freq(index_Bw(1));
f_max = freq(index_Bw(end));
B = f_max-f_min;
P = B*100*sum(N(index_Bw(1):index_Bw(end)))/sum(1./A(index_Bw(1):index_Bw(end)));
C = sum(log2(1+P./(B.*A(index_Bw(1):index_Bw(end)).*N(index_Bw(1):index_Bw(end)))));