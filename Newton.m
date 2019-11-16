% Newton插值法子函数
%输入插值点，返回插值点函数值
function N=Newton(p)
x=[0,152,300,431,576,740,820];
y=[23.60,23.30,22.98,22.82,22.70,22.58,22.52]; %插值数据点
s=length(x); %记录数据点个数
a=zeros(s,1); %构造系数列向量
N=0;
for i=0:s-1
    m=zeros(i+1,1);
    n=zeros(i+1,1); %构造不同阶次差商的输入列向量
    for j=1:i+1
        m(j)=x(j);
        n(j)=y(j);
    end
    a(i+1)=difference(m,n,i); %调用差商子函数
end
for i=1:s
    temp=a(i);
    for j=1:i-1
        temp=temp*(p-x(j)); %计算第i个基函数
    end
    N=N+temp; %对基函数求和得最终结果
end