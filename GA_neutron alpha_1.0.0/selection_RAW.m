function new_population = selection_RAW(population, cumsump)
% SELECTION_RAW 使用轮盘赌的方法完成选择这个操作
% 新种群 = selection_RAW(原种群, 累计适应度)

    pop_size = size(population, 1);
    new_population = zeros(size(population));
    for i = 1:pop_size
        r = rand;
        idx = find(cumsump >= r, 1);
        new_population(i, :) = population(idx, :);
    end
end