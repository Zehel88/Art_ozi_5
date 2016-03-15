function [K_open K_close]=KeyGen(P,Q)
% Модуль
N=P*Q;
% Функция Эйлера
fiN=(P-1)*(Q-1);
% Открытая экспонента
% 1) 1 < e < fiN
% 2) Взаимно простая с fiN
e=5;
% Закрытая экспонента
X=[0;1;fiN];
Y=[1;0;e];
while X(3)~=1 
   q=floor(X(3)/Y(3));
   Z=X-q*Y;
   X=Y;
   Y=Z;
end
d=mod(X(1),fiN);

% Открытый ключ
K_open=[e N];
% Закрытый ключ
K_close=[d N];