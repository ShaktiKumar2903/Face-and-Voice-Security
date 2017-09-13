function [] = MySecuritySystem()


%hand1=hand;
status=0;
limit=0;
authenflag=0;

% set(handles.status,'String','Stage One Authentication Begins');
% guidata(hObject, handles);
while status~=1
% Step 1: Read Images
% Read the reference image containing the object of interest.
boxImage = imread('myface.jpg');
boxImage = rgb2gray(boxImage);
% figure;
% imshow(boxImage);
% title('My Face');


% Read the target image containing a cluttered scene.
sceneImage = videoObjectDetection();
sceneImage = rgb2gray(sceneImage);
% figure; 
% imshow(sceneImage);
% title('Database of my face');

% Step 2: Detect Feature Points
% Detect feature points in both images.
boxPoints = detectSURFFeatures(boxImage);
scenePoints = detectSURFFeatures(sceneImage);


% Visualize the strongest feature points found in the reference image.
% figure; 
% imshow(boxImage);
% title('100 Strongest Feature Points from Box Image');
% hold on;
% plot(selectStrongest(boxPoints, 100));

 
% Visualize the strongest feature points found in the target image.
% figure; 
% imshow(sceneImage);
% title('300 Strongest Feature Points from Scene Image');
% hold on;
% plot(selectStrongest(scenePoints, 300));

% Step 3: Extract Feature Descriptors
% Extract feature descriptors at the interest points in both images.
[boxFeatures, boxPoints] = extractFeatures(boxImage, boxPoints);
[sceneFeatures, scenePoints] = extractFeatures(sceneImage, scenePoints);

% Step 4: Find Putative Point Matches
% Match the features using their descriptors. 
boxPairs = matchFeatures(boxFeatures, sceneFeatures);

 
% Display putatively matched features. 
matchedBoxPoints = boxPoints(boxPairs(:, 1), :);
matchedScenePoints = scenePoints(boxPairs(:, 2), :);
figure;
showMatchedFeatures(boxImage, sceneImage, matchedBoxPoints, ...
    matchedScenePoints, 'montage');
title('Putatively Matched Points (Including Outliers)');

%Condition for authentication
if length(boxPairs) > 16 
    
    audio1=audioread('Hello.wav');
    soundsc(audio1,45000);
    %display('Welcome Koushik')
    imaqreset;
    status=1;
    authenflag=1;
%     set(handles.status,'String','Stage One Authentication Complete');
%     guidata(hObject, handles);
else
        audio3=audioread('FryingPanImpact.wav');
        soundsc(audio3,45000);
        boxPairs=0;
        %display('Does not match. Enter again')
%         set(handles.status,'String','Does not match. Enter again');
%         guidata(hObject, handles);
        status=0;
        limit=limit+1;
        
        if limit==3
            audio2=audioread('IntruderAlert.wav');
            soundsc(audio2,45000);
%             set(handles.status,'String','You are not an authenticated user');
%             guidata(hObject, handles);
            break;
        end
                   
    
end


% % Step 5: Locate the Object in the Scene Using Putative Matches
% % |estimateGeometricTransform| calculates the transformation relating the
% % matched points, while eliminating outliers. This transformation allows us
% % to localize the object in the scene.
% [tform, inlierBoxPoints, inlierScenePoints] = ...
%     estimateGeometricTransform(matchedBoxPoints, matchedScenePoints, 'affine');
% 
% 
% % Display the matching point pairs with the outliers removed
% figure;
% showMatchedFeatures(boxImage, sceneImage, inlierBoxPoints, ...
%     inlierScenePoints, 'montage');
% title('Matched Points (Inliers Only)');


% % Get the bounding polygon of the reference image.
% boxPolygon = [1, 1;...                           % top-left
%         size(boxImage, 2), 1;...                 % top-right
%         size(boxImage, 2), size(boxImage, 1);... % bottom-right
%         1, size(boxImage, 1);...                 % bottom-left
%         1, 1];                   % top-left again to close the polygon
% 
% 
% % Transform the polygon into the coordinate system of the target image.
% % The transformed polygon indicates the location of the object in the
% % scene.
% newBoxPolygon = transformPointsForward(tform, boxPolygon);    
% 
% 
% % Display the detected object.
% figure;
% imshow(sceneImage);
% hold on;
% line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
% title('Detected Box');

end

if authenflag==1
    voicevalidation();
end


end

