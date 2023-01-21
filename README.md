User Guide
===========

We have developed a tool to find stealthy-attack vectors that tamper the sensor and actuator data of Smart Grid. These attack vectors target specific components of the grid causing abnormal behavior like brown-outs, without getting discovered by the anomaly detectors present in the grid. We use a methodology that synthesizes attack vectors using a learning-based probabilistic engine and a stochastic optimization-based formal engine. We have provided a detailed comparison between our attack tool and state-of-the-art attack methodologies here- https://anonymous.4open.science/r/Attack-Model-Comparison-4A80/README.md 

![alt text](images/toolSetup.png)

GUI description
================
This tool combines False Data Injection (FDI) and Load Alteration (LA) attacks to make a power grid unstable while remaining undetected by the detection units present in a grid. The load alteration attacks are induced by a reinforcement learning (RL) agent and the FDI attacks are done by a simulation based formal tool STaliro.

This tool requires an user to input a power grid Simulink model with. mdl extension. The user is also required to label the points in the simulink model where he desires to attack.
![tool1](https://user-images.githubusercontent.com/103938112/213846935-f0252abd-7c63-43cb-b0d4-58fc5f5728b6.png)


Getting Started
================
