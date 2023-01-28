function[xE,yE,zE]=Donghocthuan(q1,q2,q3)
[L1,L2,L3,L4]=parameter;
xE = cos(q1)*L3*cos(q2) - sin(q1)*L3*sin(q2) + L2 * cos(q1);
yE = sin(q1)*L3*cos(q2) + cos(q1)*L3*sin(q2) + L2 * sin(q1);
zE = L1 - q3;
end