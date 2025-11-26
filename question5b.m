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
    title(['$c = ', num2str(c), '$'], 'Interpreter', 'latex', 'FontSize', 18);
    xlabel('$X(T)$', 'Interpreter', 'latex', 'FontSize', 14); ylabel('Counts', 'FontSize', 14);
end
