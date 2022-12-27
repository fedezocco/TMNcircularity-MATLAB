%% Written by Federico Zocco
% Last modified: 19 December 2022

%% This function sets as zero the entries of Gamma that are less than "threshold". In this way,
% entries that should be exactly zero but they are not for
% numerical reasons, are treated as zeros. 
% Motivation: A null entry means that there is
% no flow/stock, whereas a non-null entry is a non-zero flow/stock. When the graph is generated from Gamma,
% this leads to having or not having a flow, that is, an arc. As a
% consequence, the indicator values differ if a flow is close to zero
% instead of exactly zero as it is supposed to be. 
% If threshold = 0, this function does NOT make any change to Gamma (remember that 
% Gamma entries are non-negative numbers).

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

function Gamma_clean = neglect_entries(Gamma)

threshold = 10^(-6);  % set the threshold

if sum(sum(Gamma < threshold))
    
    negligible_entries_idx = find(Gamma < threshold);
    
    for i = 1:size(negligible_entries_idx,1)
        Gamma(negligible_entries_idx(i)) = 0;

    end
end

Gamma_clean = Gamma;

end
