% ��С���˷�����y=1/(ax+b)����Ϸ�ʽ
%����������ݵ㼰��ϵ㣬�������������Ӧ���ֵ
function L=ls1(x,y,p)
y1=y.^-1;
B=zeros(2,1);
C=zeros(2,2);
% ���췽�̾���C
C(1,1)=length(x);
temp=0;
for i=1:length(x)
    temp=temp+x(i);
end
C(1,2)=temp;
C(2,1)=temp;
temp=0;
for i=1:length(x)
    temp=temp+x(i)^2;
end
C(2,2)=temp;
% ���췽�̾���B
temp=0;
for i=1:length(y)
    temp=temp+y1(i);
end
B(1)=temp;
temp=0;
for i=1:length(y)
    temp=temp+x(i)*y1(i);
end
B(2)=temp;
a=inv(C)*B;
L=1/(a(1)+a(2)*p);