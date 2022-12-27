%% Written by Federico Zocco
% Last modified: 19 December 2022

%% This function computes the indicators (see [1] for details): 
% (a) flow sharing

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

function lambda_S = lambda_S(Gamma)

[~, ArcsInCycles, M] = find_cycles(Gamma);

shared_ArcsInCycles = [];
occurrences = 0;   

for i = 1:size(M.Edges,1) % counts occurrences of i-th arc in cycles

    for k = 1:size(ArcsInCycles,1) % check occurrence in each k-th cycle
        
        if sum(ArcsInCycles{k,1} == i)
            occurrences = occurrences + 1;
        
        end
    
    end
        
    if occurrences > 1 % check if the i-th arc appears in more more than 1 cycle
        shared_ArcsInCycles(end+1) = i;
        
    end
    occurrences = 0;

end


lambda_S = 0;

for k = 1:length(shared_ArcsInCycles)   
    lambda_S = lambda_S + M.Edges{shared_ArcsInCycles(k),2};
end

end