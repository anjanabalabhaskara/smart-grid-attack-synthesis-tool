# Counter Example Guided Attack Synthesis Tool For Smart Grid
We have developed a tool to find attack vectors for smart grid models that remain undiscovered by the detection units present in the grid. The vectors tamper the sensor and actuator data of Smart Grid. These attack vectors target specific components of the grid causing abnormal behavior like brown-outs, without getting discovered by the anomaly detectors present in the grid. We use a methodology that synthesizes attack vectors using a learning-based probabilistic engine (Reinforcement Learning (RL)) and a stochastic optimization-based formal engine (S-Taliro). As a first phase, an RL-based attacker agent learns to inject the most effective input load-altering attack (LAA) sequences to push the system to its transient states for an elongated period as quickly as possible without raising any alarm. The probabilistic LAA sequences thus recovered are automatically augmented in the system model. This is given as input to a well-known simulation-based falsification engine S-TaLiRo that synthesizes false data injection attack (FDIA) sequences intending to falsify the set points of the generation unit. These additional FDIA perturbations thus uncovered, are formally guaranteed to send the generator units out of synchrony with the rest of the power grid exploiting the transient characteristics induced by the RL agent while maintaining stealth.

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
* Load all the .mat files from C:\trunk\demos\SystemModelsAndData into the matlab workspace.
* Run "H = staliro_gui" in matlab command window to open the Graphical User Interface (GUI)

# Demonstration of the Graphical User Interface (GUI) tool:
**Step 1:**
The user uploads his/her power grid simulink model (in .mdl format) (eg. IEEE5bus.mdl, IEEE9bus.mdl, IEEE14bus.mdl, IEEE39bus.mdl) to the tool by pressing the Select Model button. The file explorer button pops up from where the user can select his/her power grid simulink model.<br />
![Presentation_gui_tool pptx](https://user-images.githubusercontent.com/96375883/213867905-e1ab54ed-1125-408a-8848-b14e6cfaf77a.svg)<br />
![Screenshot 2023-01-21 100606](https://user-images.githubusercontent.com/103938112/213847320-e21604a5-b92b-43b1-9408-130dc4ca08a2.png)
**Step 2:**
Next in the specification tab, the user enters the safety properties for the power grid (i.e, the upper and lower bound limit for power grid frequency) and set the point value for the detection unit in the grid in the form of Metric Temporal Logic (MTL) equation. <br />
![Presentation_gui_tool pptx](https://user-images.githubusercontent.com/96375883/213867833-d433439a-172a-43e7-b67f-c401ae72176e.svg)<br />
![specification](https://user-images.githubusercontent.com/96375883/213866926-e5e6ed3a-d5e0-41cc-afad-8b4b1b15e53a.png)<br />
In the above figure r1 represents upper safety limit for grid frequency and r2 represents lower safety limit for grid frequency. r3 represents the threshold value for the residue based detection unit.

**Step 3:**
In the Predicate settings tab, the user maps the logic specification in step 2 to the predicates over the output space of the model.
For example, Suppose there are two outputs x = [y1,y2]. Where let y1 be the frequency of a generator in the grid and y2 is the residue value of the detection unit attached to that generator.
 Predicate r1 checks if y1 < = b1 (b1 is a constraint).
 therefore matrix A = [1 0] such that Ax <= b1
 similarly to check y1 >= b2 (b2 is a constraint) , A = [-1 0]  such that -Ax <= -b2 which implies Ax >= b2.
![Presentation_gui_tool pptx](https://user-images.githubusercontent.com/96375883/213867983-ad64e988-15ca-46ae-918d-51dd2aefd837.svg)<br />
![Screenshot 2023-01-21 175257](https://user-images.githubusercontent.com/96375883/213866744-8742c049-158a-44ee-8ce1-5405ef4fcfd3.png)
 
 **Step 4:**
 Next the user specifies which IEEE bus architecture did he/she upload. This step is crucial as it maps the trained RL agent with the S-Taliro tool. 
![Presentation_gui_tool pptx (1)](https://user-images.githubusercontent.com/96375883/213868046-308bee56-3368-4d54-864c-a5eb2fb96e3e.svg)<br />
![bus_architecture](https://user-images.githubusercontent.com/96375883/213867082-b319fd4e-5c9a-42d6-8097-52f9b76e4f53.png)<br />

**Step 5:**
The user specifies how many times the simulink model will execute by pressing the Number of run button
![Presentation_gui_tool pptx](https://user-images.githubusercontent.com/96375883/213868412-cb3ca0f3-3bcd-4be7-acd0-d57eec060e5f.svg)<br />
![Screenshot_20230121_133607](https://user-images.githubusercontent.com/96375883/213867174-4dcd52fc-9b52-4d9e-98e2-bcd241a37204.png)<br />

**Step 6:**
In this step the user specifies the time duration in seconds for which the simulation is to be continued by pressing the Simulation Time tab.
![Presentation_gui_tool pptx](https://user-images.githubusercontent.com/96375883/213868630-b11035c4-5cb3-4a09-8b0f-1bea9f8a9c80.svg)<br />
![Screenshot_20230121_133627](https://user-images.githubusercontent.com/96375883/213867221-523b208a-e61e-4614-9ccf-178ec20d99f7.png)<br />

**Step 7:**
The user choses a solver for the simulink model using this tab.</br>
![Presentation_gui_tool pptx (1)](https://user-images.githubusercontent.com/96375883/213868879-961e436c-b6e3-49ca-9a2c-1b3b7178d105.svg)<br />
![Screenshot_20230121_133650](https://user-images.githubusercontent.com/96375883/213867273-31b91070-2ef0-430b-9d1f-862e09ea75f6.png)<br />

**Step 8:**
Next the time step at which the model will be executed is specified by the user in the Sample Time tab.</br>
![Presentation_gui_tool pptx](https://user-images.githubusercontent.com/96375883/213868786-e7868ba6-9201-44c9-a4b7-8f8188bf4427.svg)<br />
![Screenshot_20230121_133713](https://user-images.githubusercontent.com/96375883/213867312-332964d8-fbe6-465d-9bad-8c3cd6976184.png)<br />

**Step 9:**
The initial value for false data generation is specified by the user in this tab.</br> 
![seed](https://user-images.githubusercontent.com/103938112/213870862-d6677280-5213-4835-a529-a038c2518a61.png)
![Screenshot_20230121_133735](https://user-images.githubusercontent.com/96375883/213867349-437b66a0-4095-4d45-ae02-092a9398071f.png)

**Step 10:**
Here in InputMin and InputMax the user specifies the input range for false-data injection, in Control Points tab the samples points for false-data injection is selected by the user, in interpolation type the user specifies how to insert false-data in the simulation time.</br> 
![inputs](https://user-images.githubusercontent.com/96375883/213867400-c0e01f57-daae-4e9f-a124-1843e95e6a72.png)

**Step 11:**
Finally the user starts the simulation by pressing the run simulation button.</br>
![Screenshot_20230121_142611](https://user-images.githubusercontent.com/96375883/213867426-34a240ae-ca6f-4ee0-8539-43c37711faed.png)

