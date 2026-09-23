%% Proof of Skills - Determine Time Constant
% Defines v(t) = 5*exp(-t/tau), identifies tau analytically, and
% estimates tau from the sampled curve at v(0)/e.

clear;
close all;
clc;

V0 = 5;                 % Initial voltage (V)
tau = 2e-3;             % Analytical time constant (s)
t = linspace(0, 5*tau, 1001);
v = V0 * exp(-t/tau);

target_voltage = V0 / exp(1);
[~, tau_index] = min(abs(v - target_voltage));
tau_from_plot = t(tau_index);

figure('Color', 'w');
plot(t*1e3, v, 'b-', 'LineWidth', 2);
hold on;
plot(tau_from_plot*1e3, v(tau_index), 'ro', ...
    'MarkerFaceColor', 'r', 'MarkerSize', 7);
xline(tau*1e3, '--r', 't = tau', 'LineWidth', 1.4);
yline(target_voltage, '--k', 'V_0/e', 'LineWidth', 1.4);
grid on;
xlabel('Time (ms)');
ylabel('Voltage (V)');
title('Exponential Decay and Time Constant');
legend('v(t) = 5e^{-t/\tau}', 'Point read from plot', ...
    'Location', 'northeast');

fprintf('Function: v(t) = 5*exp(-t/tau)\n');
fprintf('Analytical tau: %.6f s (%.3f ms)\n', tau, tau*1e3);
fprintf('At t = tau, v(t) = V0/e = %.6f V\n', target_voltage);
fprintf('Tau estimated from sampled plot: %.6f s (%.3f ms)\n', ...
    tau_from_plot, tau_from_plot*1e3);
