T_slot = 4;
N_slot = 7;
T_frame = T_slot * N_slot;
lambda = 1./(1:60);
P = zeros(3,3,60);
for i=1:60
    P(1,1,i) = exp(-lambda(i)*T_frame);
    P(1,2,i) = lambda(i)*T_frame*exp(-lambda(i)*T_frame);
    P(1,3,i) = 1-P(1,1,i)-P(1,2,i);
    P(2,1,i) = exp(-lambda(i)*T_frame);
    P(2,2,i) = lambda(i)*T_frame*exp(-lambda(i)*T_frame);
    P(2,3,i) = 1-P(2,1,i)-P(2,2,i);
    P(3,1,i) = 0;
    P(3,2,i) = exp(-lambda(i)*T_frame);
    P(3,3,i) = 1 - P(3,2,i);
end
Q = P;
for i=1:60
    for j = 1:100
        Q(:,:,i) = Q(:,:,i)*P(:,:,i);
    end
end
pi = zeros(60,3);
for i = 1:60
    pi(i,:) = Q(1,:,i);
end