% 保存为 burgers_solver.m
clear; clc; close all;

% 参数设置
x_min = -5;
x_max = 5;
T = 2;
Nx = 200;       % 空间节点数
Nt = 500;       % 时间步数

x = linspace(x_min, x_max, Nx);
dx = x(2) - x(1);
dt = T / Nt;

% 初值
u = exp(-x.^2);

% 时间演化
U = zeros(Nt+1, Nx);
U(1,:) = u;

for n = 1:Nt
    un = U(n,:);
    % 一阶迎风格式
    dudx = [ (un(1) - un(1))/dx, (un(2:end) - un(1:end-1))/dx ];
    U(n+1,:) = un - dt * un .* dudx;
end

% 可视化
figure;
mesh(x, linspace(0,T,Nt+1), U);
xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Solution of \\partial_t u + u\\partial_x u = 0');
shading interp;
view(135, 45);
colorbar;
