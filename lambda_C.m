%% Written by Federico Zocco
% Last modified: 19 December 2022

%% This function computes the indicators (see [1] for details): 
% (a) average connectivity

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

function [lambda_C, connectivityOfEachVertex] = lambda_C(Gamma) 

[~, ~, M] = find_cycles(Gamma); 
lambda_C = (1/size(Gamma,1))*sum(indegree(M) + outdegree(M));
connectivityOfEachVertex = indegree(M) + outdegree(M);

end
