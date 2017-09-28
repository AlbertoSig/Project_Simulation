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

MAX_iteration = 3;
iteration = 0;

for j=1:2
    %estrazione matrice
    
    %y = datasample(m,N_slot,2,'Replace',false);
    
    y = [v1,v3,v5,v6,v2,v4,v7];
    while iteration < MAX_iteration
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
                                    rx_CTR(rx_CTR_index) = slot;
                                    rx_CTR_index = rx_CTR_index + 1;
                                end
                            end
                            
                        else
                            if node == N_nodes -1 %ultimo relay
                                if queue(node,1) == 1 %trasmetto verso ROV
                                    queue(node,1:end-1) = queue(node,2:end);
                                    index(node) = index(node) -1;
                                    rx_ROV(rx_ROV_index) = slot;
                                    rx_ROV_index = rx_ROV_index + 1;
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
        iteration = iteration + 1;
    end %end while
    
end
average_ROV_delay = sum(rx_ROV(1:rx_ROV_index-1) - tx_ROV(1:rx_ROV_index-1))/(rx_ROV_index-1);
average_CTR_delay = sum(rx_CTR(1:rx_CTR_index-1) - tx_CTR(1:rx_CTR_index-1))/(rx_CTR_index-1);





% %%pacchetto CTR = 1, pacchetto ROV = 2;
%             while i < 100
%                 %genero ROV
%                 ROV(index_ROV) = 2;
%                 index_ROV = index_ROV + 1;
%
%                 %trasmetto ROV
%                 slot = slot + 1;
%                 if ROV(1) == 2
%                     ROV(1:end-1) = ROV(2:end);
%                     index_ROV = index_ROV -1;
%                     R4(index_R4) = 2;
%                     index_R4 = index_R4 + 1;
%                     tx_ROV(tx_ROV_index) = slot;
%                     tx_ROV_index = tx_ROV_index + 1;
%                 end
%
%                 %genero CTR
%                 CTR(index_CTR) = 1;
%                 index_CTR = index_CTR + 1;
%                 %trasmetto CTR e R3
%                 slot = slot + 1;
%                 if CTR(1) == 1
%                     CTR(1:end-1) = CTR(2:end);
%                     index_CTR = index_CTR - 1;
%                     R1(index_R1) = 1;
%                     index_R1 = index_R1 + 1;
%                     tx_CTR(tx_CTR_index) = slot;
%                     tx_CTR_index = tx_CTR_index + 1;
%                 end
%                 if R3(1) == 1 %trasmetto pacchetto CTR verso R4
%                     R3(1:end-1) = R3(2:end);
%                     index_R3 = index_R3 -1;
%                     R4(index_R4) = 1;
%                     index_R4 = index_R4 +1;
%                 else
%                     if R3(1) == 2 %pacchetto trasmesso verso R2
%                         R3(1:end-1) = R3(2:end);
%                         index_R3 = index_R3 -1;
%                         R2(index_R2) = 2;
%                         index_R2 = index_R2 + 1;
%                     end
%                 end
%
%                 %trasmetto R1 e R4
%                 slot = slot + 1;
%                 if R4(1) == 1 %trasmetto pacchetto R4 verso ROV
%                     R4(1:end-1) = R4(2:end);
%                     index_R4 = index_R4 -1;
%                     rx_CTR(rx_CTR_index) = slot;
%                     rx_CTR_index = rx_CTR_index + 1;
%                 else
%                     if R4(1) == 2 %trasmetto verso R3
%                         R4(1:end-1) = R4(2:end);
%                         index_R4 = index_R4 -1;
%                         R3(index_R3) = 2;
%                         index_R3 = index_R3 + 1;
%                     end
%                 end
%
%                 if R1(1) == 1 %trasmetto verso R2
%                     R1(1:end-1) = R1(2:end);
%                     index_R1 = index_R1 -1;
%                     R2(index_R2) = 1;
%                     index_R2 = index_R2 + 1;
%                 else
%                     if R1(1) == 2 %pacchetto trasmesso verso CTR
%                         R1(1:end-1) = R1(2:end);
%                         index_R1 = index_R1 -1;
%                         rx_ROV(rx_ROV_index) = slot;
%                         rx_ROV_index = rx_ROV_index + 1;
%                     end
%                 end
%
%                 %trasmetto R2
%                 slot = slot + 1;
%                 if R2(1) == 1 %trasmetto pacchetto CTR verso 3
%                     R2(1:end-1) = R2(2:end);
%                     index_R2 = index_R2 -1;
%                     R3(index_R3) = 1;
%                     index_R3 = index_R3 +1;
%                 else
%                     if R2(1) == 2 %pacchetto trasmesso verso R1
%                         R2(1:end-1) = R2(2:end);
%                         index_R2 = index_R2 -1;
%                         R1(index_R1) = 2;
%                         index_R1 = index_R1 + 1;
%                     end
%                 end
%
%                 %trasmetto R2
%                 slot = slot + 1;
%                 if R2(1) == 1 %trasmetto pacchetto CTR verso 3
%                     R2(1:end-1) = R2(2:end);
%                     index_R2 = index_R2 -1;
%                     R3(index_R3) = 1;
%                     index_R3 = index_R3 +1;
%                 else
%                     if R2(1) == 2 %pacchetto trasmesso verso R1
%                         R2(1:end-1) = R2(2:end);
%                         index_R2 = index_R2 -1;
%                         R1(index_R1) = 2;
%                         index_R1 = index_R1 + 1;
%                     end
%                 end
%
%
%                 %trasmetto R3
%                 slot = slot + 1;
%                 if R3(1) == 1 %trasmetto pacchetto CTR verso R4
%                     R3(1:end-1) = R3(2:end);
%                     index_R3 = index_R3 -1;
%                     R4(index_R4) = 1;
%                     index_R4 = index_R4 +1;
%                 else
%                     if R3(1) == 2 %pacchetto trasmesso verso R2
%                         R3(1:end-1) = R3(2:end);
%                         index_R3 = index_R3 -1;
%                         R2(index_R2) = 2;
%                         index_R2 = index_R2 + 1;
%                     end
%                 end
%
%                 %trasmetto R1 e R4
%                 slot = slot + 1;
%                 if R4(1) == 1 %trasmetto pacchetto R4 verso ROV
%                     R4(1:end-1) = R4(2:end);
%                     index_R4 = index_R4 -1;
%                     rx_CTR(rx_CTR_index) = slot;
%                     rx_CTR_index = rx_CTR_index + 1;
%                 else
%                     if R4(1) == 2 %trasmetto verso R3
%                         R4(1:end-1) = R4(2:end);
%                         index_R4 = index_R4 -1;
%                         R3(index_R3) = 2;
%                         index_R3 = index_R3 + 1;
%                     end
%                 end
%
%                 if R1(1) == 1 %trasmetto verso R2
%                     R1(1:end-1) = R1(2:end);
%                     index_R1 = index_R1 -1;
%                     R2(index_R2) = 1;
%                     index_R2 = index_R2 + 1;
%                 else
%                     if R1(1) == 2 %pacchetto trasmesso verso CTR
%                         R1(1:end-1) = R1(2:end);
%                         index_R1 = index_R1 -1;
%                         rx_ROV(rx_ROV_index) = slot;
%                         rx_ROV_index = rx_ROV_index + 1;
%                     end
%                 end
%
%                 i = i+1;
%
%
