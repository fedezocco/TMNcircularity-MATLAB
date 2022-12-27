%% Written by Federico Zocco
% Last modified: 19 December 2022

%% This function finds all the directed cycles and their mass flows 
%INPUTS: Gamma, i.e., the mass-flow matrix  (see [1] for details).   
%OUTPUTS: 
% (a) Cycles, i.e., the list of all directed cycles in M with their mass flows 
% (b) ArcsInCycles, i.e., arcs in each cycle (see [5] for details)
% (c) M, i.e., the mass-flow digraph (see [1] for details).

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

function [Cycles, ArcsInCycles, M] = find_cycles(Gamma)

% Mass-flow digraph:
n_v = size(Gamma,1); % number of vertex-compartments
vertex_labels = {};

for i = 1:n_v
    vertex_labels{end+1} = texlabel(['c^' num2str(i)]);
end

M = digraph(Gamma, vertex_labels, 'omitselfloops');
% M_plot = plot(M);
[Cycles, ArcsInCycles] = allcycles(M);

end

 

