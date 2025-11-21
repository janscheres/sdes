theta = 5;
c = 1;
X0 = 4;
T = 10;
n = 5;

dt_values = [0.01,0.1,0.2,0.4,0.6,0.8];

figure;
for j = 1:length(dt_values)
    dt = dt_values(j);

    subplot(2,3,j);
    hold on;
    for k = 1:n
        [X, t] = euler_maruyama(@(x) -theta*x, @(x) c, T, dt, X0);
        plot(t, X, 'LineWidth', 1.5);
    end
    yline(0, 'k--', 'LineWidth', 1.5);

    title(sprintf('\\Deltat = %.2f', dt), 'FontSize', 14);
    xlabel('t'); ylabel('X(t)');
    grid on;
end




function [X, t] = euler_maruyama(f, g, T, dt, X0)

N = floor(T/dt);%number of timesteps in total
t = 0:dt:T;

X = zeros(1, N+1);%answer will be in this
X(1) = X0;

R = randn(1, N);%get random numbers as vector
dW = sqrt(dt) * R;

for i = 1:N
    X(i+1) = X(i) + f(X(i)) * dt + g(X(i)) * dW(i);
end

end