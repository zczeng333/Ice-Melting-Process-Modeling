% ����������Ӻ����������ʼ����ֵ�������ʼ����ֵ�������������Ƕ�
function FP_iteration(a)
i=0;
j=0;  %i,j���ڼ�¼a1,a2���ֲ���Ĵ���
k=0;  %k: record the time of iteration
a1=a;
k=0;
er=1;  %������
t=5*10^(-5);  %��������
while(er>t)
    a2=equa2(a1); %�µ�������ֵ
    er=abs((a2-a1)/a2);  %������
    k=k+1;  %��������
    a1=a2;
end
x=2*acos(a1)*180/pi; %�����ת��Ϊ�Ƕ�
fprintf('��������������\n');
fprintf('�÷��̽��Ƹ�Ϊ:%.5f\n',x);
fprintf('���̸���������Ϊ:%.4f%%\n',er*100);
fprintf('��������:%d\n\n',k);%������