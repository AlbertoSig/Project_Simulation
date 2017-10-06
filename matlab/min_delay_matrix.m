% clear;
% N_slots = 7;
% N_nodes = 6;
% N_iterations = 5*factorial(N_slots);
% CTR_del = zeros(1,N_iterations);
% ROV_del = zeros(1,N_iterations);
% TDMA_matrices = zeros(N_nodes,N_slots,N_iterations);
% for i=1:N_iterations
%    TDMA_matrices(:,:,i) = importdata(['bruteForceAlg/matlab_matrix',int2str(i),'.dat']);
%    CTR_del(i) = importdata(['bruteForceAlg/CTR_del',int2str(i),'.txt']);
%    ROV_del(i) = importdata(['bruteForceAlg/ROV_del',int2str(i),'.txt']);
% end
% sum_del = CTR_del + ROV_del;

load('delay_matrix_newSlotDuration.mat');
[min_del_ROV,index_ROV] = min(ROV_del);
[min_del_CTR,index_CTR] = min(CTR_del);
[min_del_sum,index_sum] = min(sum_del);

matr_min_sum = TDMA_matrices(:,:,index_sum);
matr_min_ROV = TDMA_matrices(:,:,index_ROV);
matr_min_CTR = TDMA_matrices(:,:,index_CTR);

