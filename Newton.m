% Newton��ֵ���Ӻ���
%�����ֵ�㣬���ز�ֵ�㺯��ֵ
function N=Newton(p)
x=[0,152,300,431,576,740,820];
y=[23.60,23.30,22.98,22.82,22.70,22.58,22.52]; %��ֵ���ݵ�
s=length(x); %��¼���ݵ����
a=zeros(s,1); %����ϵ��������
N=0;
for i=0:s-1
    m=zeros(i+1,1);
    n=zeros(i+1,1); %���첻ͬ�״β��̵�����������
    for j=1:i+1
        m(j)=x(j);
        n(j)=y(j);
    end
    a(i+1)=difference(m,n,i); %���ò����Ӻ���
end
for i=1:s
    temp=a(i);
    for j=1:i-1
        temp=temp*(p-x(j)); %�����i��������
    end
    N=N+temp; %�Ի�������͵����ս��
end