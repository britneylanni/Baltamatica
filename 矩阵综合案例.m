%% 案例3.2.5：希尔伯特矩阵的性质探究
% 功能：观察希尔伯特矩阵的病态性质（条件数、行列式、逆）
clear; clc;

fprintf('--- 希尔伯特矩阵的病态性质探究 ---\n');

% 1. 生成不同阶数的希尔伯特矩阵并观察性质
for n = 3:7
    H = hilb(n);                % 生成 n 阶希尔伯特矩阵
    H_inv = inv(H);             % 求逆矩阵
    
    fprintf('\n--- n = %d ---\n', n);
    fprintf('行列式 det(H) = %.4e\n', det(H));
    fprintf('条件数 cond(H) = %.4e\n', cond(H));
    
    % 验证 H * H_inv 是否接近单位阵
    error_norm = norm(H * H_inv - eye(n), 'fro');
    fprintf('|| H*H^{-1} - I ||_F = %.4e\n', error_norm);
    % 注释：随着 n 增大，误差范数会显著增大，体现数值不稳定性
end

% 2. 用希尔伯特矩阵求解一个方程组，展示其对误差的敏感性
n = 5;
H5 = hilb(n);
x_exact = ones(n, 1);           % 精确解设为全1向量
b = H5 * x_exact;
x_computed = H5 \ b;            % 求解方程组
error = norm(x_computed - x_exact);
fprintf('\n对于 n = 5 的希尔伯特方程组，解的误差范数为: %.4e\n', error);
% 注释：误差应该非常小，因为 b 是精确生成的。
% 如果给 b 一个微小扰动，解的变化将非常剧烈。
b_perturbed = b + 1e-7 * randn(n, 1);
x_perturbed = H5 \ b_perturbed;
error_perturbed = norm(x_perturbed - x_exact);
fprintf('对右端项加微小扰动后，解的误差范数激增至: %.4e\n', error_perturbed);