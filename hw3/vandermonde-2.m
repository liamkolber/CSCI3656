function v = vandermonde(n, d)
v=zeros(n,d+1);
a = linspace(-1,1,n);
for i = 1:n
    for j = 0:d
        v(i,j+1)= a(i)^j;
    end
end
end