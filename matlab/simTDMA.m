clear;

N_nodes = 6;
N_slots = 7;
queue = zeros(N_nodes,10); %riga i = coda nodo i
index = ones(N_nodes,1); %riga i = indice coda i;

i = 0;
slot = 0;
rx_ROV = zeros(1,10); %pacchetti del ROV ricevuti dal CTR
rx_ROV_index = 1;
tx_ROV = zeros(1,10); %pacchetti trasmessi dal ROV
tx_ROV_index = 1;

rx_CTR = zeros(1,10); %pacchetti del CTR ricevuti dal ROV
rx_CTR_index = 1;
tx_CTR = zeros(1,10); %pacchetti trasmessi dal CTR
tx_CTR_index = 1;


v1 = [1;0;0;1;0;0];
v2 = [0;0;0;1;0;0];
v3 = [0;1;0;0;1;0];
v4 = [0;1;0;0;1;0];
v5 = [0;0;1;0;0;0];
v6 = [0;0;1;0;0;0];
v7 = [0;0;0;0;0;1];

m = [v1,v2,v3,v4,v5,v6,v7];

MAX_packet_sent = 100;
packet_sent = 0;

N_iteration = 2*7*6*5*4*3*2;

[row,column] = size(m);
rand_matrix = zeros(row,column,N_iteration);
average_ROV_delay = zeros(1,N_iteration);
average_CTR_delay = zeros(1,N_iteration);

for j=1:N_iteration
    %estrazione matrice
    y = datasample(m,N_slots,2,'Replace',false);
    
    queue = zeros(N_nodes,10); %riga i = coda nodo i
    index = ones(N_nodes,1); %riga i = indice coda i;
    
    packet_sent = 0;
    i = 0;
    slot = 0;
    rx_ROV = zeros(1,10); %pacchetti del ROV ricevuti dal CTR
    rx_ROV_index = 1;
    tx_ROV = zeros(1,10); %pacchetti trasmessi dal ROV
    tx_ROV_index = 1;

    rx_CTR = zeros(1,10); %pacchetti del CTR ricevuti dal ROV
    rx_CTR_index = 1;
    tx_CTR = zeros(1,10); %pacchetti trasmessi dal CTR
    tx_CTR_index = 1;
    
    %y = [v1,v3,v5,v6,v2,v4,v7];
    while packet_sent < MAX_packet_sent
        for k=1:N_slots
            slot = slot + 1;
            index_matrix = find(y(:,k) == 1);
            for n=1:length(index_matrix)
                
                node = index_matrix(n);
                
                if node == 1 %trasmette il CTR
                    queue(node,1) = 1;
                    index(node) = index(node) + 1;
                    
                    if queue(node,1) == 1
                        queue(node,1:end-1) = queue(node,2:end);
                        index(node) = index(node) - 1;
                        queue(node+1, index(node+1)) = 1;
                        index(node+1) = index(node +1) + 1;
                        tx_CTR(tx_CTR_index) = slot;
                        tx_CTR_index = tx_CTR_index + 1;
                    end
                else
                    if node == N_nodes %trasmette il ROV
                        queue(node,1) = 2;
                        index(node) = index(node) + 1;
                        
                        if queue(node,1) == 2
                            queue(node,1:end-1) = queue(node,2:end);
                            index(node) = index(node) - 1;
                            queue(node-1, index(node-1)) = 2;
                            index(node-1) = index(node -1) + 1;
                            tx_ROV(tx_ROV_index) = slot;
                            tx_ROV_index = tx_ROV_index + 1;
                        end
                    else %trasmette un nodo intermedio
                        %%devo diversificare se sono i due relay estremi oppure
                        %%no
                        if node == 2 %relay 1
                            if queue(node,1) == 1 %trasmetto verso R2
                                queue(node,1:end-1) = queue(node,2:end);
                                index(node) = index(node) -1;
                                queue(node+1,index(node+1)) = 1;
                                index(node + 1) = index(node +1) + 1;
                            else
                                if queue(node,1) == 2 %pacchetto trasmesso verso CTR
                                    queue(node,1:end-1) = queue(node,2:end);
                                    index(node) = index(node) -1;
                                    rx_ROV(rx_ROV_index) = slot;
                                    rx_ROV_index = rx_ROV_index + 1;
                                end
                            end
                            
                        else
                            if node == N_nodes -1 %ultimo relay
                                if queue(node,1) == 1 %trasmetto verso ROV
                                    queue(node,1:end-1) = queue(node,2:end);
                                    index(node) = index(node) -1;
                                    rx_CTR(rx_CTR_index) = slot;
                                    rx_CTR_index = rx_CTR_index + 1;
                                else
                                    if queue(node,1) == 2 %pacchetto trasmesso verso CTR
                                        queue(node,1:end-1) = queue(node,2:end);
                                        index(node) = index(node) -1;
                                        queue(node-1,index(node-1)) = 2;
                                        index(node - 1) = index(node -1) + 1;
                                    end
                                end
                            else %relay qualsiasi
                                if queue(node,1) == 1 %trasmetto verso ROV
                                    queue(node,1:end-1) = queue(node,2:end);
                                    index(node) = index(node) -1;
                                    queue(node+1,index(node+1)) = 1;
                                    index(node + 1) = index(node +1) + 1;
                                else
                                    if queue(node,1) == 2 %pacchetto trasmesso verso CTR
                                        queue(node,1:end-1) = queue(node,2:end);
                                        index(node) = index(node) -1;
                                        queue(node-1,index(node-1)) = 2;
                                        index(node - 1) = index(node -1) + 1;
                                    end
                                end
                            end
                        end
                    end
                end
            end %fine FOR su index
        end
        packet_sent = packet_sent + 1;
    end %end while
    average_ROV_delay(j) = sum(rx_ROV(1:rx_ROV_index-1) - tx_ROV(1:rx_ROV_index-1)+1)/(rx_ROV_index-1);
    average_CTR_delay(j) = sum(rx_CTR(1:rx_CTR_index-1) - tx_CTR(1:rx_CTR_index-1)+1)/(rx_CTR_index-1);
    rand_matrix(:,:,j) = y;

end

[min_CTR,min_CTR_index] = min(average_CTR_delay);
min_CTR_matrix = rand_matrix(:,:,min_CTR_index);
[min_ROV,min_ROV_index] = min(average_ROV_delay);
min_ROV_matrix = rand_matrix(:,:,min_ROV_index);
[min_sum,min_sum_index] = min(average_ROV_delay+average_CTR_delay);
min_sum_matrix = rand_matrix(:,:,min_sum_index);


