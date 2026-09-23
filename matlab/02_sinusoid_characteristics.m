%% Proof of Skills - Determine Sinusoid Characteristics
% Compares a phase-shifted cosine with an unshifted reference.

clear;
close all;
clc;

amplitude = 3;                  % V
frequency = 50;                 % Hz
period = 1 / frequency;         % s
omega = 2*pi*frequency;         % rad/s
phase = pi/3;                   % rad
phase_deg = phase * 180/pi;     % degrees
time_shift = -phase / omega;    % s; positive phase shifts cosine left

t = linspace(-period, 2*period, 1501);
reference = amplitude*cos(omega*t);
shifted = amplitude*cos(omega*t + phase);

figure('Color', 'w');
plot(t*1e3, reference, '--', 'Color', [0.35 0.35 0.35], ...
    'LineWidth', 1.5);
hold on;
plot(t*1e3, shifted, 'b-', 'LineWidth', 2);
plot(0, amplitude, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
plot(time_shift*1e3, amplitude, 'ro', ...
    'MarkerFaceColor', 'r', 'MarkerSize', 7);
xline(0, ':k', 'Reference peak');
xline(time_shift*1e3, ':r', 'Shifted peak');
yline(amplitude, ':', 'Amplitude = 3 V');
grid on;
xlabel('Time (ms)');
ylabel('Voltage (V)');
title('3cos(2\pi(50)t + \pi/3) and Phase Reference');
legend('Reference: 3cos(2\pi(50)t)', ...
    'Shifted: 3cos(2\pi(50)t + \pi/3)', ...
    'Reference peak', 'Shifted peak', 'Location', 'southoutside');

fprintf('Amplitude: %.3f V\n', amplitude);
fprintf('Frequency: %.3f Hz\n', frequency);
fprintf('Period: %.6f s (%.3f ms)\n', period, period*1e3);
fprintf('Phase: %.6f rad = %.3f degrees\n', phase, phase_deg);
fprintf('Time shift relative to reference: %.6f s (%.3f ms)\n', ...
    time_shift, time_shift*1e3);
