function [Ed,dEd]=Quydao(t)
    [L1,L2,L3,L4]=parameter();
    Ed(1)=1.25;
    Ed(2)=t;
    Ed(3)=0.5;
    
    dEd(1)=0;
    dEd(2)=1;
    dEd(3)=0;
end