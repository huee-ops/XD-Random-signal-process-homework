clc;clear
close all
%%产生一个正弦信号
fs=100;%采样频率为100HZ
fc=10;%信号频率为10HZ
t=0:1/fs:2;

x=5*sin(2*pi*fc*t);
y=1*randn(size(t));
s=x+y;

[a,b]=xcorr(s,'coeff');


subplot(5,2,1);
plot(t,x,'r')
title('x=sin(2*pi*fc*t)');
ylabel('x')
xlabel('t')
grid;
subplot(5,2,2);
plot(t,y,'r');
title('y=1*randn(size(t))');
ylabel('y');
xlabel('t');
grid;
subplot(5,2,3);
plot(t,s);
title('复合函数s');
ylabel('s');
xlabel('t');
grid;
subplot(5,2,4); 
plot(b*(1/fs),a);   % b*(1/fs)   采样恢复到秒
title('复合函数s的自相关函数');
ylabel('b');
xlabel('t');
grid;

Fs=fft(s);
Fs1=fftshift(Fs);
f=(0:200)*fs/201-fs/2;
subplot(5,2,5);
plot(f,abs(Fs1),'r');
title('复合函数s的频谱图');
ylabel('F(jw)');
xlabel('w');
grid;


p=Fs1.*conj(Fs1)/length(Fs1);
subplot(5,2,6);
plot(f,p,'r');
title('s的功率谱密度图');
ylabel('G(w)');
xlabel('w');
grid;

b=10;
s2=conv2(s,b*pi^-b*t); %s2=conv2(s,b*pi^-b*t);
Fs2=fftshift(fft(s2));
f=(0:400)*fs/201-fs/2;
subplot(5,2,7);
plot(f,abs(Fs2),'r');
title('s通过RC后函数频谱图');
ylabel('Fs2(jw)');
xlabel('w');
grid;

p1=Fs2.*conj(Fs2)/length(Fs2);
subplot(5,2,8);
plot(f,p1,'r');
title('s通过RC后的功率谱密度图');
ylabel('Gs2(w)');
xlabel('w');
grid;

s3=conv2(s,sin(10*t)/(pi*t));
Fs3=fftshift(fft(s3));
f=(0:200)*fs/201-fs/2;
subplot(5,2,9);
plot(f,abs(Fs3),'r');
title('s通过理想滤波器后函数频谱图');
ylabel('Fs3(jw)');
xlabel('w');
grid;

p2=Fs3.*conj(Fs3)/length(Fs3);
subplot(5,2,10);
plot(f,p2,'r');
title('s通过理想滤波器后的功率谱密度图');
ylabel('Gs3(w)');
xlabel('w');
grid;