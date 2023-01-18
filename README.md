User Guide
===========

We have developed a tool to find stealthy-attack vectors that tamper the sensor and actuator data of Smart Grid. These attack vectors target specific components of the grid causing abnormal behavior like brown-outs, without getting discovered by the anomaly detectors prsent in the grid. We use a methodology that synthesizes attack vectors using a learning-based probabilistic engine and a stochastic optimization-based formal engine.

![alt text](images/toolSetup.png)

GUI description
================
This tool uses a simulink file with .mdl extension as input from user. It uses a reinforcement -learning frame-work from simulink and a formal tool S-Taliro to generate a stealthy attack vector.
![alt text](images/gui_screen.png)
