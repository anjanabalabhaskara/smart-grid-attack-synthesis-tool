User Guide
===========

We have developed a tool to find stealthy-attack vectors that tamper the sensor and actuator data of Smart Grid. These attack vectors target specific components of the grid causing abnormal behavior like brown-outs, without getting discovered by the anomaly detectors present in the grid. We use a methodology that synthesizes attack vectors using a learning-based probabilistic engine (Reinforcement Learning (RL)) and a stochastic optimization-based formal engine (S-Taliro). As a first phase, a Reinforcement Learning (RL)-based attacker agent learns to inject the most effective input load altering attack (LAA) sequences  to push the system to its transient states for an elongated period as quickly as possible without raising any alarm. The probabilistic LAA sequences thus recovered are automatically augmented in the system model. This is given as input to a well-known simulation-based falsification engine S-TaLiRo that synthesizes false data injection attack (FDIA) sequences with the aim to falsify the set points of the generation unit. These additional FDIA perturbations thus uncovered, are formally guaranteed to send the generator units out of synchrony with the rest of the power grid exploiting the transient characteristics induced by the RL agent while maintaining stealth.

![alt text](images/toolSetup.png)

GUI description
================
This tool combines False Data Injection (FDI) and Load Alteration (LA) attacks to make a power grid unstable while remaining undetected by the detection units present in a grid. The load alteration attacks are induced by a reinforcement learning (RL) agent and the FDI attacks are done by a simulation based formal tool STaliro.

This tool requires an user to input a power grid Simulink model with. mdl extension. The user is also required to label the points in the simulink model where he desires to attack.
![tool1](https://user-images.githubusercontent.com/103938112/213846935-f0252abd-7c63-43cb-b0d4-58fc5f5728b6.png)

## Simulink work-around
The user simulink model needs some work around. 
* The Simulink file should have .mdl extension
* Use "inport" block to collect attack vectors from the tool. Use "demux" block to split vectors generated from "RL-agent" and "S-taliro"(index 1 is vector generated from "RL-agent", index 2 is vector generated from "S-taliro")


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
 The user specifies which IEEE bus architecture did he/she upload. 
 ![GUI_STEP4](https://user-images.githubusercontent.com/103938112/213849659-daea62e2-c310-4f01-8ef9-de309087edd3.png)

**Step 5:**
The user specifies how many times the simulink model will execute by pressing the Number of run button

**Step 6:**
The user specifies the time duration in seconds for which the simulation is to be continued in the Simulation Time tab.
![GUI_STEP6](https://user-images.githubusercontent.com/103938112/213858471-ad81cf97-6657-4e6a-96b0-cc23849ccca0.png)

**Step 7:**
The user chhoses a solver for the simulink model using this tab.</br>
![GUI_STEP7](https://user-images.githubusercontent.com/103938112/213858567-c69eb222-e11a-4167-aa3d-7a964cdbda05.png)

**Step 8:**
Time time step at which the model will be executed is specified in the Sample Time tab.</br>
![GUI_STEP8](https://user-images.githubusercontent.com/103938112/213858756-f7be97cd-7ce1-4995-92f4-10bf26747406.png)

**Step 9:**
The initial value for false data generation is specified by the user in this tab.</br> 
![GUI_STEP9](https://user-images.githubusercontent.com/103938112/213858966-ad11241e-2335-41a8-84ba-139a5e8e9568.png)

**Step 10:**
Here in InputMin and InputMax the user specifies the input range for false-data injection, in Control Points tab the samples points for false-data injection is selected by the user, in interpolation type the user specifies how to insert false-data in the simulation time.</br> 
![GUI_STEP10](https://user-images.githubusercontent.com/103938112/213860006-795c0bb5-15a1-4d16-86c5-dace6cf0446c.png)

**Step 11:**
Finally the user starts the simulation by pressing the run simulation button.</br>
![GUI_STEP11](https://user-images.githubusercontent.com/103938112/213860176-8944b0ea-9c22-41bf-bf54-7644e6fd448d.png)

