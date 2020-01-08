%% Documentation

% under construction

%% Clear workspace

clear all
clc

%% Import data

uiimport;

%% Process SPS data

Abin1 = A_NC_05;
Abin2 = A_NC_10 - A_NC_05;
Abin3 = A_NC_25 - A_NC_10;

Bbin1 = B_NC_05;
Bbin2 = B_NC_10 - B_NC_05;
Bbin3 = B_NC_25 - B_NC_10;

%% Define a file name

filename = 'SPS30VacTest_jan7_1';

%% Save data

save(filename,"Abin1","Abin2","Abin3","Bbin1","Bbin2","Bbin3","pressure_ATM","pressure_psi","millis");

%% Create ratio bins

% SPS30 A ratios
A1_A2 = Abin1./Abin2; % find ratios between different number conc. bins of SPS30
A1_A3 = Abin1./Abin3;
A2_A3 = Abin2./Abin3;

% SPS30 B ratios
B1_B2 = Bbin1./Bbin2;
B1_B3 = Bbin1./Bbin3;
B2_B3 = Bbin2./Bbin3;

% ratios between SPS30 A and B
A1_B1 = Abin1./Bbin1;
A2_B2 = Abin2./Bbin2;
A3_B3 = Abin3./Bbin3;


%% Create an estimated altitude from pressure

% altitude is in feet
altitude_ft = 45330.8*(1.65859*((1./pressure_psi).^0.190223)-1); % dervied from online equation

%% Create a time vector in seconds

time_sec = millis./1000;
time_min = time_sec./60;

%% Find indices with "max altitude" and "start altitude"

max_index = find(altitude_ft == max(altitude_ft),1); % max alititude
start_index = find(altitude_ft > 500, 1); % first altitude above 500ft
end_index = find(altitude_ft > 500, 1, 'last'); % last altitude above 500ft

%% Plot Data (if ran in vacuum chamber)

% plot ratios from SPS A against pressure
f(1) = figure;
scatter(pressure_ATM(start_index:max_index), A1_A2(start_index:max_index),10,'filled')
hold on, grid on, zoom on
scatter(pressure_ATM(start_index:max_index), A2_A3(start_index:max_index),10,'filled')
legend("A1/A2","A2/A3",'location','best');
title('Ratio Comparisions for SPS30 A on Ascent')
xlabel('Pressure (ATM)')
ylabel('Ratio Between Number Bins')

f(2) = figure;
scatter(pressure_ATM(max_index:end_index), A1_A2(max_index:end_index),10,'filled')
hold on, grid on, zoom on
scatter(pressure_ATM(max_index:end_index), A2_A3(max_index:end_index),10,'filled')
legend("A1/A2","A2/A3",'location','best');
title('Ratio Comparisions for SPS30 A on Descent')
xlabel('Pressure (ATM)')
ylabel('Ratio Between Number Bins')

% plot ratios from SPS A against estimated altitude
f(3) = figure;
scatter(altitude_ft(start_index:max_index), A1_A2(start_index:max_index),10,'filled')
hold on, grid on, zoom on
scatter(altitude_ft(start_index:max_index), A2_A3(start_index:max_index),10,'filled')
legend("A1/A2","A2/A3",'location','best');
title('Ratio Comparisions for SPS30 A on Ascent')
xlabel('Estimated Altitude (feet)')
ylabel('Ratio Between Number Bins')

f(4) = figure;
scatter(altitude_ft(max_index:end_index), A1_A2(max_index:end_index),10,'filled')
hold on, grid on, zoom on
scatter(altitude_ft(max_index:end_index), A2_A3(max_index:end_index),10,'filled')
legend("A1/A2","A2/A3",'location','best');
title('Ratio Comparisions for SPS30 A on Descent')
xlabel('Estimated Altitude (feet)')
ylabel('Ratio Between Number Bins')

