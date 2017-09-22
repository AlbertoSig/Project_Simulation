clear;
n_nodes = 5; %numero di nodi escluso ROV
d_max_original = 3000; %[m]
x_original = 0:30:d_max_original*(n_nodes-1);
y_original = 100*sin(2*pi*x_original/(2*d_max_original));



index = find( abs(y_original) < 10^-5);
for i = 1:length(index)
    y_original(index(i)) = 0.0;
end

y = fliplr(-1*y_original).';
x = fliplr(x_original).';
x_original = x_original.';
y_original = y_original.';

y_original = [y_original;y];
x_original = [x_original;x];

save('prova_path.mat','x_original','y_original');
plot(x_original,y_original);