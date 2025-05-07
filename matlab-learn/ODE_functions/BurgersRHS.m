function dudt = BurgersRHS(t, u)
    N = length(u);
    dx = 2*pi / N;

    dudt = zeros(N,1);

    % 使用周期边界
    u_ext = [u(end); u; u(1)];  % 周期延拓

    % 一阶迎风格式
    for i = 1:N
        dudt(i) = - u_ext(i+1) * (u_ext(i+2) - u_ext(i+1)) / dx;
    end
end
