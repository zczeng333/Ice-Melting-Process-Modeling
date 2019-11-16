% ODE2子函数，修恩法微分方程组求解子函数
% 输入步长，输出融化时间，返回时间、水温、半径列向量
function [t,T,r]=ODE2(h)
% 定义常量(国际单位制)
% 求解微分方程
j=1;
t(1)=0; %定义初始时间
T(1)=23.6;%水温初值
r(1)=0.031;%半径初值
while r(j)>0 %求解常微分方程(半径大于0则过程持续)
    [temp1,temp2]=cal(T(j),r(j)); %计算导数值
    tempT=T(j)+temp1*h; %预估下一时刻水温值
    tempr=r(j)+temp2*h; %预估下一时刻半径值
    [temp3,temp4]=cal(tempT,tempr);
    [temp1,temp2]=cal(T(j),r(j));
    ek1=(temp1+temp3)/2; %修正后温度导数值
    ek2=(temp2+temp4)/2; %修正后半径导数值
    T(j+1)=T(j)+ek1*h;
    r(j+1)=r(j)+ek2*h; %应用修恩法递推公式
    t(j+1)=t(j)+h;
    j=j+1;
end
fprintf('修恩法求解结果为:融化时间t=%.2f,终值水温T=%.4f\n',t(j),T(j)); %输出结果
