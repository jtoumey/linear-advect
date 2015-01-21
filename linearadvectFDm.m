function [] = linearadvectFDm
clear all
clc
format short

a = 0;
b = 1;
dx = 0.001;

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
dt = 0.0003;
n_ts = 10;

u = zeros(1,N);
a1 = c*dt/(2*dx);
for ii = 1:n_ts
    u0 = [u0(1) u0 u0(N)];
    for jj = 2:N
        u(jj) = u0(jj) - a1*(u0(jj+1) - u0(jj-1));
    end 
    u0 = u;%(1:N);
end
adv_dist = c*n_ts*dt - dx;
for ii = 1:N
    u0(ii) = advect_ic(x(ii),adv_dist);
end
plot(x,u,':'); hold on
plot(x,u0,'r')    
axis([0 1 0 2]);
end 

function u0 = init_cond(x)
u0 = 1;
if x > .5
    u0 = 0;
end
end 

function u0 = advect_ic(x,adv_dist)
u0 = 1;
if x > (.5 + adv_dist)
    u0 = 0;
end
end