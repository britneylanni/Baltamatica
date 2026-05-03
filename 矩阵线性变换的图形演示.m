%% 案例4.1.2：矩阵线性变换的图形演示
clear; clc; close all;

square = [0, 1, 1, 0; 0, 0, 1, 1];

figure('Name', '矩阵的线性变换', 'NumberTitle', 'off');

subplot(1, 3, 1);
fill(square(1,:), square(2,:), 'c');
title('原始单位正方形'); axis equal; grid on;
xlim([-3, 3]); ylim([-3, 3]); xlabel('x'); ylabel('y');

M_shear = [1, 1.5; 0, 1];
transformed_shear = M_shear * square;
subplot(1, 3, 2);
fill(transformed_shear(1,:), transformed_shear(2,:), 'm');
% 用两行标题：第一行为总标题，第二行为子图说明
title({'矩阵作为线性变换：对单位正方形的作用', '剪切变换后的图形'});
axis equal; grid on;
xlim([-3, 3]); ylim([-3, 3]); xlabel('x'); ylabel('y');

M_proj = [1, 0; 0, 0];
transformed_proj = M_proj * square;
subplot(1, 3, 3);
fill(transformed_proj(1,:), transformed_proj(2,:), 'r');
title('投影变换后的图形 (退化)'); axis equal; grid on;
xlim([-3, 3]); ylim([-3, 3]); xlabel('x'); ylabel('y');

fprintf('观察：原始正方形经过剪切矩阵后，面积不变，形状改变。\n');
fprintf('而经过投影矩阵后，正方形退化为了x轴上的一条线段（面积为零）。\n');
fprintf('投影矩阵的行列式为0，对应变换将二维空间压缩到了一维。\n');