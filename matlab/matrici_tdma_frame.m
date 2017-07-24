clear
nn = 12;
ext = 2*nn-2;
m = zeros(nn,ext);
for i = 1:nn
    if i == 1
        m(i,i) = 1;
    else
        m(i,i) = 1;
        m(i,ext-i+2) = 1;
    end
end
