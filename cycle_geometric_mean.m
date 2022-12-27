%% Written by Federico Zocco
% Last modified: 19 December 2022

%% This function computes the cycle geometric mean (see [1] for details).

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function cycle_GM = cycle_geometric_mean(ArcsInCycle, M)

cycle_GM = 1;
length = size(ArcsInCycle, 2);

for i = 1:size(ArcsInCycle,2)
    arc_idx = ArcsInCycle(i);
    cycle_GM = cycle_GM * M.Edges{arc_idx,2};
end

cycle_GM = cycle_GM^(1/length);

end