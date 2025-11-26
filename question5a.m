T = 50;
dt = 0.01;
X_0 = 0.5;

f = @(x) x - x.^3;

rng(1); % Ensure reproducibility

% Create figure with subplots
figure;
subplot(1, 3, 1);
[X, t] = euler_maruyama(f, @(x) 0.1, T, dt, X_0);
plot(t, X, 'r', 'LineWidth', 1.5);
hold on;
yline(0, '--k', 'LineWidth', 2.0);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$c = 0.1$', 'Interpreter', 'latex', 'FontSize', 18);

subplot(1, 3, 2);
[X, t] = euler_maruyama(f, @(x) 0.5, T, dt, X_0);
plot(t, X, 'r', 'LineWidth', 1.5);
hold on;
yline(0, '--k', 'LineWidth', 1.5);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$c = 0.5$', 'Interpreter', 'latex', 'FontSize', 18);

subplot(1, 3, 3);
[X, t] = euler_maruyama(f, @(x) 1.0, T, dt, X_0);
plot(t, X, 'r', 'LineWidth', 1.5);
hold on;
yline(0, '--k', 'LineWidth', 1.5);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$c = 1.0$', 'Interpreter', 'latex', 'FontSize', 18);
