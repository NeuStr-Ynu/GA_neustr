function new_population = mutation(population, mutation_rate)
% MUTATION 完成遗传算法中的变异操作
% 新种群 = mutation(原种群, 变异概率)
    new_population = population;
    for i = 1:numel(population)
        if rand < mutation_rate
            new_population(i) = ~population(i);
        end
    end
end