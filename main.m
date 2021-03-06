% ����������������� �����
function varargout = main(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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

function main_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = main_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
% =========================================================================
% ������������� ���� ����� ���������
function eM_Callback(hObject, eventdata, handles)
function eM_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% ������������� ���� ������ �����������
function eS_Callback(hObject, eventdata, handles)
function eS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% ����������
function pushbutton1_Callback(hObject, eventdata, handles)
clc
% ���������� ������ ��� �������� �������� P Q
[K_open K_close]=KeyGen(3,19)
% ����������
M=get(handles.eM,'String');
M=unicode2native(M);
M=dec2bin(M,8)
M=reshape(M',1,numel(M));
n=numel(M);
% ������������ ����� ��� 
% �������� ��������� � ������ ������� �������
k=floor(log2(K_open(2)))
if mod(n,k)~=0
    z=k-mod(n,k)
    buf=M(end-mod(n,k)+1:end)
    M(end-mod(n,k)+1:end)=''
    M=strcat(M,dec2bin(0,z),buf)
    numel(M)
    M=reshape(M,k,numel(M)/k)'
else
   M=reshape(M,k,n/k)'
end
M=bin2dec(M)'
% ������� ������������� ���������� RSA
S=double(mod(sym(M).^K_open(1),sym(K_open(2))))
set(handles.eS,'String',num2str(S))

% �����������
M2=double(mod(sym(S).^K_close(1),sym(K_close(2))))

M2=dec2bin(M2)

M2=reshape(M2',1,numel(M2))
buf=M2(end-mod(n,k)+1:end);
M2(end-k+1:end)='';
M2=strcat(M2,buf);
M2=reshape(M2,8,numel(M2)/8)'
M2=bin2dec(M2)'
set(handles.eM2,'String',native2unicode(M2))



function eM2_Callback(hObject, eventdata, handles)
function eM2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
