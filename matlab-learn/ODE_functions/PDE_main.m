% PDE_main.m

N = 100;                      % 空间节点数
x = linspace(0, 2*pi, N);     % 空间网格
u0 = sin(x)';                 % 初始条件（列向量）

tspan = [0 1.5];              % 时间区间

% 调用 ODE 求解器
[t, U] = ode45(@BurgersRHS, tspan, u0);

% 可视化
[X, T] = meshgrid(x, t);
surf(X, T, U, 'EdgeColor', 'none');
xlabel('x')
ylabel('t')
zlabel('u(x,t)')
title('无粘性 Burgers 方程数值解')
view(2); colorbar;
