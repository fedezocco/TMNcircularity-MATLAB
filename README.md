# A MATLAB Implementation of Circularity Indicators of Thermodynamical Material Networks
This repository contains the source code of the paper "Circularity of Thermodynamical Material Networks: Indicators, Examples, and Algorithms" authored by Federico Zocco and available at: https://arxiv.org/pdf/2209.15051.pdf. If you use this code, please consider citing the corresponding paper.

The paper proposes the circularity indicators summarized below by leveraging graph theory and the formalism of thermodynamical material networks.

![SummaryTable](https://user-images.githubusercontent.com/62107909/209710427-472af1d2-7699-4bf8-9e1e-1ad3e1d10acf.JPG)

The paper also provides the dynamical equations for modeling highly dynamic stocks and flows of solid materials. The simulation outputs are shown below.

![solidFlows](https://github.com/user-attachments/assets/c75b1586-1193-48d2-98ab-1a63e52a267d)


## Getting Started
### Case of Fluid Materials
"Example_1.m" and "Example_2.m" generate the results shown in the paper. Other mass-flow matrices could be considered.
Debugging.m illustrates the calculation of the indicators for simple graphs. See the code for more information. 

### Case of Solid Materials
The Simulink file "NumericalExampleWithSolids.slx" generates the results reported in the paper. Before running the Simulink model, initialize it by running the script "NumericalExampleWithSolids_param.m".
