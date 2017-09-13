function varargout = SecuritySystem(varargin)
% SECURITYSYSTEM MATLAB code for SecuritySystem.fig
%      SECURITYSYSTEM, by itself, creates a new SECURITYSYSTEM or raises the existing
%      singleton*.
%
%      H = SECURITYSYSTEM returns the handle to a new SECURITYSYSTEM or the handle to
%      the existing singleton*.
%
%      SECURITYSYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECURITYSYSTEM.M with the given input arguments.
%
%      SECURITYSYSTEM('Property','Value',...) creates a new SECURITYSYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SecuritySystem_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SecuritySystem_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SecuritySystem

% Last Modified by GUIDE v2.5 14-Nov-2016 14:58:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SecuritySystem_OpeningFcn, ...
                   'gui_OutputFcn',  @SecuritySystem_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SecuritySystem is made visible.
function SecuritySystem_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SecuritySystem (see VARARGIN)

% Choose default command line output for SecuritySystem
handles.output = hObject;

% create an axes that spans the whole gui

ah = axes('unit', 'normalized', 'position', [0 0 1 1]);

% import the background image and show it on the axes

bg = imread('manthinking.jpg'); imagesc(bg);

% prevent plotting over the background and turn the axis off

set(ah,'handlevisibility','off','visible','off')

% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SecuritySystem wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SecuritySystem_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in authen.
function authen_Callback(hObject, eventdata, handles)
% hObject    handle to authen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.status,'String','Stage One Authentication');

% guidata(hObject, handles);
%hand=handles.status;
MySecuritySystem();
%doubt();
