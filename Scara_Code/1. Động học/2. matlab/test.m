clear all;

x = serialport('COM3',9600);

%%fopen(x);
go = true;
while go
    a = input('nhap: ');
    %%fprintf(x,a);
    %%fscanf(x)
    write(x,a,"string")
    read(x,6,"string")
    if (a == -1) 
        go = false;
    end
end

%%fclose(x);
clear all; 
