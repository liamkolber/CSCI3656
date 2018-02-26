close all
format long


yFun = @(t) -sin(2*t) + t^2 -3;
y1 = @(t) -2*cos(2*t) + 2*t;
y2 = @(t) 4*sin(2*t) + 2;
y3 = @(t) 8*cos(2*t);

u = @(t) [y1(t),y2(t),y3(t)];

uprime = @(t,u) [u(1), u(2), u(3)];

tspan = [0 5];

[t, y] = ode45(uprime, tspan, [-3 -2 2]);
plot(t,y,'-o')