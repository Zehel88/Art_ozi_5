function [K_open K_close]=KeyGen(P,Q)
% ������
N=P*Q;
% ������� ������
fiN=(P-1)*(Q-1);
% �������� ����������
% 1) 1 < e < fiN
% 2) ������� ������� � fiN
e=5;
% �������� ����������
X=[0;1;fiN];
Y=[1;0;e];
while X(3)~=1 
   q=floor(X(3)/Y(3));
   Z=X-q*Y;
   X=Y;
   Y=Z;
end
d=mod(X(1),fiN);

% �������� ����
K_open=[e N];
% �������� ����
K_close=[d N];