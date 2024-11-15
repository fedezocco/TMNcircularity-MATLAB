%% Implemented by Federico Zocco - Last update: 15 November 2024


%% Description 
% Run this script to initialize the Simulink model
% "NumericalExampleWithSolids.slx"; the Simulink model generates the results
% reported in [1] and it is an implementation of the equations describing
% the case of solids.

%% References
% [1] Zocco, F., 2024. Circularity of Thermodynamical Material Networks: 
% Indicators, Examples, and Algorithms. arXiv preprint arXiv:2209.15051.
% [2] Zocco, F., Sopasakis, P., Smyth, B. and Haddad, W.M., 2023. Thermodynamical 
% material networks for modeling, planning, and control of circular material 
% flows. International Journal of Sustainable Engineering, 16(1), pp.1-14.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

hours_to_simulate = 7;
T_final = 60*hours_to_simulate; % minutes


% NODE COMPARTMENT 1 (organization)
m_ini_PET = 8.1; % kg (real datum; mass accumulated over the previous 2 weeks)   
t_out_PET = 100; % minutes 
m_out_PET = 8.1; % kg (real datum) 

m_ini_HDPE = 4.1; % kg (real datum; mass accumulated over the previous 2 weeks) 
t_out_HDPE = 100; % minutes
m_out_HDPE = 4.1; % kg (real datum) 

m_ini_PP = 4.4; % kg (real datum; mass accumulated over the previous 2 weeks) 
t_out_PP = 100; % plastics for recycling are collected all together  
m_out_PP = 4.4; % kg (real datum)  


% ARC COMPARTMENT FROM 1 TO 2
hours_for_transportation_1to2 = 2;
transportation_time_1to2 = 60*hours_for_transportation_1to2; % minutes (real datum)  

m_ini_Transport1to2_PET = 0;
t_out_Transport1to2_PET = t_out_PET + transportation_time_1to2;

m_ini_Transport1to2_HDPE = 0;
t_out_Transport1to2_HDPE = t_out_HDPE + transportation_time_1to2;

m_ini_Transport1to2_PP = 0;
t_out_Transport1to2_PP = t_out_PP + transportation_time_1to2;


% NODE COMPARTMENT 2 (recycling center)
recycling_time = 40; % minutes
loss_due_to_contamination = 0.3; % real datum

m_ini_2_PET = 20;
t_out_2_PET = t_out_Transport1to2_PET + recycling_time;

m_ini_2_HDPE = 20;
t_out_2_HDPE = t_out_Transport1to2_HDPE + recycling_time;

m_ini_2_PP = 20;
t_out_2_PP = t_out_Transport1to2_PP + recycling_time;


% ARC COMPARTMENT FROM 2 TO 1
hours_for_transportation_2to1 = 0.5; % no congestion found, hence shorter than trip from 1 to 2 
transportation_time_2to1 = 60*hours_for_transportation_2to1; % minutes 

m_ini_Transport2to1_PET = 0;
t_out_Transport2to1_PET = t_out_2_PET + transportation_time_2to1;

m_ini_Transport2to1_HDPE = 0;
t_out_Transport2to1_HDPE = t_out_2_HDPE + transportation_time_2to1;

m_ini_Transport2to1_PP = 0;
t_out_Transport2to1_PP = t_out_2_PP + transportation_time_2to1;


% NODE COMPARTMENT 3
m_ini_3_PET = 150;
t_out_3_PET = 1;
m_out_3_PET = 2;

m_ini_3_HDPE = 100;
t_out_3_HDPE = 1;
m_out_3_HDPE = 0.5; 

m_ini_3_PP = 120;
t_out_3_PP = 1;
m_out_3_PP = 1;


% ARC COMPARTMENT FROM 3 TO 1
hours_for_transportation_3to1 = 0.1;
transportation_time_3to1 = 60*hours_for_transportation_3to1; % minutes 

m_ini_Transport3to1_PET = 0;
t_out_Transport3to1_PET = t_out_3_PET + transportation_time_3to1; 

m_ini_Transport3to1_HDPE = 0;
t_out_Transport3to1_HDPE = t_out_3_HDPE + transportation_time_3to1;

m_ini_Transport3to1_PP = 0;
t_out_Transport3to1_PP = t_out_3_PP + transportation_time_3to1;