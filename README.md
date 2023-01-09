User Guide
===========

We have developed a tool to find a stealthy-attack vectors that tampers sensor/actuator data. These attack-vectord target various vulnerable points on Smart-Grid causing un-natural behavior without getting detected by anomaly detectors.

# smart-grid-attack-synthesis-tool

Step 1 : Download S-taliro from https://sites.google.com/a/asu.edu/s-taliro/s-taliro/download \
Step 2 : Setup S-taliro\
Step 3 : Copy test_run.m gui_app.mlapp to trunk/demos/Falsification demos\
Step 4 : Copy states_generator.mat, rl_agent.mat, rl_TOP.slx to trunk/demos/SystemModelsAndData.\
Step 5 : Copy the target simulink model to trunk/demos/SystemModelsAndData\
Step 6 : The input for the target simulink model is vector of length four, where first three are actions from RL-agent and the fourth input from S-taliro.\
Step 7 : The input and output for the target simulink file must be similar to one in example folder\
Step 8 : Run gui_app.mlapp

Note : The emulation plots of frequency and residue of IEEE (5, 9, 39) bus cases are also provided herewith.
