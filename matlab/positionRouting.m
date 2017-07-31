clear all;
theta = 0;
nn = 2;
n_points = 10;
x_original = zeros(n_points*nn,1);
y_original = zeros(n_points*nn,1);
z_original = -1200*ones(n_points*nn,1);
r = 30;
max_dist = 3000;
for i=2:n_points
    x_original(i) = r*cos(theta);
    y_original(i) = r*sin(theta);
    theta = (i-1)*pi/4;
end
for i = 1:nn-1
    x_original(i*n_points+1:(i+1)*n_points) = x_original(1:n_points)+i*max_dist;
    y_original(i*n_points+1:(i+1)*n_points) = y_original(1:n_points);
end

index_x = find(abs(x_original) < 1^-10);
for i=1:length(index_x)
    x_original(index_x(i)) = 0;
end

index_y = find(abs(y_original) < 1^-10);
for i=1:length(index_y)
    y_original(index_y(i)) = 0;
end

plot(x_original,y_original)