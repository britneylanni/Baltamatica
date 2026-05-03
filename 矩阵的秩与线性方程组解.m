%% 案例3.2.2：矩阵的秩与线性方程组解
% 功能：计算矩阵的秩，并判断对应线性方程组解的情况
clear; clc; % 清空工作区和命令窗口

fprintf('--- 1. 矩阵的秩计算与含义 ---\n');
% 定义几个矩阵
A1 = [1, 2; 2, 4]; % 两行线性相关，秩为1
A2 = [1, 2, 3; 4, 5, 6; 7, 8, 9]; % 行向量线性相关，秩为2
A3 = [1, 2; 3, 4]; % 满秩矩阵，秩为2

% 计算矩阵的秩
rank_A1 = rank(A1);
rank_A2 = rank(A2);
rank_A3 = rank(A3);

fprintf('矩阵 A1 = '); disp(A1);
fprintf('矩阵 A1 的秩 rank(A1) = %d\n', rank_A1);
fprintf('矩阵 A2 = '); disp(A2);
fprintf('矩阵 A2 的秩 rank(A2) = %d\n', rank_A2);
fprintf('矩阵 A3 = '); disp(A3);
fprintf('矩阵 A3 的秩 rank(A3) = %d\n', rank_A3);

fprintf('--- 2. 利用秩判断线性方程组解的情况 ---\n');
% 以齐次方程组 A1 * x = 0 为例
fprintf('对于齐次线性方程组 A1 * x = 0：\n');
% 使用 null 函数求零空间（基础解系）
null_space_A1 = null(A1);
fprintf('其基础解系（零空间的一组基）为：');
disp(null_space_A1);
if size(null_space_A1, 2) > 0
    fprintf('存在非零解。\n');
else
    fprintf('只有零解。\n');
end

% 非齐次方程组示例
fprintf('对于非齐次线性方程组 A3 * x = b，其中 b = [5; 11]：\n');
A = A3;
b = [5; 11];
% 判断解的情况：比较系数矩阵A的秩与增广矩阵[A, b]的秩
rank_A = rank(A);
rank_Ab = rank([A, b]);

if rank_A == rank_Ab
    if rank_A == size(A, 2) % 未知数个数
        fprintf('系数矩阵与增广矩阵的秩相等且等于未知数个数，方程组有唯一解。\n');
        x = A \ b; % 使用左除运算求解
        fprintf('方程组的解为：x = \n'); disp(x);
    else
        fprintf('系数矩阵与增广矩阵的秩相等但小于未知数个数，方程组有无穷多解。\n');
    end
else
    fprintf('系数矩阵与增广矩阵的秩不相等，方程组无解。\n');
end
