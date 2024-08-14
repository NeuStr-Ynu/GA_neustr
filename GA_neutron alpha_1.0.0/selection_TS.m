function new_population = selection_TS(population, fitness, tournament_size)
% SELECTION_TS 使用锦标赛的方法完成选择这个操作
% 新种群 = selection_TS(原种群, 适应度数组,锦标赛大小)
    pop_size = size(population, 1);
    new_population = zeros(size(population));
    for i = 1:pop_size
        % 随机选择tournament_size个个体进行锦标赛
        tournament_indices = randperm(pop_size, tournament_size);
        tournament_fitness = fitness(tournament_indices);
        
        % 选择适应度最高的个体
        [~, best_index] = max(tournament_fitness);
        new_population(i, :) = population(tournament_indices(best_index), :);
    end
end
