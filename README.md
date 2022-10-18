# smart-grid-attack-synthesis-tool

Step 1 : Download S-taliro from https://sites.google.com/a/asu.edu/s-taliro/s-taliro/download \
Step 2 : Setup S-taliro\
Step 3 : Copy test_run.m gui_app.mapp to trunk/demos/Falsification demos\
Step 4 : Copy states_cp_1.mat, agent_trained_not_22.mat, rl_top.slx to trunk/demos/SystemModelsAndData.\
Step 5 : Copy the target simulink model to trunk/demos/SystemModelsAndData\
Step 6 : The input for the target simulink model is vector of length four, where first three are actions from RL-agent and the fourth input from \ 
S-taliro.\
Step 7 : The input and output for the target simulink file must be similar to one in example folder
