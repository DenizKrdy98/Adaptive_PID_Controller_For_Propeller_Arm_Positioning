%%

%% Best Ki/Kp values for Qi = 0, and varying Qd.
desAng = [30 35 40 45 50 55 60 65 70 75 80 82.5 85 86 87 88 89 89.5 89.7 89.8 89.83 ];
Ki_Kp_val = [1.5 1.3 1.1 1 0.9 0.7 0.6 0.5 0.35 0.25 0.16 0.117 0.076 0.06 0.045 0.03 0.0145 0.007 0.0034 0.001 0.000001];
pol = polyfit(desAng,Ki_Kp_val,2);
bestFit = pol(1)*desAng.^2 + pol(2)*desAng + pol(3);
figure
plot (desAng,Ki_Kp_val)
hold on
plot (desAng,bestFit)
legend('experiment','bestfit');


%% Best dmd values for Qi = 0, and varying Qd.
desAng = [45 35 30 25 20 15 10 5 0];
dmd = [0 9 16 24 29 31 33 36 40];
pol = polyfit(desAng,dmd,5);
bestFit =  pol(1)*desAng.^5 + pol(2)*desAng.^4 + pol(3)*desAng.^3 + pol(4)*desAng.^2 + pol(5)*desAng + pol(6);
figure
plot (desAng,dmd)
hold on
plot (desAng,bestFit)
legend('experiment','bestfit');

%% Best dmd values for Qd = 0, and varying Qi.
startAng = [0 5 10 15 20 25 30 35 40 45 50];
dmd = [40 45 50 55 60 65 73 82 92 105 125];
pol = polyfit(startAng,dmd,3);
bestFit = pol(1)*startAng.^3 + pol(2)*startAng.^2 + pol(3)*startAng + pol(4);
figure
plot (startAng,dmd)
hold on
plot (startAng,bestFit)
legend('experiment','bestfit');

%% Best Ki/Kp and Kp values for Qi = -90 and varying Qd
desAngle2 = [-65 -60 -55 -50 -45 -40];
Kp2 = [0.85 1.2 1.5 1.7 1.8 2];
Ki_Kp2 = [3 3 2.85 2.7 2.4 2.2];

desAngle1 = [-40 -30 -20 -10 0 10 20 30];
Kp1 = 2;
Ki_Kp1 = [2.2 1.7 1.5 1.3 1.1 1 0.85 0.65];

desAngle = [30 40 55 70 85 88];
Kp = [2 2 1.5 1.15 0.91 0.89];
Ki_Kp = [0.65 0.55 0.5 0.32 0.07 0.0295];

%----------------------------------
figure
polKp = polyfit(desAngle,Kp,4);
bestFit = polKp(1)*desAngle.^4 + polKp(2)*desAngle.^3 + polKp(3)*desAngle.^2 + polKp(4)*desAngle + polKp(5);
plot (desAngle,Kp)
hold on
plot (desAngle,bestFit)
legend('experiment','bestfit');

figure
polKi = polyfit(desAngle,Ki_Kp,4);
bestFit = polKi(1)*desAngle.^4 + polKi(2)*desAngle.^3 + polKi(3)*desAngle.^2 + polKi(4)*desAngle + polKi(5);
plot (desAngle,Ki_Kp)
hold on
plot (desAngle,bestFit)
legend('experiment','bestfit');

% qd = [-90 -85 -80 -80 -80 -80 -70]
% qi = [-70 -70 -70 -60 -50 -40 -50]
% Kp = [0.6 0.77 1.05 1.9 1.9 1.5];

%%
startAng = [50 60  80  20 50 60  50 60 40 70 80  80 20 80  80  80 85 60 ];
desAngle = [10 10  10  10 20 20  30 30 30 30 30  70 0  60  0   79 84 50 ];
dmd = [90 110 120 50 70 100 60 60 44 80 100 25 60 50  150 10 3  36 ];
pol = polyfit(startAng,dmd,3);
bestFit = pol(1)*startAng.^3 + pol(2)*startAng.^2 + pol(3)*startAng + pol(4);
figure
plot (startAng,dmd)
hold on
plot (startAng,bestFit)
legend('experiment','bestfit');

%% Qi = 0, Qd<-20 -> dmd = 80

desAngle = [70 75 80 85 89];
dmd = [125 140 150 165 180];
Ki_Kp=[1.5 1.4 1.3 1.2 1.1];
pol = polyfit(desAngle,Ki_Kp,2);
bestFit = pol(1)*desAngle.^2 + pol(2)*desAngle + pol(3);
figure
plot (desAngle,Ki_Kp)
hold on
plot (desAngle,bestFit)
legend('experiment','bestfit');

desAngle = [10 20 30 40 50 60 70 ];
dmd = [70 60 60 55 50 40 25];
pol = polyfit(desAngle,dmd,2);
bestFit = pol(1)*desAngle.^2 + pol(2)*desAngle + pol(3);
figure
plot (desAngle,dmd)
hold on
plot (desAngle,bestFit)
legend('experiment','bestfit');

startAng = [50 60  80  20 50 60  50 60 40 70 80  80 20 80  80  80 85 60 ];
desAngle = [10 10  10  10 20 20  30 30 30 30 30  70 0  60  0   79 84 50 ];
dmd = [90 110 120 50 70 100 60 60 44 80 100 25 60 50  150 10 3  36 ];
pol = polyfit(startAng,dmd,3);
bestFit = pol(1)*startAng.^3 + pol(2)*startAng.^2 + pol(3)*startAng + pol(4);
figure
plot (startAng,dmd)
hold on
plot (startAng,bestFit)
legend('experiment','bestfit');
