clear;
v = 1;
m_x = 10;
m_y = 10;
start_y = -100;
start_x = -100;
verso_x = 1;
verso_y = 1; %1=verso positivo -1=verso negativo
x_original = zeros(1,10);
y_original = zeros(1,10);
x_original(1) = start_x;
y_original(1) = start_y;
i = 1;
while y_original(i) ~=  100
    i = i+1;
    x_original(i) = x_original(i-1) + m_x*verso_x;
    y_original(i) = y_original(i-1) + m_y*verso_y;
    verso_y = verso_y*(-1);
    if x_original(i) == 100 || x_original(i) == -100
        i = i+1;
        x_original(i) = x_original(i-1);
        y_original(i) = y_original(i-1) + m_y;
        i = i+1;
        x_original(i) = x_original(i-1);
        y_original(i) = y_original(i-1) + m_y;
        verso_x = verso_x*(-1);
    end
end
x_original = x_original.';
y_original = y_original.';
save('original_path.mat','x_original','y_original');