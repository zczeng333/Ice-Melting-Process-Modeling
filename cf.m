%���߲�ֵ��Ͻ��ʾ��ͼ�Ӻ���
%�����ֵ��ϵ���ֵ�������ͬ��ֵ��Ϸ�ʽ���߻���ͼ��
function cf(t,T)
min=1; %����ʱ������
max=850;%����ʱ������
testt=[70,221,360,516,670,780];
testT=[23.52,23.15,22.91,22.75,22.63,22.54];%�������ݵ�
%%
%ţ�ٲ�ֵ���������Ӧ��ɫ����
for i=min:max
    x(i-min+1)=i;
    y(i-min+1)=Newton(i);
end
er=0;
for i=1:6
    er=er+abs(Newton(testt(i))-testT(i))/testT(i);
end
er=er/6;
fprintf('ţ�ٷ���ֵƽ��������Ϊ%.2f%%\n',er*100);
figure(3);
plot(t,T,'r-o');
hold on
plot(x,y,'b');
legend('ʵ������','ţ�ٷ���ֵ���');
title 'ţ�ٷ���ֵ����ʾ��ͼ';
grid on;
hold off
%%
%����������ֵ�����
for i=min:max
    x(i-min+1)=i;
    S=spline3(i);
    y(i-min+1)=S(1);
    p(i-min+1)=S(2);
    q(i-min+1)=S(3);
end
er1=0;
er2=0;
er3=0;
for i=1:6
    S=spline3(testt(i));
    er1=er1+abs(S(1)-testT(i))/testT(i);
    er2=er1+abs(S(2)-testT(i))/testT(i);
    er3=er1+abs(S(3)-testT(i))/testT(i);
end
er1=er1/6;
er2=er2/6;
er3=er3/6;
fprintf('����������ֵ(һ�ױ߽�����)ƽ��������Ϊ%.2f%%\n',er1*100);
fprintf('����������ֵ(��Ȼ�߽�����)ƽ��������Ϊ%.2f%%\n',er2*100);
fprintf('����������ֵ(���ڱ߽�����)ƽ��������Ϊ%.2f%%\n',er3*100);
figure(4);
plot(t,T,'r-o');
hold on
plot(x,y,'b'); %һ�ױ߽��Ӧ��ɫ����
hold on;
plot(x,p,'b-.'); %��Ȼ�߽��Ӧ��ɫ�㻮��
hold on;
plot(x,q,'b:'); %���ڱ߽�������Ӧ��ɫ����
hold on;
legend('ʵ������','��������һ�ױ߽�����','����������Ȼ�߽�','�����������ڱ߽�');
title '����������ֵ����ʾ��ͼ';
grid on;
hold off
%%
%��С���˷�1/(ax+b)��Ͻ������Ӧ��ɫϸ��
for i=min:max
    x(i-min+1)=i;
    y(i-min+1)=ls1(t,T,i);
end
er=0;
for i=1:6
    er=er+abs(ls1(t,T,testt(i))-testT(i))/testT(i);
end
er=er/6;
fprintf('��С���˷�1/(ax+b)���ƽ��������Ϊ%.2f%%\n',er*100);
figure(5);
plot(t,T,'r-o');
hold on
plot(x,y,'b');
hold on;
%��С���˷�1/(ax^2+b)��Ͻ������Ӧ��ɫ�㻮��
for i=min:max
    x(i-min+1)=i;
    y(i-min+1)=ls2(t,T,i);
end
er=0;
for i=1:6
    er=er+abs(ls2(t,T,testt(i))-testT(i))/testT(i);
end
er=er/6;
fprintf('��С���˷�1/(ax^2+b)���ƽ��������Ϊ%.2f%%\n',er*100);
plot(x,y,'b-.');
hold on;
%��С���˷�ab^(-ex)��Ͻ������Ӧ��ɫ����
for i=min:max
    x(i-min+1)=i;
    y(i-min+1)=ls3(t,T,i);
end
er=0;
for i=1:6
    er=er+abs(ls3(t,T,testt(i))-testT(i))/testT(i);
end
er=er/6;
fprintf('��С���˷�ab^(-ex)���ƽ��������Ϊ%.2f%%\n',er*100);
plot(x,y,'b:');
hold on;
legend('ʵ������','��С���˷�1/(ax+b)','��С���˷�1/(ax^2+b)','��С���˷�ab^(-ex)');
title '��С���˷��������ʾ��ͼ';
grid on;
hold off