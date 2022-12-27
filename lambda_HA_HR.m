%% Written by Federico Zocco
% Last modified: 19 December 2022

%% This function computes the indicators (see [1] for details): 
% (a) harmonic-mean absolute circularity
% (b) harmonic-mean relative circularity

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

function [lambda_HA, lambda_HR] = lambda_HA_HR(Gamma)

[Cycles, ArcsInCycles, M] = find_cycles(Gamma);

% Harmonic-mean absolute circularity, i.e. lambda_HA:
numerator = 0;
remainingArcs = 1:length(M.Edges{:,1});
sum_flowsNotInCycles = 0;

for k = 1:size(Cycles,1) % compute the numerator
   cycle_k_HM = cycle_harmonic_mean(ArcsInCycles{k}, M);
   numerator = numerator + cycle_k_HM; 
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
lambda_HA = numerator/denominator;

% Harmonic-mean relative circularity:
lambda_HR = numerator;

end