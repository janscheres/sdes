theta = 5;
c = 1;
X0 = 4;
T = 10;
dt = 0.01;
n = 5;

figure;
hold on;

h_case_a = plot(nan, nan, 'b', 'LineWidth', 1.5);%dummy plot to make legend work
h_case_b = plot(nan, nan, 'r', 'LineWidth', 1.5);%dummy plot for legend

for k = 1:n
    [X, t] = euler_maruyama(@(x) -theta*x, @(x) c, T, dt, X0);
    plot(t, X, 'b', 'LineWidth', 1.5);
end

for k = 1:n
    [X, t] = euler_maruyama(@(x) 0, @(x) c, T, dt, X0);
    plot(t, X, 'r', 'LineWidth', 1.5);
end

yline(0, 'k--', 'LineWidth', 2);
yline(X0, 'k--', 'LineWidth', 2);

ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time, $t$', 'Interpreter', 'latex', 'FontSize', 14);

legend({'Case A: Linear SDE ($f = -\theta X$)', 'Case B: No Drift ($f = 0$)'}, 'Interpreter', 'latex', 'FontSize', 12);

grid on;
hold off;