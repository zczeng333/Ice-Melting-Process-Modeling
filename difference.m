%计算n阶差商的函数
%输入数据点及差商阶次，返回差商值
function a=difference(x,y,n)
j=1;
y2=y;
if(n==0)
    a=y(1);
end %零阶差商直接返回y(1)
while(n>=1)
    x1=zeros(length(x)-j,1); 
    for i=1:length(x)-j
        x1(i)=x(i+j)-x(i); %构造差商对应x列向量
    end 
    y1=diff(y2); %调用差分函数
    y2=y1./x1; %计算差商
    n=n-1;
    j=j+1;
end
a=y2;