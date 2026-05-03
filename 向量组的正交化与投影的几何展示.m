%% 案例4.1.4：向量组的正交化与投影的几何展示
% 功能：展示施密特正交化过程，以及向量向子空间投影的几何意义
clear; clc; close all;

% 定义两个线性无关的二维向量
a1 = [3; 1];
a2 = [2; 4];

% 兼容北太天元：逐分量输出向量
fprintf('原始向量 a1 = [%.1f; %.1f], a2 = [%.1f; %.1f]\n', a1(1), a1(2), a2(1), a2(2));

% 施密特正交化过程
b1 = a1;
proj_a2_on_b1 = (dot(a2, b1) / dot(b1, b1)) * b1;
b2 = a2 - proj_a2_on_b1;

fprintf('正交化结果: b1 = [%.2f; %.2f], b2 = [%.2f; %.2f]\n', b1(1), b1(2), b2(1), b2(2));
fprintf('验证正交性: b1 · b2 = %.2e (应接近0)\n', dot(b1, b2));

% 绘图
figure('Name', '施密特正交化与正交投影', 'NumberTitle', 'off');

% 子图1：正交化过程
subplot(1, 2, 1);
hold on; grid on; axis equal;
xlabel('x'); ylabel('y');
title('施密特正交化几何过程');

% 原始向量 a1, a2
quiver(0, 0, a1(1), a1(2), 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
quiver(0, 0, a2(1), a2(2), 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);

% a2 在 b1 上的投影（虚线）
quiver(0, 0, proj_a2_on_b1(1), proj_a2_on_b1(2), 0, '--m', 'LineWidth', 1.5, 'MaxHeadSize', 0.3);

% 正交化后的向量 b1, b2
quiver(0, 0, b1(1), b1(2), 0, 'b', 'LineWidth', 2.5, 'MaxHeadSize', 0.5);
quiver(0, 0, b2(1), b2(2), 0, 'r', 'LineWidth', 2.5, 'MaxHeadSize', 0.5);

% 连线表示减去投影
plot([a2(1), b2(1)], [a2(2), b2(2)], 'k--', 'LineWidth', 1);

text(a1(1), a1(2), 'a1=b1', 'Color', 'b');
text(a2(1), a2(2), 'a2', 'Color', 'r');
text(b2(1), b2(2), 'b2', 'Color', 'r');
legend('原始向量 a1', '原始向量 a2', 'a2在b1上的投影', '正交基 b1', '正交基 b2', 'Location', 'best');
hold off;

% 子图2：正交投影演示
subplot(1, 2, 2);
hold on; grid on; axis equal;
xlabel('x'); ylabel('y');
title('向量向子空间（直线）的投影');

u = [cos(pi/6); sin(pi/6)];
L_points = [-4*u, 4*u];
plot(L_points(1,:), L_points(2,:), 'k-', 'LineWidth', 1.5);

v = [3; 1.5];
proj_v = dot(v, u) * u;
perp_v = v - proj_v;

quiver(0, 0, v(1), v(2), 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
quiver(0, 0, proj_v(1), proj_v(2), 0, 'r', 'LineWidth', 2.5, 'MaxHeadSize', 0.5);
quiver(proj_v(1), proj_v(2), perp_v(1), perp_v(2), 0, 'g--', 'LineWidth', 1.5, 'MaxHeadSize', 0.3);
plot([v(1), proj_v(1)], [v(2), proj_v(2)], 'm:', 'LineWidth', 1.5);

text(v(1)+0.1, v(2)+0.1, 'v');
text(proj_v(1), proj_v(2)-0.2, '投影');
legend('子空间L', '向量v', '正交投影', '误差向量e=v-proj', 'Location', 'best');
hold off;
