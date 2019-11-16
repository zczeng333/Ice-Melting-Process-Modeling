% Newton-Rapson迭代子函数，输入初始迭代值，输入初始迭代值，返回最终求解角度
function NR(a)
i=0;
j=0;  %i,j用于记录a1,a2保持不变的次数
k=0;  %k用于记录迭代次数
a1=a;
k=0;
er=1;  %相对误差
t=5*10^(-5);  %r相对误差限
while(er>t)
    a2=a1-equa3(a1); %新迭代点数值
    er=abs((a2-a1)/a2);  %相对误差
    k=k+1;  %迭代次数
    a1=a2;
end
x=2*acos(a1)*180/pi; %将输出转化为角度
fprintf('Newton-Raspon迭代法求解\n');
fprintf('该方程近似根为:%.5f\n',x);
fprintf('方程根的相对误差为:%.4f%%\n',er*100);
fprintf('迭代次数:%d\n\n',k);%输出结果