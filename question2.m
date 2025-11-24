theta = 5;
c = 1;
X0 = 4;
T = 10;
dt = 0.01;
n = 5;

figure;

subplot(2, 1, 1);
hold on;
for k = 1:n
    [X, t] = euler_maruyama(@(x) -theta*x, @(x) c, T, dt, X0);
    plot(t, X, 'LineWidth', 1.5);
end
yline(0, 'k--', 'LineWidth', 2);
title('Case A: Linear SDE ($f = -\theta X$)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time, $t$', 'Interpreter', 'latex', 'FontSize', 14);
grid on;


subplot(2, 1, 2);
hold on;
for k = 1:n
    [X, t] = euler_maruyama(@(x) 0, @(x) c, T, dt, X0);
    plot(t, X, 'LineWidth', 1.5);
end
yline(X0, 'k--', 'LineWidth', 2);
title('Case B: No Drift ($f = 0$)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time, $t$', 'Interpreter', 'latex', 'FontSize', 14);
grid on;
hold off;
