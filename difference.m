%����n�ײ��̵ĺ���
%�������ݵ㼰���̽״Σ����ز���ֵ
function a=difference(x,y,n)
j=1;
y2=y;
if(n==0)
    a=y(1);
end %��ײ���ֱ�ӷ���y(1)
while(n>=1)
    x1=zeros(length(x)-j,1); 
    for i=1:length(x)-j
        x1(i)=x(i+j)-x(i); %������̶�Ӧx������
    end 
    y1=diff(y2); %���ò�ֺ���
    y2=y1./x1; %�������
    n=n-1;
    j=j+1;
end
a=y2;