clear;
v = 1;
m_x = 10;
m_y = 10;
start_y = 60;
start_x = -20;
verso_x = 1;
verso_y = -1; %1=verso positivo -1=verso negativo
x_original = zeros(1,10);
y_original = zeros(1,10);
x_original(1) = start_x;
y_original(1) = start_y;
i = 1;
n_nodes = 5; %numero di nodi escluso il ROV
d_max = 3000;
for k =0:n_nodes-1
    while y_original(i) ~=  10 || x_original(i) ~= 30 + k*d_max
        i = i+1;
        x_original(i) = x_original(i-1) + m_x*verso_x;
        y_original(i) = y_original(i-1) + m_y*verso_y;
        verso_y = verso_y*(-1);
        if (x_original(i) == -20 + k*d_max|| x_original(i) == 30+ k*d_max) && y_original(i) ~=  10
            i = i+1;
            x_original(i) = x_original(i-1);
            y_original(i) = y_original(i-1) -2*m_y;
            %i = i+1;
            %x_original(i) = x_original(i-1);
            %y_original(i) = y_original(i-1) + m_y;
            verso_x = verso_x*(-1);
        end
    end
    i = i+1;
    if (k ~= n_nodes-1) 
        x_original(i) = start_x + (k+1)*d_max;
        y_original(i) = start_y;
    end
    verso_x = 1;
    verso_y = -1;
end

y = (y_original - 70).';
x = (fliplr(x_original)).';

x_original = x_original.';
y_original = y_original.';

x_original = [x_original;x];
y_original = [y_original;y];

save('posBasedRt_path.mat','x_original','y_original');
plot(x_original,y_original)