% plot ratios from SPS B against pressure
f(5) = figure;
scatter(pressure_ATM(start_index:max_index), B1_B2(start_index:max_index),10,'filled')
hold on, grid on, zoom on
scatter(pressure_ATM(start_index:max_index), B2_B3(start_index:max_index),10,'filled')
legend("B1/B2","B2/B3",'location','best');
title('Ratio Comparisions for SPS30 B on Ascent')
xlabel('Pressure (ATM)')
ylabel('Ratio Between Number Bins')

f(6) = figure;
scatter(pressure_ATM(max_index:end_index), B1_B2(max_index:end_index),10,'filled')
hold on, grid on, zoom on
scatter(pressure_ATM(max_index:end_index), B2_B3(max_index:end_index),10,'filled')
legend("B1/B2","B2/B3",'location','best');
title('Ratio Comparisions for SPS30 B on Descent')
xlabel('Pressure (ATM)')
ylabel('Ratio Between Number Bins')

% plot ratios from SPS B against estimated altitude
f(7) = figure;
scatter(altitude_ft(start_index:max_index), B1_B2(start_index:max_index),10,'filled')
hold on, grid on, zoom on
scatter(altitude_ft(start_index:max_index), B2_B3(start_index:max_index),10,'filled')
legend("B1/B2","B2/B3",'location','best');
title('Ratio Comparisions for SPS30 B on Ascent')
xlabel('Estimated Altitude (feet)')
ylabel('Ratio Between Number Bins')

f(8) = figure;
scatter(altitude_ft(max_index:end_index), B1_B2(max_index:end_index),10,'filled')
hold on, grid on, zoom on
scatter(altitude_ft(max_index:end_index), B2_B3(max_index:end_index),10,'filled')
legend("B1/B2","B2/B3",'location','best');
title('Ratio Comparisions for SPS30 B on Descent')
xlabel('Estimated Altitude (feet)')
ylabel('Ratio Between Number Bins')

% plot time v. pressure
f(9) = figure;
scatter(time_min,pressure_ATM,10,'filled')
grid on, zoom on
title('Pressure v. Time')
xlabel('Time (minutes)')
ylabel('Pressure (ATM)')

% plot time v. estimated altitude
f(10) = figure;
scatter(time_min,altitude_ft,10,'filled')
grid on, zoom on
title('Estimate Altitude v. Time')
xlabel('Time (minutes)')
ylabel('Estimate Altitude (feet)');

% plot pressure v. estimated altitude
f(11) = figure;
scatter(pressure_ATM,altitude_ft,10,'filled')
grid on, zoom on
title('Estimated Altitude v. Pressure')


%% Plot data (if ran in "natural" environment)

% The following plots acount for time and are meant to be used if "particles" such as solder are
% introduced to see how the OPCs react to their presence

f(1) = figure;
scatter(time_sec,A1_A2,10,'filled')
hold on, grid on, zoom on
scatter(time_sec,A2_A3,10,'filled')
legend("A1/A2","A2/A3",'location','best');
title('Ratio Comparisions for SPS30 A over Time')
xlabel('Time (seconds)')
ylabel('Ratio Between Number Bins')

f(2) = figure;
scatter(time_sec,B1_B2,10,'filled')
hold on, grid on, zoom on
scatter(time_sec,B2_B3,10,'filled')
legend("B1/B2","B2/B3",'location','best');
title('Ratio Comparisions for SPS30 B over Time')
xlabel('Time (seconds)')
ylabel('Ratio Between Number Bins')

f(3) = figure;
scatter(time_sec,A1_B1,10,'filled')
hold on, zoom on, grid on
scatter(time_sec,A2_B2,10,'filled')
scatter(time_sec,A3_B3,10,'filled')
legend("A1/B1","A2/B2","A3/B3",'location','best');
title('Ratio Comparisons Between SPS Units over Time')
xlabel('Time (seconds)');
ylabel('Ratio Between SPS Units')


%% Save the figures in a .fig file

figs_filename = filename + "_figs"; 
savefig(f,figs_filename)
close(f)

% PLEASE SAVE DATA IN A SEPARATE DIRECTORY SO AS TO NOT PUSH IT TO GITHUB
