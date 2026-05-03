%% 案例4.1.3：特征值与特征向量的几何意义
% 功能：展示二维线性变换下，特征向量方向不变的性质
clear; clc; close all;

% 定义一个矩阵，其特征向量方向是我们寻找的
A = [2, 1; 1, 2];  % 特征向量方向为 [1;1] 和 [-1;1]，特征值分别为3和1
[V, D] = eig(A);
v1 = V(:,1); lambda1 = D(1,1);
v2 = V(:,2); lambda2 = D(2,2);

% 兼容北太天元：fprintf 仅支持标量，逐元素输出向量分量
fprintf('矩阵 A = \n');
disp(A);  % disp 可直接显示矩阵，替代 fprintf
fprintf('特征向量 v1 = [%.2f; %.2f]，对应特征值 λ1 = %.1f\n', v1(1), v1(2), lambda1);
fprintf('特征向量 v2 = [%.2f; %.2f]，对应特征值 λ2 = %.1f\n', v2(1), v2(2), lambda2);

% 绘制单位圆上的一组向量，并观察它们被 A 变换后的结果
theta = linspace(0, 2*pi, 100);
circle_vectors = [cos(theta); sin(theta)]; % 单位圆上的向量
transformed_circle = A * circle_vectors;   % 变换后的向量

figure('Name', '特征向量的几何意义', 'NumberTitle', 'off');

% 子图1：展示特征向量及其变换
subplot(1, 2, 1);
hold on; grid on; axis equal;
xlabel('x'); ylabel('y');
title('矩阵A对向量的作用：特征向量方向不变');

% 绘制几个单位圆上的典型向量及其变换
sample_idx = 1:15:100;
for i = sample_idx
    vec = circle_vectors(:, i);
    t_vec = A * vec;
    quiver(0, 0, vec(1), vec(2), 0, 'b', 'LineWidth', 1, 'MaxHeadSize', 0.2);
    quiver(0, 0, t_vec(1), t_vec(2), 0, 'r', 'LineWidth', 1, 'MaxHeadSize', 0.2);
end
quiver(0, 0, v1(1), v1(2), 0, 'g', 'LineWidth', 3, 'MaxHeadSize', 0.8);
quiver(0, 0, v2(1), v2(2), 0, 'g', 'LineWidth', 3, 'MaxHeadSize', 0.8);
legend('原始向量', '变换后向量', '特征向量 v1', '特征向量 v2', 'Location', 'best');
hold off;

% 子图2：单位圆及其变换后的椭圆
subplot(1, 2, 2);
hold on; grid on; axis equal;
xlabel('x'); ylabel('y');
title('单位圆经A变换为椭圆，特征向量是主轴');
% 原始单位圆
plot(circle_vectors(1,:), circle_vectors(2,:), 'b--', 'LineWidth', 1.5);
% 变换后的椭圆
plot(transformed_circle(1,:), transformed_circle(2,:), 'r-', 'LineWidth', 1.5);

% 标记特征向量方向（主轴方向）
quiver(0, 0, v1(1)*lambda1, v1(2)*lambda1, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
quiver(0, 0, v2(1)*lambda2, v2(2)*lambda2, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
legend('原始单位圆', '变换后的椭圆', '主轴（特征向量方向）', 'Location', 'best');
hold off;
