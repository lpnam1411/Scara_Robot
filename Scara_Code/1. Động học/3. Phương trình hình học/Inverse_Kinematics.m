%%
clear all; close all;
[L1, L2] = parameter();
x2 = 200;
y2 = [50:150];

a = 0;
b = 0;
for y2 = 20:1.6:100
    [theta1,theta2] = inverse(x2,y2);
    %doi don vi do
    rad2deg = 180/pi;
    theta1 = theta1 * rad2deg;
    theta2 = theta2 * rad2deg;
    theta = [theta1 theta2];
    goc1 = theta1 - a;
    goc2 = theta2 - b;
    goc = [goc1 goc2];
    a = theta1;
    b = theta2;
    %Kiem tra lai
    deg2rad = pi/180;
    theta1 = theta1 * deg2rad;
    theta2 = theta2 * deg2rad;
    x2_tinh = L1*sin(theta1) + L2*sin(theta1 + theta2);
    y2_tinh = L1*cos(theta1) + L2*cos(theta1 + theta2);
    toado = [x2_tinh, y2_tinh];
    goc = goc * 3200/360*1.5;
    goc = round(goc);
    goc_1 = sprintf('%.0f',goc(1));
    goc_2 = sprintf('%.0f',goc(2));
    goc_3 = append(goc_1,',',goc_2,',');
    disp(goc_3)
   % disp(toado);
    
end

   