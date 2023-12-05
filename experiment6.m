clc;
clear;
% 定义阶跃序列
a = 0.99;
t = linspace(-1000, 1000, 2001); % 时间向量
u_t = heaviside(t); % 阶跃序列
u = u_t.*a.^t;

% 计算傅里叶变换
U = fft(u);
U_shifted = fftshift(U); % 将零频率移到中间

% 计算频谱幅度谱和相位谱
L = length(u);
frequencies = linspace(-1/(2*(t(2)-t(1))), 1/(2*(t(2)-t(1))), L); % 频率向量

amplitude_spectrum = abs(U_shifted) / L;
phase_spectrum = angle(U_shifted);

% 绘制幅度谱
subplot(2,1,1);
plot(frequencies, amplitude_spectrum);
title('幅度谱');
xlabel('频率 (Hz)');
ylabel('|U(f)|');

% 绘制相位谱
subplot(2,1,2);
plot(frequencies, phase_spectrum);
title('相位谱');
xlabel('频率 (Hz)');
ylabel('相位 (弧度)');
