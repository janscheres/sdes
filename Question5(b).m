% Paramters (subject to variability) 

T = 50;
dt = 0.01;
X_0 = 0.5;




c_values = [0.3, 0.5, 1];

for j = 1:length(c_values)
    c = c_values(j);
    X_end = zeros(1, 100);

    f = @(x) x - x.^3;
    g = @(x) c;


    for k = 1:100
        rng(k);
        [X, t] = euler_maruyama(f, g, T, dt, X_0);
        X_end(k) = X(end);
    end

    subplot(1, length(c_values), j);
    histogram(X_end, 20);
    title(['c = ', num2str(c)]);
    xlabel('X(T)'); ylabel('Counts');
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
