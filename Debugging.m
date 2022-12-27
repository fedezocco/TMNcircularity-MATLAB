%% Written by Federico Zocco
% Last modified: 19 December 2022

%% Small graphs to test the calculations of the indicators proposed in [1]. 
% The values of the indicators for these small graphs has been computed manually and 
% compared with the code outcomes.

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

clear all

%% Uncomment one of the following graphs as needed

% Graph 1 (1 cycle, no arcs out of cycles, equal weights):
% Gamma = [1 5 0; 0 1 5; 5 0 1];
% [lambda_GA, lambda_GR] = lambda_GA_GR(Gamma);
% [lambda_AA, lambda_AR] = lambda_AA_AR(Gamma);
% [lambda_HA, lambda_HR] = lambda_HA_HR(Gamma);
% [lambda_C, connectivityOfEachVertex] = lambda_C(Gamma);
% lambda_Y = lambda_Y(Gamma);
% lambda_S = lambda_S(Gamma);
% lambda_D = lambda_D(Gamma);
% [theta_S, theta_F, theta_D, theta_A] = auxiliary(Gamma);


% Graph 2 (1 cycle, one arc out of cycles, equal weights):
% Gamma = [1 5 0 0; 0 1 5 0; 5 0 1 10; 0 0 0 1];
% [lambda_GA, lambda_GR] = lambda_GA_GR(Gamma);
% [lambda_AA, lambda_AR] = lambda_AA_AR(Gamma);
% [lambda_HA, lambda_HR] = lambda_HA_HR(Gamma);
% [lambda_C, connectivityOfEachVertex] = lambda_C(Gamma);
% lambda_Y = lambda_Y(Gamma);
% lambda_S = lambda_S(Gamma);
% lambda_D = lambda_D(Gamma);
% [theta_S, theta_F, theta_D, theta_A] = auxiliary(Gamma);

% Graph 3 (1 cycle, one arc out of cycles, different weights):
% Gamma = [1 2 0 0; 0 1 5 0; 4 0 1 0; 0 0 10 1];
% [lambda_GA, lambda_GR] = lambda_GA_GR(Gamma);
% [lambda_AA, lambda_AR] = lambda_AA_AR(Gamma);
% [lambda_HA, lambda_HR] = lambda_HA_HR(Gamma);
% [lambda_C, connectivityOfEachVertex] = lambda_C(Gamma);
% lambda_Y = lambda_Y(Gamma);
% lambda_S = lambda_S(Gamma);
% lambda_D = lambda_D(Gamma);
% [theta_S, theta_F, theta_D, theta_A] = auxiliary(Gamma);

% Graph 4 (2 cycles, no arcs out of cycles, different weights):
Gamma = [100 2 4 0; 0 100 2 0; 0 0 100 2; 2 0 0 100];
[lambda_GA, lambda_GR] = lambda_GA_GR(Gamma);
[lambda_AA, lambda_AR] = lambda_AA_AR(Gamma);
[lambda_HA, lambda_HR] = lambda_HA_HR(Gamma);
[lambda_C, connectivityOfEachVertex] = lambda_C(Gamma);
lambda_Y = lambda_Y(Gamma);
lambda_S = lambda_S(Gamma);
lambda_D = lambda_D(Gamma);
[theta_S, theta_F, theta_D, theta_A] = auxiliary(Gamma);

% Graph 5 (4 cycles, no arcs out of cycles, different weights):
% Gamma = [100 2 4 7; 0 100 2 0; 0 3 100 2; 5 0 0 100];
% [lambda_GA, lambda_GR] = lambda_GA_GR(Gamma);
% [lambda_AA, lambda_AR] = lambda_AA_AR(Gamma);
% [lambda_HA, lambda_HR] = lambda_HA_HR(Gamma);
% [lambda_C, connectivityOfEachVertex] = lambda_C(Gamma);
% lambda_Y = lambda_Y(Gamma);
% lambda_S = lambda_S(Gamma);
% lambda_D = lambda_D(Gamma);
% [theta_S, theta_F, theta_D, theta_A] = auxiliary(Gamma);

% Graph 6 (1 cycle, 2 arcs out of cycles, different weights):
% Gamma = [10 4 0 0; 6 100 2 0; 0 0 100 7; 0 0 0 100];
% [lambda_GA, lambda_GR] = lambda_GA_GR(Gamma);
% [lambda_AA, lambda_AR] = lambda_AA_AR(Gamma);
% [lambda_HA, lambda_HR] = lambda_HA_HR(Gamma);
% [lambda_C, connectivityOfEachVertex] = lambda_C(Gamma);
% lambda_Y = lambda_Y(Gamma);
% lambda_S = lambda_S(Gamma);
% lambda_D = lambda_D(Gamma);
% [theta_S, theta_F, theta_D, theta_A] = auxiliary(Gamma);