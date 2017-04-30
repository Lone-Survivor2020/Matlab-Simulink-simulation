clear all
nSamp=8; %���������������
numSymb=10000; %ÿ��SNR�µĴ��������
ts=1/(numSymb*nSamp);
t=(0:numSymb*nSamp-1)*ts;

M=4;%QPSK�ķ���������
SNR=-3:3; 
grayencod=[0 1 3 2]; %����������ʽ

%%
for ii=1:length(SNR)
    msg=randsrc(1,numSymb,[0:3]); %������������
    msg_gr=grayencod(msg+1); %���и��ױ���ӳ��
    msg_tx=pskmod(msg_gr,M); %QPSK����
    msg_tx=rectpulse(msg_tx,nSamp); %�����������
    h=rayleigh(10,t); %��������˥��
    msg_tx1=h.*msg_tx; %�ź�ͨ������˥���ŵ�
    msg_rx=awgn(msg_tx,SNR(ii));
    msg_rx1=awgn(msg_tx1,SNR(ii));
    msg_rx_down=intdump(msg_rx,nSamp); %ƥ���˲�����ɽ��
    msg_rx_down1=intdump(msg_rx1,nSamp);
    
    msg_gr_demod= pskdemod(msg_rx_down,M); %QPSK���
    msg_gr_demod1=pskdemod(msg_rx_down1,M);
    
    [dummy graydecod]=sort(grayencod);
    graydecod=graydecod-1;
    msg_demod=graydecod(msg_gr_demod+1);  %���ױ�����ӳ��
    msg_demod1=graydecod(msg_gr_demod1+1);
    
    [errorBit BER(ii)]=biterr(msg,msg_demod,log2(M));
    [errorBit1 BER1(ii)]=biterr(msg,msg_demod1,log2(M));
    
    [errorSym SER(ii)]=symerr(msg,msg_demod);
    [errorSym1 SER1(ii)]=symerr(msg,msg_demod1);    
    
end
%%
figure
semilogy(SNR,BER,'-ro',SNR,SER,'-r*',SNR,BER1,'-b',SNR,SER1,'-b^');
legend('AWGN�ŵ�BER','AWGN�ŵ�SER','Rayleigh˥��+AWGN�ŵ�BER','Rayleigh˥��+AWGN�ŵ�SER');
title('QPSK��AWGN��Rayleigh˥���ŵ��µ�����');
xlabel('����ȣ�dB��');
ylabel('������ʺ��������')




    