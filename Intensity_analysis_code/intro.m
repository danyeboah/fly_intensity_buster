function intro(varargin)
% INTRO MATLAB code for intro.fig
%      INTRO, by itself, creates a new INTRO or raises the existing
%      singleton*.
%
%      H = INTRO returns the handle to a new INTRO or the handle to
%      the existing singleton*.
%
%      INTRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTRO.M with the given input arguments.
%
%      INTRO('Property','Value',...) creates a new INTRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before intro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to intro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help intro

% Last Modified by GUIDE v2.5 02-Oct-2014 22:55:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @intro_OpeningFcn, ...
                   'gui_OutputFcn',  @intro_OutputFcn, ...
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


% --- Executes just before intro is made visible.
function intro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to intro (see VARARGIN)

% Choose default command line output for intro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.id,'string',varargin{1});

gene_inv = varargin{2};
arr = strcat(gene_inv,'_all');

set(handles.lo_gene,'string',gene_inv);
set(handles.hi_gene,'string',gene_inv);

set(handles.lo_arr,'string',arr);
set(handles.hi_arr,'string',arr);


% UIWAIT makes intro wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function intro_OutputFcn(hObject, eventdata, handles)     %%%%%%%%%%%%%%%%%%%%%%%%%%
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
%varargout{1} = handles.output;




% --- Executes on button press in Proceed.
function Proceed_Callback(hObject, eventdata, handles)
% hObject    handle to Proceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% obtain info from fields
id = get(handles.id,'string');
geno = get(handles.geno,'string');
age = get(handles.age,'string');
obj = get(handles.obj,'string');
flip = get(handles.flip,'string');

lo_number = get(handles.lo_number,'string');
hi_number = get(handles.hi_number,'string');
lo_arr = get(handles.lo_arr,'string');
hi_arr = get(handles.hi_arr,'string');
lo_gene = get(handles.lo_gene,'string');
hi_gene = get(handles.hi_gene,'string');
lo_flo = get(handles.lo_flo,'string');
hi_flo = get(handles.hi_flo,'string');
lo_PMT = get(handles.lo_PMT,'string');
hi_PMT = get(handles.hi_PMT,'string');
lo_frame = get(handles.lo_frame,'string');
hi_frame = get(handles.hi_frame,'string');
lo_suffix = get(handles.lo_suffix,'string');
hi_suffix = get(handles.hi_suffix,'string');

tagwriter(id,geno,age,obj,flip,lo_number,hi_number,lo_arr,hi_arr,lo_gene,hi_gene,lo_flo,hi_flo,lo_PMT,hi_PMT,lo_frame,hi_frame,lo_suffix,hi_suffix);


close;

uiresume();

% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
error('TRY AGAIN');

% --- Executes during object creation, after setting all properties.
function id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function id_Callback(hObject, eventdata, handles)
% hObject    handle to id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of id as text
%        str2double(get(hObject,'String')) returns contents of id as a double
