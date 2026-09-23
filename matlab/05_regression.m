%% Proof of Skills - Linear Regression in MATLAB
% Fits a straight line to measured-looking sample data using polyfit.

clear;
close all;
clc;

x = (0:6)';
y = [1.1; 2.9; 5.2; 6.8; 9.1; 10.9; 13.2];

coefficients = polyfit(x, y, 1);
x_fit = linspace(min(x), max(x), 200)';
y_fit = polyval(coefficients, x_fit);
y_predicted = polyval(coefficients, x);

SS_residual = sum((y - y_predicted).^2);
SS_total = sum((y - mean(y)).^2);
R_squared = 1 - SS_residual/SS_total;

figure('Color', 'w');
plot(x, y, 'ko', 'MarkerFaceColor', [0.15 0.45 0.85], ...
    'MarkerSize', 7);
hold on;
plot(x_fit, y_fit, 'r-', 'LineWidth', 2);
grid on;
xlabel('Independent variable, x');
ylabel('Measured value, y');
title('Linear Regression with polyfit');
legend('Data points', 'Linear fit', 'Location', 'northwest');

equation_text = sprintf('y = %.4fx + %.4f\nR^2 = %.5f', ...
    coefficients(1), coefficients(2), R_squared);
text(0.55*max(x), min(y) + 0.15*(max(y)-min(y)), equation_text, ...
    'BackgroundColor', 'w', 'EdgeColor', [0.7 0.7 0.7]);

fprintf('Best-fit equation: y = %.6f*x + %.6f\n', ...
    coefficients(1), coefficients(2));
fprintf('R-squared: %.9f\n', R_squared);
