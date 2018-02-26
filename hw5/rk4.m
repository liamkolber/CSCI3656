function y = rk4(F_xy, y_0, x)
h=1.5; % step size
y = zeros(15,1); 
y(1) = y_0; % initial condition

for i=1:(length(x)-1) % calculation loop
k_1 = F_xy(x(i),y(i));
k_2 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_1);
k_3 = F_xy((x(i)+0.5*h),(y(i)+0.5*h*k_2));
k_4 = F_xy((x(i)+h),(y(i)+k_3*h));

y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; % main equation
end
end