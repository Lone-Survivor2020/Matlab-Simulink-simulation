clear all
t=0:0.001:10;
x=sin(2*pi*t);
px=norm(x).^2 / length(x)  %信号x的功率   范数
snr=20;
pn=px./(10.^(snr./10)); %根据snr计算噪声功率
n=sqrt(pn)*randn(1,length(x));  %根据噪声功率产生相应的高斯白噪声序列
y=x+n;
subplot(2,1,1);plot(t,x);title('正弦信号x');
subplot(2,1,2);plot(t,y);title('叠加了高斯白噪声后的正弦信号');
var(n)