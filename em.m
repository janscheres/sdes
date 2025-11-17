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
