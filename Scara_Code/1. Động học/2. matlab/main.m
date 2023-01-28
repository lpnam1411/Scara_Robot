clc 
clear

%%%%%%% Parameter
[L1,L2,L3,L4]=parameter();

%%%%%%% Vi tri ban dau 
xx_0 = -1;
yy_0 = 1;
zz_0 = 0.5;
E_0 = [xx_0;yy_0;zz_0];

%%%%%% Gia tri gan dung gop khop ban dau 
q1_0 = pi/2;
q2_0 = pi/2;
q3_0 = 0.5;

%%%%%% Tinh chinh xac goc khop ban dau 
for n=1:1:10^10
    Jnd_0=TinhJnd(q1_0,q2_0,q3_0);
    [xE_0,yE_0,zE_0]=Donghocthuan(q1_0,q2_0,q3_0);
    EE_0=[xE_0;yE_0;zE_0];
    delta_q_0=Jnd_0*(E_0 - EE_0);
    %tinh lai goc khop
    q1_0 = q1_0 + delta_q_0(1,1);
    q2_0 = q2_0 + delta_q_0(2,1);
    q3_0 = q3_0 + delta_q_0(3,1);
    %%%% Do chinh xac 
    ss = 10^(-5);
    if abs(delta_q_0(1,1)) < ss
        if abs(delta_q_0(2,1)) < ss
            if abs(delta_q_0(3,1)) < ss
                break
            end
        end
    end
    n;
end

%%%%% Xac nhan lai q_0
q1=q1_0;
q2=q2_0;
q3=q3_0;

%%%%% 
dt = 0.1;
t_max = 8;

for t=0:dt:t_max
    [Ed,dEd]=Quydao(t);
    Jnd=TinhJnd(q1,q2,q3);
    dE=[dEd(1);dEd(2);dEd(3)];
    q=[q1;q2;q3];
    dq=Jnd*dE; %van toc khop
    for k=1:1:10^5
        q_k=q + dq*dt;
        q1=q_k(1,1);
        q2=q_k(2,1);
        q3=q_k(3,1);
        Jnd_real=TinhJnd(q1,q2,q3);
        [xE,yE,zE]=Donghocthuan(q1,q2,q3);
        Eq=[xE;yE;zE];
        [Ed,dEd]=Quydao(t);
        Em=[Ed(1);Ed(2);Ed(3)];
        Delta_q = Jnd_real*(Em-Eq);
        
        %%%%do chinh xax 
        ss1 = 10^(-5);
        if abs(Delta_q(1,1)) < ss1
            if abs(Delta_q(2,1)) < ss1
                if abs(Delta_q(3,1)) < ss1
                    break
                end
            end
        end
    end
    k;
    
    %%%%% Goc khop chinh xac 
    q1 = q1 + Delta_q(1,1);
    q2 = q2 + Delta_q(2,1);
    q3 = q3 + Delta_q(3,1);
    
    %%%%%% Quy dao 
    [xE_lai,yE_lai,zE_lai]=Donghocthuan(q1,q2,q3);
    
    
    %%%% Bieu dien chuyen dong 
    P1 = [0 0 0];
    
    %%% Mo phong quy dao 
    
    curve=animatedline('Linewidth',1.5);
    set(gca,'xlim',[-4 4],'Ylim',[-4 4],'Zlim',[0 4]);
    xlabel('X(m)');
    ylabel('Y(m)');
    zlabel('Z(m)');
    
    %diem 0 
    for t_q1 = 0:0.05:1
        x1=0;
        y1=0;
        z1=0;
        plot3(x1,y1,z1,'b.',0,0,0,'r.')
        grid on
        hold on
    end
    %diem A 
    for t_q2 = 0:0.05:1
        xA=0;
        yA=0;
        zA=L1*t_q2;
        
        xOA = 0;
        yOA = 0;
        zOA = L1;
        plot3(xA,yA,zA,'g.',xOA,yOA,zOA,'r.')
        grid on
        hold on
    end
    %diem B
    for t_q3 = 0:0.05:1
        xB = L2 * cos(q1) * t_q3;
        yB = L2 * sin(q1) * t_q3;
        zB = L1;
        
        xOB = L2 * cos(q1);
        yOB = L2 * sin(q1);
        zOB = L1;
        plot3(xB,yB,zB,'c.',xOB,yOB,zOB,'r.')
        grid on 
        hold on 
    end
    %diem C
    for t_q4 = 0:0.05:1
        xC = (cos(q1)*L3*cos(q2) - sin(q1)*L3*sin(q2) ) * t_q4 + xOB;
        yC = (sin(q1)*L3*cos(q2) + cos(q1)*L3*sin(q2)) * t_q4 + yOB;
        zC = L1;
        
        xOC = cos(q1)*L3*cos(q2) - sin(q1)*L3*sin(q2) + L2 * cos(q1);
        yOC = sin(q1)*L3*cos(q2) + cos(q1)*L3*sin(q2) + L2 * sin(q1);
        zOC = L1;
        plot3(xC,yC,zC,'b.',xOC,yOC,zOC,'r.')
        grid on
        hold on
    end
    %diem E 
    for t_q5 = 0:0.05:1
        xE = xOC;
        yE = yOC;
        zE = zOC + (-q3) * t_q5;
        
        xOE = xE;
        yOE = yE;
        zOE = zOC - q3;
        plot3(xE,yE,zE,'c.',xOE,yOE,zOE,'r.')
        grid on
        hold on
    end
    
   pause(0.05)
       grid on
         hold on
end
        
        
        
        
        
        
    