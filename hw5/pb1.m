close all
format long

yFun       = @(t) 0.5*exp(-t) + 0.5*sin(t) - 0.5*cos(t);
yFunPrime  = @(y,t) sin(t) - y;

y_list = zeros(1,15);
y_list(1) = 0;
T = 8;
y_0 = 0;

for k = 1:15
    h = 2^(-k);    
    n = T/h;
    
    [tgrid,Y] = euler_method(yFunPrime,y_0,n,T); 
    
    err = zeros(n+1,1);
    for i = 1:n+1
        err(i) = abs(yFun(tgrid(i)) - Y(i))/abs(yFun(tgrid(i)));
    end
    
    grid on
    loglog(tgrid,err)
    
end