% ���߷�����Ӻ������������䣬��λ��Ч����
function Secant(m,n)
a=m;
b=n;
er=1;
k=0;%��¼��������
t=5*10^(-5);%��������
while (er>t)
    y1=equa1(a);
    y2=equa1(b);
    c=b-y2*(b-a)/(y2-y1); %�µĵ�������ֵ
    a=b;
    b=c;
    er=abs((b-a)/b); %������
    k=k+1;  %��������
    x(k)=k;
    y(k)=er*100;
end
fprintf('���߷������\n');
fprintf('�÷��̽��Ƹ�Ϊ:%.5f\n',b*180/pi);
fprintf('���̸���������Ϊ:%.4f%%\n',er*100);
fprintf('��������:%d\n\n',k);%������