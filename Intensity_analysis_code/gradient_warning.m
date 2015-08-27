function varargout = gradient_warning(x1,x2,y1,y2)
% GRADIENT_WARNING MATLAB code for gradient_warning.fig
%      GRADIENT_WARNING, by itself, creates a new GRADIENT_WARNING or raises the existing
%      singleton*.
%
%      H = GRADIENT_WARNING returns the handle to a new GRADIENT_WARNING or the handle to
%      the existing singleton*.
%
%      GRADIENT_WARNING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRADIENT_WARNING.M with the given input arguments.
%
%      GRADIENT_WARNING('Property','Value',...) creates a new GRADIENT_WARNING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gradient_warning_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gradient_warning_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gradient_warning

% Last Modified by GUIDE v2.5 30-Sep-2014 22:32:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gradient_warning_OpeningFcn, ...
                   'gui_OutputFcn',  @gradient_warning_OutputFcn, ...
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


% --- Executes just before gradient_warning is made visible.
function gradient_warning_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gradient_warning (see VARARGIN)

% Choose default command line output for gradient_warning
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gradient_warning wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gradient_warning_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Recalculate_grad.
function Recalculate_grad_Callback(hObject, eventdata, handles,x1,x2,y1,y2)
% hObject    handle to Recalculate_grad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in Proceed_button.
function Proceed_button_Callback(hObject, eventdata, handles)
% hObject    handle to Proceed_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
