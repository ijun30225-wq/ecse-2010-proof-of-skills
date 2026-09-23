%% Proof of Skills - Solve a System of Equations
% Unknown vector x is [VA; VB; VC]. The equations are:
% VA/100 = VB/20 + VC/250
% VA + VB = 5
% -VB + VC = 0

clear;
clc;

A = [1/100, -1/20, -1/250; ...
     1,      1,       0; ...
     0,     -1,       1];
b = [0; 5; 0];

x = A \ b;
VA = x(1);
VB = x(2);
VC = x(3);
residual = A*x - b;

disp('Coefficient matrix A:');
disp(A);
disp('Right-hand side b:');
disp(b);
fprintf('VA = %.6f V\n', VA);
fprintf('VB = %.6f V\n', VB);
fprintf('VC = %.6f V\n', VC);
fprintf('Maximum absolute residual = %.3e\n', max(abs(residual)));
