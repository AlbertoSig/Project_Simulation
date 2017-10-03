clear;

N_nodes = 6;
N_slots = 7;
queue = zeros(N_nodes,10); %riga i = coda nodo i
index = ones(N_nodes,1); %riga i = indice coda i;

v1 = [1;0;0;1;0;0];
v2 = [0;0;0;1;0;0];
v3 = [0;1;0;0;1;0];
v4 = [0;1;0;0;1;0];
v5 = [0;0;1;0;0;0];
v6 = [0;0;1;0;0;0];
v7 = [0;0;0;0;0;1];

m = [v1,v2,v3,v4,v5,v6,v7];

N_iteration = 10*factorial(N_slots);

rand_index = randsample(N_slots,N_slots);
y = m(:,rand_index);
%csvwrite('dbs/tdma_frame_matrix/matlab_matrix.dat',y);
csvwrite('gen_matrix.dat',y);

