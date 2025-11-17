function [X, t] = euler_maruyama(f, g, T, dt, X0)

N = floor(T/dt);%number of timesteps in total
t = 0:dt:T;

X = zeros(1, N+1);%answer will be in this
X(1) = X0;

for i = 1:N
    R = randn;
    dW = sqrt(dt) * R;%as mentioned in the sources, scale with sqrt(dt)

    prev = X(i);

    fPrev = f(prev);
    gPrev = g(prev);

    X(i+1) = prev + fPrev * dt + gPrev * dW;
end

end
