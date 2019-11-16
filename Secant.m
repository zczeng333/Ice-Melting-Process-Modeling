% 割线法求解子函数，输入区间，五位有效数字
function Secant(m,n)
a=m;
b=n;
er=1;
k=0;%记录迭代次数
t=5*10^(-5);%相对误差限
while (er>t)
    y1=equa1(a);
    y2=equa1(b);
    c=b-y2*(b-a)/(y2-y1); %新的迭代点数值
    a=b;
    b=c;
    er=abs((b-a)/b); %相对误差
    k=k+1;  %迭代次数
    x(k)=k;
    y(k)=er*100;
end
fprintf('割线法法求解\n');
fprintf('该方程近似根为:%.5f\n',b*180/pi);
fprintf('方程根的相对误差为:%.4f%%\n',er*100);
fprintf('迭代次数:%d\n\n',k);%输出结果