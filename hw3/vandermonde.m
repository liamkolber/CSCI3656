function v = vandermonde(n, d)
space = (linspace(-1,1,n))';
v = ones(n,1);
v = [v,space];
for i = 1:d
    v = [v,space.^2];
end
v = v(:,1:(d+1));