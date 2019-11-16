% 主函数
clc
clear
format long; %设置输出格式
%%
% 定义常量
h=50; %微分方程求解步长
t=[0,70,152,221,300,360,431,516,576,670,740,780,820];
T=[23.60,23.52,23.30,23.15,22.98,22.91,22.82,22.75,22.70,22.63,22.58,22.54,22.52 ];
%%
%求解非线性方程部分
Bisect(0,pi); %二分法求解
F_position(0,pi); %试位法求解
Secant(0,pi); %割线法求解
FP_iteration(0.5); %不动点迭代法求解
NR(0.5); %Newton-Raspon方法求解
fprintf('\n');
%%
%求解微分方程组部分
[t1,T1,r1]=ODE1(h); %调用欧拉法微分方程求解子函数
[t2,T2,r2]=ODE2(h); %调用维恩法微分方程求解子函数
[t3,T3,r3]=ODE3(h); %调用龙格库塔法微分方程求解子函数
[t4,T4,r4]=ODE4(1);%调用改进龙格库塔法微分方程求解子函数
figure(1) %绘制不同方法求解水温变化曲线
plot(t1,T1,'b:');
hold on;
plot(t2,T2,'r.');
hold on;
plot(t3,T3,'k-.');
legend('欧拉法求解结果','修恩法求解结果','龙格库塔法求解结果');
title '水温变化曲线';
xlabel 'Time(s)';
ylabel '温度(℃)';
grid on;
hold off;
figure(2) %绘制不同方法求解半径变化曲线
plot(t1,r1,'b');
hold on;
plot(t2,r2,'r');
hold on;
plot(t3,r3,'k');
legend('欧拉法求解结果','修恩法求解结果','龙格库塔法求解结果');
title '半径变化曲线';
xlabel 'Time(s)';
ylabel '半径(mm)';
grid on;
hold off;
fprintf('\n\n');
%%
% 插值拟合温度曲线部分
cf(t,T); %调用曲线插值拟合结果示意图子函数
%%
%模型评价环节
figure(6);
plot(t4,T4,'b-.');
hold on; %绘制改进龙格库塔法求解结果
for i=1:765
    x(i)=i;
    y(i)=Newton(i);
end
plot(x,y,'r-.'); %绘制Newton法插值实验数据曲线
legend('模型结果','实验结果');
title '模型评价示意图';
xlabel 'Time(s)';
ylabel '温度(℃)';
grid on;
hold off