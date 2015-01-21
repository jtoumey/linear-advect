function [] = linearadvectFDm
clear all
clc

a = 0;
b = 1;
dx = 0.1;

% Construct the grid 
x = a:dx:b;
N = (b-a)/dx + 1;
% Construct IC
u0 = zeros(1,N);
for ii = 1:N
    u0(ii) = init_cond(x(ii));
end
% plot(x,u0);axis([0 1 0 3]);hold on
c = 0.7;
dt = 0.03;
n_ts = 20;

u = zeros(1,N);
a1 = c*dt/(2*dx);
for ii = 1:n_ts
    u0 = [u0(1) u0 u0(N)];
    for jj = 2:N
        u(jj-1) = u0(jj) - a1*(u0(jj) - u0(jj-1));
    end 
    u0 = u;
    plot(x,u); pause(0.1)
end

end 

function u0 = init_cond(x)
u0 = 2;
if x > .5
    u0 = 1;
end

end 