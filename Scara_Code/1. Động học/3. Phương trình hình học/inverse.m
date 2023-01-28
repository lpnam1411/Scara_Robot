function [theta1,theta2] = inverse(x2,y2)
    L1 = 10;
    L2 = 7;
    cos_theta2 = (x2^2+y2^2-L1^2-L2^2)/(2*L1*L2);
    theta2 = acos(cos_theta2);
    tan_theta1 = (x2*L1+x2*L2*cos(theta2)-y2*L2*sin(theta2))/(y2*L1+y2*L2*cos(theta2)+x2*L2*sin(theta2));
    theta1 = atan(tan_theta1);
end
