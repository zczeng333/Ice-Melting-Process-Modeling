% ODE4�Ӻ��������butcher��ʽ���������΢�ַ���������Ӻ���
% ���벽�����ֵ������ڻ�ʱ�䣬����ʱ�䡢ˮ�¡��뾶������
function [t,T,r]=ODE4(h)
% ���峣��(���ʵ�λ��)
tolerance=0.5*10^-6; %��λ��Ч���ֶ�Ӧ������������
tempa=0;
tempb=0;
er=1; %��¼������
while er>tolerance %δ�ﵽ�������������
    j=1;
    t(1)=0; %�����ʼʱ��
    T(1)=23.6;%ˮ�³�ֵ
    r(1)=0.031;%�뾶��ֵ
    while r(j)>0 %��ⳣ΢�ַ���(�뾶����0����̳���)
        [temp1,temp2]=cal(T(j),r(j)); %����k1��ֵ
        tempT=T(j)+h*temp1/4;
        tempr=r(j)+h*temp2/4;
        [temp3,temp4]=cal(tempT,tempr); %����k2��ֵ
        tempT=T(j)+h*temp1/8+h*temp3/8;
        tempr=r(j)+h*temp2/8+h*temp4/8;
        [temp5,temp6]=cal(tempT,tempr);%����k3��ֵ
        tempT=T(j)-h*temp3/2+h*temp5;
        tempr=r(j)-h*temp4/2+h*temp6;
        [temp7,temp8]=cal(tempT,tempr); %����k4��ֵ
        tempT=T(j)+3*h*temp1/16+9*h*temp7/16;
        tempr=r(j)+3*h*temp2/16+9*h*temp8/16;
        [temp9,temp10]=cal(tempT,tempr); %����k5��ֵ
        tempT=T(j)-3*h*temp1/7+2*h*temp3/7+12*h*temp5/7-12*h*temp7/7+8*h*temp9/7;
        tempr=r(j)-3*h*temp2/7+2*h*temp4/7+12*h*temp6/7-12*h*temp8/7+8*h*temp10/7;
        [temp11,temp12]=cal(tempT,tempr); %����k6��ֵ
        ek1=(temp1*7+temp5*32+temp7*12+temp9*32+temp11*7)/90; %�����¶ȵ���ֵ
        ek2=(temp2*7+temp6*32+temp8*12+temp10*32+temp12*7)/90; %���ư뾶����ֵ
        T(j+1)=T(j)+ek1*h;
        r(j+1)=r(j)+ek2*h; %Ӧ�������������ʽ
        t(j+1)=t(j)+h;
        j=j+1;
    end
    er=max(abs(t(j)-tempa)/t(j), abs(T(j)-tempb)/T(j));%����������
    tempa=t(j);
    tempb=T(j);
    h=h/2; %��������
end
h=h*2;
fprintf('�Ľ���������������Ϊ:�ڻ�ʱ��t=%.2f,��ֵˮ��T=%.4f,����Ӧ����h=%.4f\n',t(j),T(j),h); %������