function [ data ] = videoObjectDetection()
imaqreset


%Object detection using video input
vid = videoinput('winvideo',1,'MJPG_640x360');

set(vid,'FramesPerTrigger',Inf);
set(vid,'ReturnedColorspace','rgb');
vid.FrameGrabInterval = 10;

%display('Starting');
start(vid)
% set(handles.status,'String','Starting...');
% guidata(hObject, handles);
% pause(0.5);
% set(handles.status,'String','Place Your Face infront of the screen');
% guidata(hObject, handles);
tic
preview(vid)

display('Entering Loop')
while(vid.FramesAcquired <=10)
%     display(vid.FramesAcquired);
    data=getsnapshot(vid);   
 
end
%imshow(data)
%display('Closing Session');
stop(vid)
toc

end

