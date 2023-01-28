%% setup link matlab - arduino

%x = serialport('COM3',9600);
%% setup mode 
prompt = {'Enter Mode','Forward Kinematics','Inverse Kinematics','Draw Line'};
dlgtitle = 'SCARA ROBOT';
dims = [1 60;1 20;1 20;1 20];
definput={'','1','2','3'};
command = inputdlg(prompt,dlgtitle,dims,definput);

command_1 = str2double(command(1));

%% Forward Kinematics 
if command_1 == 1
    promptForward = {'Enter q1 (degrees)','Enter q2 (degrees)','Enter q3 (cm)'};
    dlgtitleForward = 'Forward Kinematic';
    inputAngles = inputdlg(promptForward,dlgtitleForward);
    inputAngles = str2double(inputAngles);
    

    
    q = [inputAngles(1),inputAngles(2),inputAngles(3)]
%     for i=1:3
%         q_ = input(q(i));
%          write(x,q_,"string")
%      end
    

%% Inverse Kinematics
elseif command_1 == 2
    promptInverse = {'Enter x (cm)','Enter y (cm)','Enter z (cm)','Inverse Kinematics Mode','Geometric Computation','Approximate calculation'};
    dlgtitleInverse = 'Inverse Kinematics';
    definput_inverse={'','','','','1','2'};
    inputPoints = inputdlg(promptInverse,dlgtitleInverse,[1 60],definput_inverse);
    inputPoints = str2double(inputPoints);
    E = [inputPoints(1),inputPoints(2),inputPoints(3)];
    if inputPoints(4) == 1
        %[q1,q2,q4] = Inverse_Kinematics_1(E(1),E(2),E(3));
        
        
        
    elseif inputPoints(4) == 2
        %[q1,q2,q4] = Inverse_Kinematics_2(E(1),E(2),E(3));

    end
%% Draw Line
elseif command_1 == 3
    promptLine = {'Mode','x = 15 : A(15,10) --> B(15,20)','A(xA,yA) --> B(xB,yB)'};
    dlgtitleLine = 'Draw Line';
    definput_Line = {'','1','2'};
    inputLines = inputdlg(promptLine, dlgtitleLine,[1 60], definput_Line);
    inputLines = str2double(inputLines);
    
    
    if inputLines(1) == 1
        %
    elseif inputLines(1) == 2
        promptNewLine = {'Limit(x) (cm)','Limit(y) (cm)','xA (cm)','yA (cm)','xB (cm)','yB (cm)'};
        dlgtitleNewLine = 'Draw Line A(xA,yA) --> B(xB,yB)';
        definput_NewLine = {'(-25 , 25)','(0 , 25)','','','',''};
        inputNewLine = inputdlg(promptNewLine,dlgtitleNewLine,[1 60],definput_NewLine);
        inputNewLine = str2double(inputNewLine)
        
        
    end
    
    
    
end

    

    
        
    
        
        
    


