# Counter Example Guided Attack Synthesis Tool For Smart Grid
We have developed a tool to find stealthy-attack vectors that tamper the sensor and actuator data of Smart Grid. These attack vectors target specific components of the grid causing abnormal behavior like brown-outs, without getting discovered by the anomaly detectors present in the grid. We use a methodology that synthesizes attack vectors using a learning-based probabilistic engine (Reinforcement Learning (RL)) and a stochastic optimization-based formal engine (S-Taliro). As a first phase, a RL-based attacker agent learns to inject the most effective input load altering attack (LAA) sequences  to push the system to its transient states for an elongated period as quickly as possible without raising any alarm. The probabilistic LAA sequences thus recovered are automatically augmented in the system model. This is given as input to a well-known simulation-based falsification engine S-TaLiRo that synthesizes false data injection attack (FDIA) sequences with the aim to falsify the set points of the generation unit. These additional FDIA perturbations thus uncovered, are formally guaranteed to send the generator units out of synchrony with the rest of the power grid exploiting the transient characteristics induced by the RL agent while maintaining stealth.

<img src="https://user-images.githubusercontent.com/103938112/213864878-fcb931a9-4dee-45d2-a4dd-b076f14dfa48.png" width="90%" height="90%"></br>

# Comaprison of our tool with State of the Art

1.	We compare the attack model developed in our work with that of [9] for IEEE (5, 9, 14 and 39) bus test cases.
2.	We use the metric Time To Emergence (TTE) to evaluate our comparison.
3.	TTE is the time from the onset of an attack sequence to the first time instant when the change in frequency (∆ω), in a power grid is out of the safety region (εL, εU). Where, εL = −0.5Hz and εU = 0.5Hz (refer [9]).
4.	An attack is considered to be more effective if it takes minimum TTE to push the grid frequency out of the safety range.
5.	The TTE metrics for the two attack model are tabulated below.<br />
![ComparisonTable](https://user-images.githubusercontent.com/103938112/213844734-af3ce39d-4c57-4179-9d8e-3354a43c5823.png)

6. The frequency deviation of power grid along with the TTE for the two attack models are demonstrated below.</br> 

<img src="https://user-images.githubusercontent.com/103938112/213830897-f5c68617-a435-4099-87d0-959be5135a80.png" width="85%" height="80%"></br>
The above picture depicts the TTE for an IEEE 5 Bus power grid for both the attack models. The TTE for our case is 0.7 seconds while that for [9] is 2.5 seconds.  

<img src="https://user-images.githubusercontent.com/103938112/213830986-ae446338-b61c-4b45-ba2b-f4447661a72c.png" width="85%" height="80%"></br>
The above picture depicts the TTE for an IEEE 9 Bus power grid for both the attack models. The TTE for our case is 0.1 seconds while that for [9] is 0.7 seconds. 


<img src="https://user-images.githubusercontent.com/103938112/213831003-325b61a6-446e-4b1e-8deb-6bfb584e05ef.png" width="85%" height="80%"></br>
The above picture depicts the TTE for an IEEE 14 Bus power grid for both the attack models. The TTE for our case is 0.1 seconds while that for [9] is 1.93 seconds. 

<img src="https://user-images.githubusercontent.com/103938112/213831027-b81399e8-04cc-44c5-a104-89b4ddf707b9.png" width="85%" height="80%"></br>
The above picture depicts the TTE for an IEEE 39 Bus power grid for both the attack models. The TTE for our case is 34.08 seconds while that for [9] is 41.75 seconds. 

All the above comparisons justify that our attack model is more effective and faster in making a power grid unstable compared to the state-of-the-art. 

# Prerequisite (for running the tool):
* Platform: 32/64 bit Windows Opersting System
* External Tools: Matlab R2021a
* Other Requirements: S-taliro tool-box https://sites.google.com/a/asu.edu/s-taliro/s-taliro , Matlab Reinforcement Learning Toolbox
* Setup S-taliro toolbox by pasting "setup_staliro.m" command in the Matlab command window.
* Copy all the .mat files from folder mat_files and simulink models from folder rl_models_simulink in the repository to the path C:\trunk\demos\SystemModelsAndData
* Copy staliro_gui.m and staliro_gui.fig to the path C:\trunk
* Run "H = staliro_gui" in matlab command window to open the Graphical User Interface (GUI)

# Demonstration of the Graphical User Interface (GUI) tool:
**Step 1:**
The user uploads his/her power grid simulink model (in .mdl format) (eg. IEEE (5 bus, 9 bus, 14 bus, 39 bus)) to the tool by pressing the Select Model button. The file explorer button pops up from where the user can select his/her power grid simulink model.
![Screenshot 2023-01-21 100606](https://user-images.githubusercontent.com/103938112/213847320-e21604a5-b92b-43b1-9408-130dc4ca08a2.png)
**Step 2:**
In the specification tab, the user enters the safety properties for the power grid (i.e, the upper and lower bound limit for power grid frequency) and set the point value for the detection unit in the grid in the form of the MTL equation. 
![specification](https://user-images.githubusercontent.com/96375883/213866926-e5e6ed3a-d5e0-41cc-afad-8b4b1b15e53a.png)
In the above figure r1 represents upper safety limit for grid frequency and r2 represents lower safety limit for grid frequency. r3 represents the threshold value for the residue based detection unit.

**Step 3:**
In the Predicate settings tab, the user maps the logic specification in step 2 to the predicates over the output space of the model.
For example, Suppose there are two outputs x = [y1,y2]. Where let y1 be the frequency of a generator in the grid and y2 is the residue value of the detection unit attached to that generator.
 Predicate r1 checks if y1 < = b1 (b1 is a constraint).
 therefore matrix A = [1 0] such that Ax <= b1
 similarly to check y1 >= b2 (b2 is a constraint) , A = [-1 0]  such that -Ax <= -b2 which implies Ax >= b2.
 ![GUI_STEP3](![Screenshot 2023-01-21 175257](https://user-images.githubusercontent.com/96375883/213866744-8742c049-158a-44ee-8ce1-5405ef4fcfd3.png)
 
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

