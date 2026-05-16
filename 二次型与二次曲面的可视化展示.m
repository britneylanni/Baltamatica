%% 案例4.1.5：二次型与三维二次曲面的可视化展示.m
%%演示三种典型的二次曲面：椭球面、单叶双曲面、双叶双曲面
%% 清空环境
clc; clear; close all;

%% 图形窗口设置
figure(1);
set(gcf, 'Position', [100, 100, 1200, 400]);

%% ====================== 1. 椭球面 ======================
u = linspace(0, pi, 50);
v = linspace(0, 2*pi, 50);
[U, V] = meshgrid(u, v);

a = sqrt(2);  b = 1;  c = sqrt(3);
X1 = a * sin(U) .* cos(V);
Y1 = b * sin(U) .* sin(V);
Z1 = c * cos(U);

subplot(1, 3, 1);
surf(X1, Y1, Z1, 'FaceAlpha', 0.85, 'EdgeColor', 'none');
shading interp;   % 平滑着色，增强立体感
colormap('default');
xlabel('x'); ylabel('y'); zlabel('z');
title('椭球面 (正定矩阵)');
axis equal;
view(45, 30);
grid on;

%% ====================== 2. 单叶双曲面 ======================
u = linspace(-1.2, 1.2, 30);
v = linspace(0, 2*pi, 50);
[U, V] = meshgrid(u, v);

X2 = cosh(U) .* cos(V);
Y2 = cosh(U) .* sin(V);
Z2 = sinh(U);

subplot(1, 3, 2);
surf(X2, Y2, Z2, 'FaceAlpha', 0.85, 'EdgeColor', 'none');
shading interp;
xlabel('x'); ylabel('y'); zlabel('z');
title('单叶双曲面 (一负两正)');
axis equal;
view(45, 30);
grid on;

%% ====================== 3. 双叶双曲面 ======================
u = linspace(-1.2, 1.2, 30);
v = linspace(0, 2*pi, 50);
[U, V] = meshgrid(u, v);

X3_right = cosh(U);
Y3_right = sinh(U) .* cos(V);
Z3_right = sinh(U) .* sin(V);

X3_left = -cosh(U);
Y3_left = sinh(U) .* cos(V);
Z3_left = sinh(U) .* sin(V);

subplot(1, 3, 3);
surf(X3_right, Y3_right, Z3_right, 'FaceAlpha', 0.85, 'EdgeColor', 'none');
hold on;
surf(X3_left, Y3_left, Z3_left, 'FaceAlpha', 0.85, 'EdgeColor', 'none');
hold off;
shading interp;
xlabel('x'); ylabel('y'); zlabel('z');
title('双叶双曲面 (两负一正)');
axis equal;
view(45, 30);
grid on;

%% ====================== 输出特征值分析 ======================
fprintf('========== 二次型与三维二次曲面特征值分析 ==========\n\n');
fprintf('1. 椭球面 (正定矩阵):\n');
fprintf('   对应矩阵 A1 = diag(0.5, 1, 1/3)\n');
fprintf('   特征值: λ1 = 0.5, λ2 = 1, λ3 = 0.333 (均为正)\n');
fprintf('   曲面类型: 椭球面 (封闭有界)\n\n');

fprintf('2. 单叶双曲面 (不定矩阵):\n');
fprintf('   对应矩阵 A2 = diag(1, 1, -1)\n');
fprintf('   特征值: λ1 = 1, λ2 = 1, λ3 = -1 (一负两正)\n');
fprintf('   曲面类型: 单叶双曲面 (单叶无限延伸)\n\n');

fprintf('3. 双叶双曲面 (不定矩阵):\n');
fprintf('   对应矩阵 A3 = diag(1, -1, -1)\n');
fprintf('   特征值: λ1 = 1, λ2 = -1, λ3 = -1 (两负一正)\n');
fprintf('   曲面类型: 双叶双曲面 (双叶分离)\n\n');

fprintf('【核心结论】\n');
fprintf('  - 特征值全正 → 椭球面 (封闭有界)\n');
fprintf('  - 特征值一负两正 → 单叶双曲面\n');
fprintf('  - 特征值两负一正 → 双叶双曲面\n');
fprintf('  - 出现零特征值 → 抛物面或柱面 (退化情形)\n\n');
