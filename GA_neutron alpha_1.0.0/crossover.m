function new_population = crossover(population, crossover_rate)
% CROSSOVER 遗传算法中交叉操作
% 新种群 = crossover(原种群, 交叉概率)

    pop_size = size(population, 1);
    num_variables = size(population, 2);
    new_population = population;
    for i = 1:2:pop_size
        if rand < crossover_rate
            crossover_point = randi([1, num_variables - 1]);
            new_population(i, crossover_point:end) = population(i + 1, crossover_point:end);
            new_population(i + 1, crossover_point:end) = population(i, crossover_point:end);
        end
    end
end