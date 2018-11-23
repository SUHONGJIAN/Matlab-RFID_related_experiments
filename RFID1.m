function varargout = RFID1(varargin)
% RFID1 MATLAB code for RFID1.fig
%      RFID1, by itself, creates a new RFID1 or raises the existing
%      singleton*.
%
%      H = RFID1 returns the handle to a new RFID1 or the handle to
%      the existing singleton*.
%
%      RFID1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RFID1.M with the given input arguments.
%
%      RFID1('Property','Value',...) creates a new RFID1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RFID1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RFID1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help RFID1
 
% Last Modified by GUIDE v2.5 28-May-2017 14:59:23
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RFID1_OpeningFcn, ...
                   'gui_OutputFcn',  @RFID1_OutputFcn, ...
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
 
 
% --- Executes just before RFID1 is made visible.
function RFID1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RFID1 (see VARARGIN)
 
% Choose default command line output for RFID1
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
 
% UIWAIT makes RFID1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = RFID1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A = randi([0,1],30,8);%1000*8???¨²???¨®
B = unique(A,'rows');%?????????¨°??????????????
M=size(B,1);%B???¨®??????
r = randperm(M);%??1??M?????????¨²?¨°????????????¡Á??¨°??
label=B(r,:);%??B???????¨°?????¨°
a=1:1:25;
time=ones(30,25);
lasttime=ones(1,25);
tag_count=str2double(get(handles.edit1,'String'));
tag_count1=tag_count;
new_label11=zeros(tag_count1,8);
new_label12=zeros(1,8);
count=0;
for ww=1:30
   for ee=1:25 
      n=a(ee);
      new_label=label(1:n,:);
      nlabel=label(1:n,:);
      if ww==1&&n==tag_count
         nlabel11 = num2str(nlabel);
         set(handles.edit2,'String',nlabel11);
      end
      %disp(new_label);
      tic;
      while n>0
         new_n=n;
         while new_n>1 
            [new_bit,new_max]=request(new_label,new_n);%?¡§??????¡Á???¡Á???????
            [new_label2,new_n]=select(new_label,new_bit,new_max,new_n);%????¡À???¡Á???????
            new_label=new_label2;
         end
        % disp(new_label); 
         if ww==1&&n==tag_count1
             count=count+1;
             %bb=[a(1,:);b]
             new_label12 = [new_label12;new_label];
             tag_count1=tag_count1-1;
             
         end
 
        [n,nlabel]=unselect(new_label,nlabel,n); %????¡Á???????????????
        new_label=nlabel;
     end
     time(ww,ee)=toc;
 
   end
end
         new_label12=new_label12(2:end,:);
         new_label12=num2str(new_label12);
         set(handles.edit3,'String',new_label12);
for oo=1:25
    lasttime(oo)= sum(time(:,oo))/30;
end
disp(lasttime);
plot(a,lasttime,'o-b');
xlabel('label');
ylabel('time');
guidata(hObject, handles);
 
 
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
input = get(hObject,'String');
tags = str2num(input);
if (isempty(tags))     
    set(hObject,'String','1')
end
    guidata(hObject, handles);
 
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
 
 
% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
 
 
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
