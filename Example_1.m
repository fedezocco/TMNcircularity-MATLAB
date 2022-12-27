%% Written by Federico Zocco
% Last modified: 19 December 2022

%% Example 1 of the source paper [1]. The network has 2 dynamic flows: 
% Gamma(1,2) = beta_1(t) = |sin(pi*t)|
% Gamma(1,3) = beta_2(t) = |cos(pi*t)|

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

t = 0:0.01:2;
beta_1 = abs(sin(pi*t)); 
beta_2 = abs(cos(pi*t));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization:
lambda_GA_of_t = [];
lambda_GR_of_t = [];
lambda_AA_of_t = [];
lambda_AR_of_t = [];
lambda_HA_of_t = [];
lambda_HR_of_t = [];
lambda_C_of_t = [];
lambda_Y_of_t = [];
lambda_S_of_t = [];
lambda_D_of_t = [];
theta_S_of_t = [];
theta_F_of_t = [];
theta_D_of_t = [];
theta_A_of_t = [];

  

for i = 1:size(t,2)

    Gamma = [10 beta_1(i) beta_2(i) 0; 0 20 4 0; 0 0 15 7; 1.3 0 0 5];

    Gamma = neglect_entries(Gamma); % replace negligible terms with zeros so that the algorithm treats them as no-flows, hence no arcs

    [lambda_GA_of_t(1,i), lambda_GR_of_t(1,i)] = lambda_GA_GR(Gamma);
    [lambda_AA_of_t(1,i), lambda_AR_of_t(1,i)] = lambda_AA_AR(Gamma);
    [lambda_HA_of_t(1,i), lambda_HR_of_t(1,i)] = lambda_HA_HR(Gamma);
    lambda_C_of_t(1,i) = lambda_C(Gamma);
    lambda_Y_of_t(1,i) = lambda_Y(Gamma);
    lambda_S_of_t(1,i) = lambda_S(Gamma);
    lambda_D_of_t(1,i) = lambda_D(Gamma);
    [theta_S_of_t(1,i), theta_F_of_t(1,i), theta_D_of_t(1,i), theta_A_of_t(:,i)] = auxiliary(Gamma);

    disp(['Computed time:', num2str(i)])

end


%%% Plots (uncommment as needed):

% (1):
plot(t, lambda_GA_of_t,'ok', 'LineWidth', 6)
hold on;
plot(t, lambda_HA_of_t,'xr', 'LineWidth', 8)
hold on;
plot(t, lambda_AA_of_t,'+b', 'LineWidth', 8)
xlabel(texlabel('Time, t (s)'), 'FontSize', 30)
ylabel('Indicator', 'FontSize', 30)
ax = gca;
ax.FontSize = 45;
grid on;
lgd = legend('$\lambda_{GA}$', '$\lambda_{HA}$', '$\lambda_{AA}$', 'Interpreter','latex');
ldg.FontSize = 60;

% (2):
% plot(t, lambda_GR_of_t,'ok', 'LineWidth', 6)
% hold on;
% plot(t, lambda_HR_of_t,'xr', 'LineWidth', 8)
% hold on;
% plot(t, lambda_AR_of_t,'+b', 'LineWidth', 8)
% xlabel(texlabel('Time, t (s)'), 'FontSize', 30)
% ylabel('Indicator', 'FontSize', 30)
% ax = gca;
% ax.FontSize = 45;
% grid on;
% lgd = legend('$\lambda_{GR}$', '$\lambda_{HR}$', '$\lambda_{AR}$', 'Interpreter','latex');
% ldg.FontSize = 60;

% (3) 
% plot(t, lambda_C_of_t,'ok', 'LineWidth', 6)
% hold on;
% plot(t, lambda_Y_of_t,'xr', 'LineWidth', 8)
% hold on;
% plot(t, lambda_S_of_t,'+b', 'LineWidth', 8)
% hold on;
% plot(t, lambda_D_of_t,'xm', 'LineWidth', 8)
% xlabel(texlabel('Time, t (s)'), 'FontSize', 30)
% ylabel('Indicator', 'FontSize', 30)
% yticks(0:10)
% ax = gca;
% ax.FontSize = 45;
% grid on;
% lgd = legend('$\lambda_{C}$', '$\lambda_{Y}$', '$\lambda_{S}$', '$\lambda_{D}$', 'Interpreter','latex');
% ldg.FontSize = 60;

% (4)
% plot(t, theta_S_of_t,'ok', 'LineWidth', 6)
% hold on;
% plot(t, theta_F_of_t,'xr', 'LineWidth', 8)
% hold on;
% plot(t, theta_D_of_t,'+b', 'LineWidth', 8)
% xlabel(texlabel('Time, t (s)'), 'FontSize', 30)
% ylabel('Indicator', 'FontSize', 30)
% ax = gca;
% ax.FontSize = 45;
% grid on;
% lgd = legend('$\theta_{S}$', '$\theta_{F}$', '$\theta_{D}$', 'Interpreter','latex');
% ldg.FontSize = 60;

% (5)
% plot(t, theta_A_of_t(1,:),'ok', 'LineWidth', 6)
% hold on;
% plot(t, theta_A_of_t(2,:),'xr', 'LineWidth', 8)
% hold on;
% plot(t, theta_A_of_t(3,:),'+b', 'LineWidth', 8)
% hold on;
% plot(t, theta_A_of_t(4,:),'+m', 'LineWidth', 8)
% xlabel(texlabel('Time, t (s)'), 'FontSize', 30)
% ylabel('Indicator', 'FontSize', 30)
% ax = gca;
% ax.FontSize = 45;
% grid on;
% lgd = legend('$\theta_{A,1}$ (i.e. d$m_1$/d$t$)', '$\theta_{A,2}$ (i.e. d$m_2$/d$t$)', '$\theta_{A,3}$ (i.e. d$m_3$/d$t$)', '$\theta_{A,4}$ (i.e. d$m_4$/d$t$)', 'Interpreter','latex');
% ldg.FontSize = 60;