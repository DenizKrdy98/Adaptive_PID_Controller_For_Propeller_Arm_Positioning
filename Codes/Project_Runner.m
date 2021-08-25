clear all
close all
% independent parameters
deltaT = 0.01;
Ts = deltaT;
p = 0.9;
N = p/Ts;

% user defined parameters
Qd_init = 00;
startAngle = Qd_init;
Qd_fin = 45;
%Qd_fin = 89.815; % MAX value form 0 to go

% Simulink Run
sim('final_project.slx');
