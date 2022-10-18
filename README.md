# smart-grid-attack-synthesis-tool

Step 1 : Download S-taliro from https://sites.google.com/a/asu.edu/s-taliro/s-taliro/download \
Step 2 : Setup S-taliro\
Step 3 : Copy test_run.m to trunk/demos/Falsification demos\
Step 4 : Copy states_cp_1.mat, agent_trained_not_22.mat, rl_top.slx to trunk/demos/SystemModelsAndData.\
Step 5 : Copy the target simulink model to trunk/demos/SystemModelsAndData\
Step 6 : The input for the target simulink model is vector of length four, where first three are actions from RL-agent and the fourth input from\ 
S-taliro.\
Step 7 : The inputs from inport should be split up using demux and sent to attack points in the target simulink file.\
Step 6 : All the observations should be collected together using mux and sent to outport.
