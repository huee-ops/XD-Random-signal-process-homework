% 设置参数
num_samples = 3;  % 样本数量
t = linspace(0, 2*pi, 1000);  % 时间范围

% 生成三个样本函数
for i = 1:num_samples
    % 生成随机相位o
    o = 2*pi*rand();
    
    % 生成对应的信号样本
    X = 5 * cos(t + o);
    
    % 绘制图形
    subplot(num_samples, 1, i);
    plot(t, X);
    title(['Sample ', num2str(i), ', Phase = ', num2str(o)]);
    xlabel('Time');
    ylabel('X(t)');
end
%%此代码使用rand函数在区间(0, 1)上生成均匀分布的随机数，并通过乘以2*pi将其映射到相位o在区间(0, 2*pi)上。然后，使用生成的相位值计算信号样本，并通过subplot在一个图中显示三个样本函数。每个子图的标题中包含相应的样本编号和相位值。