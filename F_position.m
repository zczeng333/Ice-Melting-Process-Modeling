%�Ľ���λ������Ӻ������������䣬��λ��Ч����
function F_position(m,n)
i=0;
j=0; %i,j���ڼ�¼a��b���ֲ���Ĵ���
k=0; %k���ڼ�¼��������
t=5*10^(-6);%���������
a=m;
b=n;
y1=equa1(a);
y2=equa1(b);%������ֵ
if y1*y2>0 %����ͬ�����޽�
    fprintf('���������޽�\n');
end
d=abs(b-a);
% ��δ�ﵽ���辫��ʱ����������
while d>=t
    c=b-y2*(a-b)/(y1-y2);
    %������λ�����c����ֵ
    y3=equa1(c);
    if y1*y3<0 %��y1,y2��ţ�c��ֵ��b
        b=c;
        y2=equa1(b); %����y2��ֵ
        i=i+1;
        j=0;
    end
    if y1*y3>0 %��y1,y2ͬ�ţ�c��ֵ��a
        a=c;
        y1=equa1(a); %����y1��ֵ
        j=j+1;
        i=0;
    end
    if y3==0 %��÷��̸�
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
fprintf('��λ�����\n');
fprintf('�÷��̽��Ƹ�Ϊ:%.5f\n',c*180/pi);
fprintf('���̸��ľ������Ϊ:%.7f\n',(b-a));
fprintf('��������:%d\n\n',k);%������