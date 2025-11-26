c = 1.0;
dt = 0.05;
X_0 = 0.5;
T = 50;
rng(1);

f = @(x) x - x.^3;
g = @(x) x*c;


[X, t] = euler_maruyama(f, g, T, dt, X_0);

figure;
plot(t, X, 'r', 'LineWidth', 1.5);
hold on;
yline(0, '--k', 'LineWidth', 2);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$X_0 = 0.5$, $g(x) = x$', 'Interpreter', 'latex', 'FontSize', 18);

%next figure
c = 1.1;
dt = 0.5;
g = @(x) x*c;
rng(1);
[X, t] = euler_maruyama(f, g, T, dt, X_0);

figure;
plot(t,X, 'r', 'LineWidth', 1.5);
hold on;
yline(0, '--k', 'LineWidth', 2);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$X_0 = 0.5$, $g(x) = 1.1x$', 'Interpreter', 'latex', 'FontSize', 18);
