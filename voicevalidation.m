function [] = voicevalidation()
clc
commandwindow
inc=0;
pause on
% y=zeros(16000,4);
flag=0;

recobj=audiorecorder(6000,8,1);
while flag==0
display('You are required to tell your passcode to gain access')
% set(handles.status,'String','Speak your passcode one by one to gain access');
% guidata(hObject, handles);
pause(0.5);
% for i=1:4
disp('Tell digit number 1')
% set(handles.status,'String','Speak your 1st digit number once recording starts');
% guidata(hObject, handles);
pause(1);
disp('Recording started')
% set(handles.status,'String','Recording StarStringted');
% guidata(hObject, handles);
recordblocking(recobj,2);
disp('Recording has ended')
% set(handles.status,'String','Recording Ended');
% guidata(hObject, handles);
y1=getaudiodata(recobj); %16000x1

% clc

disp('Tell digit number 2')
% set(handles.status,'','Speak your 2nd digit ');
% guidata(hObject, handles);
pause(1);
disp('Recording started')
% set(handles.status,'String','Recording Started');
% guidata(hObject, handles);
recordblocking(recobj,2);
disp('Recording has ended')
% set(handles.status,'String','Recording Ended');
% guidata(hObject, handles);
y2=getaudiodata(recobj); %16000x1
% clc

disp('Tell digit number 3')
% set(handles.status,'String','Speak your 3rd digit ');
% guidata(hObject, handles);
pause(1);
disp('Recording started')
% set(handles.status,'String','Recording Started');
% guidata(hObject, handles);
recordblocking(recobj,2);
disp('Recording has ended')
% set(handles.status,'String','Recording Ended');
% guidata(hObject, handles);
y3=getaudiodata(recobj); %16000x1
% clc

disp('Tell digit number 4')
% set(handles.status,'String','Speak your 4th digit ');
% guidata(hObject, handles);
pause(1);
disp('Recording started')
% set(handles.status,'String','Recording Started');
% guidata(hObject, handles);
recordblocking(recobj,2);
disp('Recording has ended')
% set(handles.status,'String','Recording Ended');
% guidata(hObject, handles);
y4=getaudiodata(recobj); %16000x1

d1=che(y1);
d2=che(y2);
d3=che(y3);
d4=che(y4);

thre=mean([d1,d2,d3,d4]);

e1=check2(y1(:,1),thre);
e2=check2(y2(:,1),thre);
e3=check2(y3(:,1),thre);
e4=check2(y4(:,1),thre);

e1
e2
e3
e4
if e1==1 && e2==6 && e3==1 && e4==6
    display('AUTHENTICATION SUCCESSFUL')
    aud=audioread('Hello.wav');
    soundsc(aud,45000);
%     set(handles.status,'String','AUTHENTICATION SUCCESSFUL');
%     guidata(hObject, handles);
%     pause(1);
%     set(handles.status,'String','Stage two authentication complete.');
%     guidata(hObject, handles);
    pause(3.5);    
    clc
    flag=1;
else
    disp('PASSWORD MISMATCH. ENTER AGAIN')
    warn=audioread('FryingPanImpact.wav');
        soundsc(warn,45000);
%     set(handles.status,'String','Password Mismatch. Enter again.');
%     guidata(hObject, handles);
    inc=inc+1;
    if inc>3
        warn2=audioread('IntruderAlert.wav');
        soundsc(warn2,45000);
%         set(handles.status,'String','You are not an authenticated user');
%         guidata(hObject, handles);
        break;
    end
end
end



end

