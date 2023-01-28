function Jnd=TinhJnd(q1,q2,q3)
[L1,L2,L3,L4]=parameter();
%% jacobian

J11=(-L3*cos(q2) - L2)*sin(q1) - cos(q1)*L3*sin(q2)
J12=-L3*(cos(q1)*sin(q2) + sin(q1)*cos(q2));
J13=0;


J21=(L3*cos(q2) + L2)*cos(q1) - sin(q1)*L3*sin(q2);
J22=L3*(cos(q1)*cos(q2) - sin(q1)*sin(q2));
J23=0;


J31=0;
J32=0;
J33=-1;


J=[J11 J12 J13 ; J21 J22 J23 ; J31 J32 J33 ];

%% chuyen vi jacobian
Jt=J';
%% Jacobi tua nghich dao
Jnd=(Jt*inv(J*Jt));
end