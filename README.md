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
We now give a step-by-step demonstration of how the tool works.

**Step 1:**
The user uploads his/her power grid model (eg. IEEE (5 bus, 9 bus, 14 bus, 39 bus)) to the tool by pressing the Select Model button. The file explorer button pops up from where the user can select his/her power grid simulink model.
![Screenshot 2023-01-21 100606](https://user-images.githubusercontent.com/103938112/213847320-e21604a5-b92b-43b1-9408-130dc4ca08a2.png)
**Step 2:**
In the specification tab, the user enters the safety properties for the power grid (i.e, the upper and lower bound limit for power grid frequency) and set the point value for the detection unit in the grid in the form of the MTL equation. 
![GUI_STEP2](https://user-images.githubusercontent.com/103938112/213848253-6e77bccb-2f08-41f4-a879-a5479fe5e45c.png)
In the above figure r1 represents upper safety limit for grid frequency and r2 represents lower safety limit for grid frequency. r3 represents the threshold value for the residue based detection unit.

**Step 3:**
In the Predicate settings tab, the user maps the logic specification in step 2 to the predicates over the output space of the model.
For example, Suppose there are two outputs x = [y1,y2]. Where let y1 be the frequency of a generator in the grid and y2 is the residue value of the detection unit attached to that generator.
 Predicate r1 checks if y1 < = b1 (b1 is a constraint).
 therefore matrix A = [1 0] such that Ax <= b1
 similarly to check y1 >= b2 (b2 is a constraint) , A = [-1 0]  such that -Ax <= -b2 which implies Ax >= b2.
 ![GUI_STEP3](https://user-images.githubusercontent.com/103938112/213849028-3915a34b-2070-4fa1-a037-ffc7be1474c7.png)
 
 **Step 4:**
 
 

