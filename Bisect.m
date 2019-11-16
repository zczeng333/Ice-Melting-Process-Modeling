% 二分法求解子函数,输入区间值,五位有效数字
function S=Bisect(m,n)
t=5*10^-6; %设置绝对误差限
k=0; %记录迭代次数
a=m;
b=n; %记录求解区间
y1=equa1(a);
y2=equa1(b);%调用equa函数赋予初值
%二分法求解(当未达到精度时持续迭代)
if(y1*y2>0)%区间函数值同号则无解
    fprintf('该区间内无解\n');
end
while abs(b-a)>t
    c=(a+b)/2;
    %计算区间中点函数值
    y3=equa1(c);
    if(y1*y3<0)%若y1,y3异号,c赋值给b
        b=c;
    end
    if(y1*y3>0)%若y1,y3同号,c赋值给a
        a=c;
    end
    if(y3==0)%获得方程根
        a=c;
        b=c;
    end
    k=k+1;
end
c=(a+b)/2;
fprintf('二分法求解\n');
fprintf('该方程近似根为:%.5f\n',c*180/pi);
fprintf('方程根的绝对误差为:%.7f\n',(c-a));
fprintf('迭代次数:%d\n\n',k);%输出结果
