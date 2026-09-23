%% Proof of Skills - Import LTspice Data
% Imports the tab-delimited transient export and compares VIN with VOUT.

clear;
close all;
clc;

script_dir = fileparts(mfilename('fullpath'));
if isempty(script_dir)
    script_dir = pwd;
end

data_file = fullfile(script_dir, 'data', 'transient_export.txt');
if ~isfile(data_file)
    data_file = fullfile(pwd, 'transient_export.txt');
end
if ~isfile(data_file)
    error(['Cannot find transient_export.txt. Upload the data file or ', ...
        'the complete MATLAB folder, then run this script again.']);
end

table_data = readtable(data_file, 'FileType', 'text', 'Delimiter', '\t');
time_s = table_data.time;
V_VIN = table_data.V_VIN;
V_VOUT = table_data.V_VOUT;

gain = (V_VIN' * V_VOUT) / (V_VIN' * V_VIN);
expected_gain = 2/3;

figure('Color', 'w');
plot(time_s*1e3, V_VIN, 'Color', [0.15 0.45 0.85], 'LineWidth', 1.8);
hold on;
plot(time_s*1e3, V_VOUT, 'Color', [0.85 0.25 0.15], 'LineWidth', 1.8);
grid on;
xlabel('Time (ms)');
ylabel('Voltage (V)');
title('LTspice Transient Export Imported into MATLAB');
legend('V_{IN}', 'V_{OUT}', 'Location', 'northeast');

fprintf('Imported %d samples from %s\n', height(table_data), data_file);
fprintf('Measured divider gain VOUT/VIN: %.9f\n', gain);
fprintf('Expected divider gain: %.9f\n', expected_gain);
