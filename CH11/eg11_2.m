%�ֱ�Դ��ڲ���ЧӦ�Ͳ����ڲ���ЧӦʱ��ʱ϶ALOHAЭ�����ܽ��з��档
clear all
[Traffic1,S1,Delay1]=saloha(0); %�޲���ЧӦ������
[Traffic2,S2,Delay2]=saloha(1); 
S=Traffic1.*exp(-Traffic1);

plot(Traffic1,S1,'-ko',Traffic1,S,'-kv',Traffic2,S2,'-k*');
title('ʱ϶ALOHAЭ���ŵ���������ҵ������ϵ')
xlabel('ҵ����')
ylabel('������')
legend('�޲���ЧӦ������','�޲���ЧӦ����ֵ','�в���ЧӦ������')

figure
plot(Traffic1,Delay1,'-ko',Traffic2,Delay2,'-k*')
title('ʱ϶ALOHAЭ���ӳ���ҵ������ϵ')
xlabel('ҵ����')
ylabel('�ӳ٣����ݰ�������')
legend('�޲���ЧӦ������','�в���ЧӦ������')