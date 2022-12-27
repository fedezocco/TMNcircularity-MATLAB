%% Written by Federico Zocco
% Last modified: 19 December 2022

%% This function computes the indicators (see [1] for details): 
% (a) arithmetic-mean absolute circularity
% (b) arithmetic-mean relative circularity

% REFERENCES:
% [1] Zocco, F., Smyth, B. and Sopasakis, P., 2022. Circularity of 
% thermodynamical material networks: Indicators, examples, and algorithms. 
% arXiv preprint arXiv:2209.15051.
% [2] Bondy, J.A. and Murty, U.S.R., 1976. Graph theory with applications 
% (Vol. 290). London: Macmillan.
% [3] Zocco, F., Sopasakis, P., Smyth, B., and Haddad, W.M., 2022. Thermodynamical 
% material networks for modeling, planning, and control of circular material flows. 
% arXiv preprint arXiv:2111.10693.
% [4] Haddad, W.M., 2019. A dynamical systems theory of thermodynamics. 
% Princeton University Press.
% [5] https://uk.mathworks.com/help/matlab/ref/graph.allcycles.html

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [lambda_AA, lambda_AR] = lambda_AA_AR(Gamma)

[Cycles, ArcsInCycles, M] = find_cycles(Gamma);

% Arithmetic-mean absolute circularity, i.e. lambda_AA:
numerator = 0;
remainingArcs = 1:length(M.Edges{:,1});
sum_flowsNotInCycles = 0;

for k = 1:size(Cycles,1) % compute the numerator
   cycle_k_AM = cycle_arithmetic_mean(ArcsInCycles{k}, M);
   numerator = numerator + cycle_k_AM; 
end

for k = 1:size(Cycles,1) % find indices of all arcs NOT in cycles
    list_k = ArcsInCycles{k};

    for i = 1:size(list_k,2)
        arc_idx = list_k(i);
        remainingArcs(remainingArcs == arc_idx) = [];
    end

end

for i = 1:length(remainingArcs) % sum all flows NOT in cycles   
    sum_flowsNotInCycles = sum_flowsNotInCycles + M.Edges{remainingArcs(i),2};
end

denominator = numerator + sum_flowsNotInCycles;
lambda_AA = numerator/denominator;

% Arithmetic-mean relative circularity:
lambda_AR = numerator;

end