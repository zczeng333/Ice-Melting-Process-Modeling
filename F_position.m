%改进试位法求解子函数，输入区间，五位有效数字
function F_position(m,n)
i=0;
j=0; %i,j用于记录a，b保持不变的次数
k=0; %k用于记录迭代次数
t=5*10^(-6);%绝对误差限
a=m;
b=n;
y1=equa1(a);
y2=equa1(b);%给定初值
if y1*y2>0 %区间同号则无解
    fprintf('该区间内无解\n');
end
d=abs(b-a);
% 当未达到所需精度时，持续迭代
while d>=t
    c=b-y2*(a-b)/(y1-y2);
    %根据试位法求解c点数值
    y3=equa1(c);
    if y1*y3<0 %当y1,y2异号，c赋值给b
        b=c;
        y2=equa1(b); %更新y2数值
        i=i+1;
        j=0;
    end
    if y1*y3>0 %当y1,y2同号，c赋值给a
        a=c;
        y1=equa1(a); %更新y1数值
        j=j+1;
        i=0;
    end
    if y3==0 %获得方程根
        a=c;
        b=c;
    end
    if i==2
        y1=y1/2;
        i=0;
    end
    if j==2
        y2=y2/2;
        j=0;
    end
    d=abs(b-a);
    k=k+1;
end
y1=equa1(a);
y2=equa1(b);
c=b-y2*(a-b)/(y1-y2);
fprintf('试位法求解\n');
fprintf('该方程近似根为:%.5f\n',c*180/pi);
fprintf('方程根的绝对误差为:%.7f\n',(b-a));
fprintf('迭代次数:%d\n\n',k);%输出结果