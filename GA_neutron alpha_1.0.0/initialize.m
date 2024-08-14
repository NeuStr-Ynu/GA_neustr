function population = initialize(pop_size, num_variables, lb, ub)
% 初始化种群
% population = initialize(种群大小, 变量个数, 下界, 上界)
%% 接受全局变量
global intLength; % 整数部分的二进制位数
global fracLength; % 小数部分二进制位数
%% 初始化种群矩阵
Length=intLength + fracLength+1;

population = zeros(pop_size, num_variables * (Length));

for i = 1:pop_size
    for j = 1:num_variables
        % 随机生成在上下界范围内的十进制数
        x = lb(j) + (ub(j) - lb(j)) * rand;
        
        % 将十进制数转换为二进制
        B = D2B(x, intLength, fracLength);
        
        % 将二进制数存储到种群矩阵中
        population(i, (j-1)*(Length) + 1 : j*(Length)) = B;
    end
end
end
