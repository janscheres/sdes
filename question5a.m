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
[X2, t2] = euler_maruyama(f, @(x) 0, T, dt, X_0);
plot(t2, X2, 'b', 'LineWidth', 1.5);
yline(0, '--k', 'LineWidth', 2.0);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$c = 0.1$', 'Interpreter', 'latex', 'FontSize', 18);

subplot(1, 3, 2);
[X, t] = euler_maruyama(f, @(x) 0.5, T, dt, X_0);
plot(t, X, 'r', 'LineWidth', 1.5);
hold on;
[X2, t2] = euler_maruyama(f, @(x) 0, T, dt, X_0);
plot(t2, X2, 'b', 'LineWidth', 1.5);
yline(0, '--k', 'LineWidth', 1.5);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$c = 0.5$', 'Interpreter', 'latex', 'FontSize', 18);

subplot(1, 3, 3);
[X, t] = euler_maruyama(f, @(x) 1.0, T, dt, X_0);
plot(t, X, 'r', 'LineWidth', 1.5);
hold on;
[X2, t2] = euler_maruyama(f, @(x) 0, T, dt, X_0);
plot(t2, X2, 'b', 'LineWidth', 1.5);
yline(0, '--k', 'LineWidth', 1.5);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$c = 1.0$', 'Interpreter', 'latex', 'FontSize', 18);

%next plot:
figure;
[X_new, t_new] = euler_maruyama(f, @(x) 0.2, 500000, dt, -0.5);

plot(t_new, X_new, 'r', 'LineWidth', 1.5);
hold on;
yline(0, '--k', 'LineWidth', 2.0);
hold off;
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
title('$X_0 = -0.5$, $c = 0.2$', 'Interpreter', 'latex', 'FontSize', 18);

%next plot
X0_values = [0.5, -0.5, 5];
figure;

for j = 1:length(X0_values)
    %rng(1); used to get same plots as Ben
    X_0_current = X0_values(j);
    
    [X, t] = euler_maruyama(f, @(x) 0.5, T, dt, X_0_current);
    
    subplot(1, 3, j);
    plot(t, X, 'r', 'LineWidth', 1.5);
    hold on;
    yline(0, '--k', 'LineWidth', 2.0);
    hold off;
    xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
    ylabel('$X(t)$', 'Interpreter', 'latex', 'FontSize', 14);
    title(['$X_0 = ', num2str(X_0_current), '$, $c = 0.5$'], 'Interpreter', 'latex', 'FontSize', 18);
end
