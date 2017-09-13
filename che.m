function [ave] = che(x3)
s=0;
%1st input

x1=audioread('one1dk.wav');
t1 = 1;
peaks1=zeros(1,length(x1)-1);
for j=2:length(x1)-1
    if x1(j)>x1(j-1) && x1(j)>x1(j+1) && x1(j)>0
        peaks1(t1)=x1(j);
        t1=t1+1;        
    else
     peaks1(t1)=0;
     t1=t1+1;
    end
end

logic = find(peaks1 ~= 0);
ma1 = zeros(size(peaks1));
ma1(logic) = abs(peaks1(logic));
t1 = length(ma1);

for k = 1:length(logic)-1
    m0 = logic(k);
    m1 = logic(k+1);
    dy = ma1(m1) - ma1(m0);
    dx = m1 - m0;
    ma1(m0+1:m1-1) = dy/dx * (1:m1 - m0 - 1) + ma1(m0);
end

%Normalising ma1
ma1=ma1./max(ma1);

% figure
% subplot(2,1,1)
% plot(ma1)
% title('ED - 1st Input');

%2nd input
x2=audioread('six1dk.wav');
t1 = 1;
peaks2=zeros(1,length(x2)-1);
for j=2:length(x2)-1
    if x2(j)>x2(j-1) && x2(j)>x2(j+1) && x2(j)>0
        peaks2(t1)=x2(j);
        t1=t1+1;        
    else
     peaks2(t1)=0;
     t1=t1+1;
    end
end

logic = find(peaks2 ~= 0);
ma2 = zeros(size(peaks2));
ma2(logic) = abs(peaks2(logic));
t1 = length(ma2);

for k = 1:length(logic)-1
    m0 = logic(k);
    m1 = logic(k+1);
    dy = ma2(m1) - ma2(m0);
    dx = m1 - m0;
    ma2(m0+1:m1-1) = dy/dx * (1:m1 - m0 - 1) + ma2(m0);
end

%Normalising ma2
ma2=ma2./max(ma2);

% subplot(2,1,2)
% plot(ma2)
% title('ED - 2nd Input');

correl11=xcorr(ma1,ma2);
l=length(correl11);
t=(-(l-1)/2):1:((l-1)/2);
t=t';

% figure('name','Xcorr61')
% plot(t,correl11)
% title('Correlation - ma1, ma2')

%3rd input
peaks3=zeros(1,length(x3)-1);
t1 = 1;
for j=2:length(x3)-1
    if x3(j)>x3(j-1) && x3(j)>x3(j+1) && x3(j)>0
        peaks3(t1)=x3(j);
        t1=t1+1;        
    else
     peaks3(t1)=0;
     t1=t1+1;
    end
end

logic = find(peaks3 ~= 0);
ma3 = zeros(size(peaks3));
ma3(logic) = abs(peaks3(logic));
t1 = length(ma3);

for k = 1:length(logic)-1
    m0 = logic(k);
    m1 = logic(k+1);
    dy = ma3(m1) - ma3(m0);
    dx = m1 - m0;
    ma3(m0+1:m1-1) = dy/dx * (1:m1 - m0 - 1) + ma3(m0);
end

%Normalising ma3
ma3=ma3./max(ma3);
% figure
% plot(ma3)
% title('ED - 6 as Input');
% disp('corel of ma1,ma3')

correl16=xcorr(ma1,ma3);
l=length(correl16);
t=(-(l-1)/2):1:((l-1)/2);
t=t';

% figure('name','XCorr66')
% plot(t,correl16)
% title('Correlation-ma1 & ma3')

top =[max(correl11) max(correl16)]; %ma1,ma2 & ma1,ma3
ave=mean(top);

% if top(1) < top(2) && ave>157
%     display('1 Detected')
%     s=1;
% else 
%     if top(2) > top(1) && ave<157
%         s=6;
%         display('6 Detected');
%     end
% end

end