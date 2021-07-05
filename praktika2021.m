clc;
clear;
%% Константы
n = 100;
alpha1 = 1;
alpha2 = 1;
beta1 = 1;
beta2 = 0.1;
x1_star = 10;
T=1;
h=0.1;
%%
x1 = zeros(1,n);
x2 = zeros(1,n);
% Начальные значения кол-ва жертв и хищников
x1(1)=5;
x2(1)=3;
%% Управление
u = @(x1,x2) (-alpha1.*x1+beta1.*x1.*x2 - ((x1-x1_star)./(T)));
%% Цикл
for i=2:n
    x1(i) = x1(i-1)+h.*((alpha1.*x1(i-1)-beta1.*x1(i-1).*x2(i-1))+ u(x1(i-1), x2(i-1)));
    x2(i) = x2(i-1)+h.*(-alpha2.*x2(i-1)+beta2.*x1(i-1).*x2(i-1));
end
%% График
t=1:1:n;
plot(t,x1,t,x2);
legend('Жертвы', 'Хищник');
