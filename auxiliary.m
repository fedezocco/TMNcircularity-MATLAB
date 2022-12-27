%% Written by Federico Zocco
% Last modified: 19 December 2022

%% This function computes the indicators (see [1] for details): 
% (a) total stock
% (b) total flow
% (c) stock distribution
% (d) accumulation-depletion vector

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

function [theta_S, theta_F, theta_D, theta_A] = auxiliary(Gamma)

theta_S = trace(Gamma);

diagonal_entries = diag(Gamma);
theta_F = sum(sum(Gamma - diag(diagonal_entries)));

theta_D = std(diagonal_entries); 


theta_A = [];
for k = 1:size(Gamma,1)
    
    theta_A(k,1) = (sum(Gamma(:,k))-Gamma(k,k)) - (sum(Gamma(k,:))-Gamma(k,k));

end

end