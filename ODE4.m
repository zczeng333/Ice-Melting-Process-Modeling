% ODE4子函数，五阶butcher公式龙格库塔法微分方程组求解子函数
% 输入步长最大值，输出融化时间，返回时间、水温、半径列向量
function [t,T,r]=ODE4(h)
% 定义常量(国际单位制)
tolerance=0.5*10^-6; %六位有效数字对应迭代相对误差限
tempa=0;
tempb=0;
er=1; %记录相对误差
while er>tolerance %未达到相对误差限则持续
    j=1;
    t(1)=0; %定义初始时间
    T(1)=23.6;%水温初值
    r(1)=0.031;%半径初值
    while r(j)>0 %求解常微分方程(半径大于0则过程持续)
        [temp1,temp2]=cal(T(j),r(j)); %导数k1数值
        tempT=T(j)+h*temp1/4;
        tempr=r(j)+h*temp2/4;
        [temp3,temp4]=cal(tempT,tempr); %导数k2数值
        tempT=T(j)+h*temp1/8+h*temp3/8;
        tempr=r(j)+h*temp2/8+h*temp4/8;
        [temp5,temp6]=cal(tempT,tempr);%导数k3数值
        tempT=T(j)-h*temp3/2+h*temp5;
        tempr=r(j)-h*temp4/2+h*temp6;
        [temp7,temp8]=cal(tempT,tempr); %导数k4数值
        tempT=T(j)+3*h*temp1/16+9*h*temp7/16;
        tempr=r(j)+3*h*temp2/16+9*h*temp8/16;
        [temp9,temp10]=cal(tempT,tempr); %导数k5数值
        tempT=T(j)-3*h*temp1/7+2*h*temp3/7+12*h*temp5/7-12*h*temp7/7+8*h*temp9/7;
        tempr=r(j)-3*h*temp2/7+2*h*temp4/7+12*h*temp6/7-12*h*temp8/7+8*h*temp10/7;
        [temp11,temp12]=cal(tempT,tempr); %导数k6数值
        ek1=(temp1*7+temp5*32+temp7*12+temp9*32+temp11*7)/90; %估计温度导数值
        ek2=(temp2*7+temp6*32+temp8*12+temp10*32+temp12*7)/90; %估计半径导数值
        T(j+1)=T(j)+ek1*h;
        r(j+1)=r(j)+ek2*h; %应用龙格库塔递推式
        t(j+1)=t(j)+h;
        j=j+1;
    end
    er=max(abs(t(j)-tempa)/t(j), abs(T(j)-tempb)/T(j));%计算相对误差
    tempa=t(j);
    tempb=T(j);
    h=h/2; %步长减半
end
h=h*2;
fprintf('改进龙格库塔法求解结果为:融化时间t=%.2f,终值水温T=%.4f,自适应步长h=%.4f\n',t(j),T(j),h); %输出结果