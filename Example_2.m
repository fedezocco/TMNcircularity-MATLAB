%% Written by Federico Zocco
% Last modified: 19 December 2022

%% Example 2 of the source paper [1]. The network has 2 dynamic flows: 
% Gamma(1,2) = beta_1(t) = |sin(pi*t)|
% Gamma(1,3) = beta_2(t) = |cos(pi*t)|.
% The imposition of the mass balance leads to dynamic stocks, which is in
% contrast to Example 1.

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

% Initial conditions:
m1_0 = 10;
m2_0 = 10;
m3_0 = 10;
m4_0 = 10;

% Simulation time: 
simulation_time = 0:0.01:2;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m_vector = [];

for t = simulation_time 
    
    if t == 0
        m_vector(:,end+1) = [m1_0; m2_0; m3_0; m4_0];
    end

    if (0 < t) && (t < 0.5)
        m_vector(:,end+1) = [1.3*t + cos(pi*t)/pi - sin(pi*t)/pi; -cos(pi*t)/pi - 4*t; sin(pi*t)/pi - 3*t; 5.7*t] + [m1_0 - 1/pi; m2_0 + 1/pi; m3_0; m4_0];
    end
        
    if t == 0.5
        m_vector(:,end+1) = [m1_0 + 0.65 - 2/pi; m2_0 - 2 + 1/pi; m3_0 - 1.5 + 1/pi; m4_0 + 2.85];
    end

    if (0.5 < t) && (t < 1)
        m_vector(:,end+1) = [1.3*t + cos(pi*t)/pi + sin(pi*t)/pi; -cos(pi*t)/pi - 4*t; -sin(pi*t)/pi - 3*t; 5.7*t] + [m1_0 - 3/pi; m2_0 + 1/pi; m3_0 + 2/pi; m4_0];
    end

    if t == 1
        m_vector(:,end+1) = [m1_0 + 1.3 - 4/pi; m2_0 - 4 + 2/pi; m3_0 - 3 + 2/pi; m4_0 + 5.7];
    end

    if (1 < t) && (t < 1.5)
        m_vector(:,end+1) = [1.3*t - cos(pi*t)/pi + sin(pi*t)/pi; cos(pi*t)/pi - 4*t; -sin(pi*t)/pi - 3*t; 5.7*t] + [m1_0 - 5/pi; m2_0 + 3/pi; m3_0 + 2/pi; m4_0];
    end

    if t == 1.5
        m_vector(:,end+1) = [m1_0 + 1.9 - 6/pi; m2_0 - 6 + 3/pi; m3_0 - 4.5 + 3/pi; m4_0 + 8.5];
    end

    if (1.5 < t) && (t < 2)
        m_vector(:,end+1) = [1.3*t - cos(pi*t)/pi - sin(pi*t)/pi; cos(pi*t)/pi - 4*t; sin(pi*t)/pi - 3*t; 5.7*t] + [m1_0 - 7/pi; m2_0 + 3/pi; m3_0 + 4/pi; m4_0];
    end
       
    if t == 2
        m_vector(:,end+1) = [m1_0 + 2.6 - 8/pi; m2_0 - 8 + 4/pi; m3_0 - 6 + 4/pi; m4_0 + 11.4];
    end

end

theta_S = sum(m_vector,1); 
theta_D = std(m_vector);


%%% Plots (uncomment as needed):
 
% (1):
% plot(simulation_time, m_vector(1,:),'ok', 'LineWidth', 6)
% hold on;
% plot(simulation_time, m_vector(2,:),'or', 'LineWidth', 8)
% hold on;
% plot(simulation_time, m_vector(3,:),'ob', 'LineWidth', 8)
% hold on;
% plot(simulation_time, m_vector(4,:),'om', 'LineWidth', 8)
% xlabel(texlabel('Time, t (s)'), 'FontSize', 30)
% ylabel('Stock, m_i (kg)', 'FontSize', 30)
% ax = gca;
% ax.FontSize = 45;
% grid on;
% lgd = legend('$m_1$', '$m_2$', '$m_3$', '$m_4$', 'Interpreter','latex');
% ldg.FontSize = 60;

% (2): 
plot(simulation_time, theta_S,'ok', 'LineWidth', 8)
hold on;
plot(simulation_time, theta_D,'or', 'LineWidth', 8)
xlabel(texlabel('Time, t (s)'), 'FontSize', 30)
ylabel('Indicator', 'FontSize', 30)
ax = gca;
ax.FontSize = 45;
grid on;
lgd = legend('$\theta_S$', '$\theta_D$', 'Interpreter','latex');
ldg.FontSize = 60;