clear
close all

b=-0.2; %initial bias
p=0.7; %probability of moving towards A
s=0.05; %step size

A=1;
B=-1;
y=[-0.2];

%PART 1   
while y(end)<1 && y(end)>-1
    x=randp(p);
    if x==1
        b=b+s;
        y=[y b];

    elseif x==0
        b = b-s;
        y =[y b];
    end
end
o=y(end);
o;


%PART 2
stairs(y)
yline(-1)
yline(0)
yline(1)
xlim([0 length(y+1)])
ylim([-1.1 1.1])
xlabel('Time') 
ylabel('Preference') 


%EXTRA CREDIT
%RT Histogram
responseTime =[0];
for i=1:1000
    Y=[-0.2];
    b1=-0.2;
    while Y(end)<1 && Y(end)>-1
        x=randp(p);
        if x==1
            b1=b1+s;
            Y=[Y b1];

        elseif x==0
            b1 = b1-s;
            Y =[Y b1];
        end
    end
    rt = length(Y);
    responseTime= [responseTime rt];
end
responseTime(1)=[];
responseTime;

figure
histogram(responseTime)
xlabel('Time') 
ylabel('Frequency')



function r=randp(p)
    r=(rand-(1-p))>0;
end

