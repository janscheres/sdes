% Paramters (subject to variability) 
c = 1.1;
T = 50;
dt = 0.5;
X_0 = 0.5;

% Define the functions for the SDE
f = @(x) x - x.^3;
g = @(x) x*c;

rng(1);
[X, t] = euler_maruyama(f, g, T, dt, X_0);

% Graph
plot(t,X, 'r', 'LineWidth', 2);
hold on;
yline(0, '--k', 'LineWidth', 1);
hold off;
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$X(t)$','Interpreter', 'latex');
title(['X_0 = ', num2str(X_0), ', c = ', num2str(c)]);

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
