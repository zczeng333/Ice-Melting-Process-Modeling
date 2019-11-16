%曲线插值拟合结果示意图子函数
%输入插值拟合点数值，输出不同插值拟合方式曲线汇总图样
function cf(t,T)
min=1; %设置时间下限
max=850;%设置时间上限
testt=[70,221,360,516,670,780];
testT=[23.52,23.15,22.91,22.75,22.63,22.54];%评判数据点
%%
%牛顿插值法结果，对应绿色曲线
for i=min:max
    x(i-min+1)=i;
    y(i-min+1)=Newton(i);
end
er=0;
for i=1:6
    er=er+abs(Newton(testt(i))-testT(i))/testT(i);
end
er=er/6;
fprintf('牛顿法插值平均相对误差为%.2f%%\n',er*100);
figure(3);
plot(t,T,'r-o');
hold on
plot(x,y,'b');
legend('实验数据','牛顿法插值结果');
title '牛顿法插值曲线示意图';
grid on;
hold off
%%
%三次样条插值法结果
for i=min:max
    x(i-min+1)=i;
    S=spline3(i);
    y(i-min+1)=S(1);
    p(i-min+1)=S(2);
    q(i-min+1)=S(3);
end
er1=0;
er2=0;
er3=0;
for i=1:6
    S=spline3(testt(i));
    er1=er1+abs(S(1)-testT(i))/testT(i);
    er2=er1+abs(S(2)-testT(i))/testT(i);
    er3=er1+abs(S(3)-testT(i))/testT(i);
end
er1=er1/6;
er2=er2/6;
er3=er3/6;
fprintf('三次样条插值(一阶边界条件)平均相对误差为%.2f%%\n',er1*100);
fprintf('三次样条插值(自然边界条件)平均相对误差为%.2f%%\n',er2*100);
fprintf('三次样条插值(周期边界条件)平均相对误差为%.2f%%\n',er3*100);
figure(4);
plot(t,T,'r-o');
hold on
plot(x,y,'b'); %一阶边界对应蓝色曲线
hold on;
plot(x,p,'b-.'); %自然边界对应蓝色点划线
hold on;
plot(x,q,'b:'); %周期边界条件对应蓝色点线
hold on;
legend('实验数据','三次样条一阶边界条件','三次样条自然边界','三次样条周期边界');
title '三次样条插值曲线示意图';
grid on;
hold off
%%
%最小二乘法1/(ax+b)拟合结果，对应黑色细线
for i=min:max
    x(i-min+1)=i;
    y(i-min+1)=ls1(t,T,i);
end
er=0;
for i=1:6
    er=er+abs(ls1(t,T,testt(i))-testT(i))/testT(i);
end
er=er/6;
fprintf('最小二乘法1/(ax+b)拟合平均相对误差为%.2f%%\n',er*100);
figure(5);
plot(t,T,'r-o');
hold on
plot(x,y,'b');
hold on;
%最小二乘法1/(ax^2+b)拟合结果，对应黑色点划线
for i=min:max
    x(i-min+1)=i;
    y(i-min+1)=ls2(t,T,i);
end
er=0;
for i=1:6
    er=er+abs(ls2(t,T,testt(i))-testT(i))/testT(i);
end
er=er/6;
fprintf('最小二乘法1/(ax^2+b)拟合平均相对误差为%.2f%%\n',er*100);
plot(x,y,'b-.');
hold on;
%最小二乘法ab^(-ex)拟合结果，对应黑色点线
for i=min:max
    x(i-min+1)=i;
    y(i-min+1)=ls3(t,T,i);
end
er=0;
for i=1:6
    er=er+abs(ls3(t,T,testt(i))-testT(i))/testT(i);
end
er=er/6;
fprintf('最小二乘法ab^(-ex)拟合平均相对误差为%.2f%%\n',er*100);
plot(x,y,'b:');
hold on;
legend('实验数据','最小二乘法1/(ax+b)','最小二乘法1/(ax^2+b)','最小二乘法ab^(-ex)');
title '最小二乘法拟合曲线示意图';
grid on;
hold off