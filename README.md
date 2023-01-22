# **L**earning-based **A**ttack **S**ynthesis for **S**afety **Fal**sification of **S**mart Grids

The tool is designed to find attack vectors for smart grid models that remain undiscovered by the detection units present in the grid. The vectors tamper the sensor and actuator data of Smart Grid. These attack vectors target specific components of the grid causing abnormal behavior like brown-outs, without getting discovered by the anomaly detectors present in the grid. We use a methodology that synthesizes attack vectors using a Reinforcement learning (RL)-based probabilistic engine and a stochastic optimization-based formal engine (S-Taliro). In the first step our methodology, an RL-based attacker agent learns to inject the most effective input load-altering attack (LAA) sequences to push the system to its transient states for an elongated period as quickly as possible without raising any alarm. In the second step, the probabilistic LAA sequences thus recovered are automatically augmented in the system model. This is given as input to a well-known simulation-based falsification engine S-TaLiRo that synthesizes false data injection attack (FDIA) sequences intending to falsify safety properties of the generation unit. These additional FDIA perturbations thus uncovered, are formally guaranteed to send the generator units out of synchrony with the rest of the power grid exploiting the transient characteristics induced by the RL agent while maintaining stealth.

<img src="https://user-images.githubusercontent.com/103938112/213892560-a93829cb-b429-47e9-86c2-8daefbc27ccc.png" width="90%" height="90%"></br>


## Comaprison of our tool with State of the Art

1.	The attack model in [7] tampers with one circuit breaker control signal to make the power grid frequency unsafe. However, there remains no guarantee and evidence in their work that the grid frequency will not return to its safety range in the attack interval. Our model on the other hand combines Load Alteration Attack (LAA) induced by an RL agent with False Data Injection Attack (FDIA) produced by the simulation-based verification tool S-taliro that formally guarantees that the grid frequency deviates quickly and remains out of safety range while maintaining stealth.
2.	The work in [4] ignores the presence of anomaly detection units in a grid to monitor the voltage and current surges. Therefore, there exists no clear visualization of whether the attack remains stealthy or gets discovered by the detection units. Whereas, the attack induced by our model remains undiscovered by the lightweight robust anomaly detection unit developed in our work.
3.	The attack model developed in [12] drives the frequency of an IEEE 9 Bus model away from the safety region ([-0.5 Hz, 0.5 Hz) in 1.18 seconds while our attack model does the same in 0.1 seconds. The authors here consider NERC-CIP protocols for attack detection which are not effective enough against transient attacks. While for our detection unit, the detection threshold is selected from the nominal system behavior that avoids false alarms.
4.	We compare the attack model developed in our work with that of [9] for IEEE (5, 9, 14, and 39) bus test cases. We use the metric Time To Emergence (TTE) to evaluate our comparison. TTE is the time from the onset of an attack sequence (0 seconds here for both the attack models) to the first time instant when the change in frequency, in a power grid is out of the safety region [-0.5 Hz, 0.5 Hz] (refer [9]). An attack is considered to be more effective if it takes minimum TTE to push the grid frequency out of the safety range. The TTE metrics for the two attack models are tabulated below.<br />

![DAC1](https://user-images.githubusercontent.com/103938112/213914550-1db95379-f3c2-4efb-a019-fb181a5970c5.png)

**The frequency deviation of power grid along with the TTE for the two attack models are demonstrated below**</br> 

   <img src="https://user-images.githubusercontent.com/103938112/213914338-4c0538cd-ac0d-424b-8bd4-a65ea6b625f0.png" width="85%" height="80%"></br>
   
 
   <img src="https://user-images.githubusercontent.com/103938112/213915136-e3f769e2-b910-4fbe-97a3-0c40dcd25170.png" width="85%" height="80%"></br>
 

   <img src="https://user-images.githubusercontent.com/103938112/213914613-c9968fab-8c53-4155-9239-7549b866fa1f.png" width="85%" height="80%"></br>
   
   
   <img src="https://user-images.githubusercontent.com/103938112/213914675-8189891c-dd0a-4851-816c-f308ae4acbe9.png" width="85%" height="80%"></br>


**The above comparisons show that the attack vectors synthesized using our tool-chain**
- is more effective in making a power grid unsafe compared to the state-of-the-art, 
- explores a combinations of possible vulnerable points in a power grid model, 
- formally ensures the minimum robustness of the system towards the desired safety property (also, scalable).

## Prerequisites (for running the tool):

* Platform: 32/64 bit Windows Operating System.
* External Tools: Matlab R2021a.
* Other Requirements: S-taliro tool-box https://sites.google.com/a/asu.edu/s-taliro/s-taliro , Matlab Reinforcement Learning Toolbox.
* For uploading the designed power grid model for an attack to the Graphical User Interface (GUI) tool the user is required to insert an RL agent block in his/her Simulink model. The user then labels the attack points for FDIA and LAA in the model through ports available in Simulink. (The Rl agent induces LAA by manipulating the circuit breaker switching signal and S-Taliro induces FDIA by tampering the reference set point of the generator unit). The user also needs to collect the output parameter he/she is interested to view the waveforms into a vector and connect it to the suitable port.

## Installation guide:

* Setup S-taliro toolbox by pasting "setup_staliro.m" command in the Matlab command window.
* Copy all the .mat files from folder mat_files and simulink models from folder rl_models_simulink in the repository to the path C:\trunk\demos\SystemModelsAndData.
* Copy staliro_gui.m, load_mat.m and staliro_gui.fig to the path C:\trunk.
* Run "H = staliro_gui" in matlab command window to open the Graphical User Interface (GUI).

## Demonstration of the GUI of our tool:

### **Step 1**:
The user uploads his/her power grid simulink model (in .mdl format) (eg. IEEE5bus.mdl, IEEE9bus.mdl, IEEE14bus.mdl, IEEE39bus.mdl) to the tool by pressing the Select Model button. The file explorer button pops up from where the user can select his/her power grid simulink model.<br />

![Presentation_gui_tool pptx (5)](https://user-images.githubusercontent.com/96375883/213904029-e02e67cf-60c4-42d9-bf18-a3856160e31d.svg) <br />

### **Step 2:**
Next in the specification tab, the user enters the safety properties for the power grid (i.e, the upper and lower bound limit for power grid frequency) and set the point value for the detection unit in the grid in the form of the MTL equation. <br />

![Presentation_gui_tool pptx (6)](https://user-images.githubusercontent.com/96375883/213904027-d48d7b17-e395-48fd-aed1-5d12633d8ffa.svg)<br />

In the above figure r1 represents upper safety limit for grid frequency and r2 represents lower safety limit for grid frequency. r3 represents the threshold value for the residue based detection unit.

### **Step 3:**
In the Predicate settings tab, the user maps the logic specification in step 2 to the predicates over the output space of the model.
For example, Suppose there are two outputs x = [y1,y2]. Where let y1 be the frequency of a generator in the grid and y2 is the residue value of the detection unit attached to that generator.
 Predicate r1 checks if y1 < = b1 (b1 is a constraint).
 therefore matrix A = [1 0] such that Ax <= b1
 similarly to check y1 >= b2 (b2 is a constraint) , A = [-1 0]  such that -Ax <= -b2 which implies Ax >= b2.
 
![Presentation_gui_tool pptx (7)](https://user-images.githubusercontent.com/96375883/213904025-3edcda53-0dfb-42ec-ae52-9eaf0f3e472c.svg)<br />
 
 ### **Step 4:**
 The user specifies which IEEE bus architecture did he/she upload by clicking the appropriate button. 
 
![Presentation_gui_tool pptx (8)](https://user-images.githubusercontent.com/96375883/213904024-bca0481e-962a-411a-9f56-1eac85d403ca.svg) <br />

### **Step 5:**
The user specifies how many times the simulink model will execute in the run tab

![Presentation_gui_tool pptx (9)](https://user-images.githubusercontent.com/96375883/213904023-4528cde7-aec1-4d3f-89fe-fcdbbc0272ee.svg)<br />

### **Step 6:**
The user specifies the time duration in seconds for which the simulation is to be continued in the Simulation Time tab.

![Presentation_gui_tool pptx (10)](https://user-images.githubusercontent.com/96375883/213904020-58ef7622-6119-41dd-9367-281a07a954e3.svg)<br />

### **Step 7:**
The user choses a solver for the simulink model using this tab.<br />

![Presentation_gui_tool pptx (11)](https://user-images.githubusercontent.com/96375883/213904019-bc738d9c-016e-468f-8a5b-272d836c1235.svg)<br />

### **Step 8:**
Time time step at which the model will be executed is specified in the Sample Time tab.<br />

![Presentation_gui_tool pptx (12)](https://user-images.githubusercontent.com/96375883/213904018-c0ef76fb-85d6-4ebd-bc26-91d50d81fae3.svg)<br />

### **Step 9:**
The initial value for false data generation is specified by the user in this tab.<br />

![Presentation_gui_tool pptx (13)](https://user-images.githubusercontent.com/96375883/213904016-62b644ef-7068-4bc4-9814-f733293c2e4e.svg)<br />

### **Step 10:**
Here in InputMin and InputMax the user specifies the input range for false-data injection, in Control Points tab the samples points for false-data injection is selected by the user, in interpolation type the user specifies how to insert false-data in the simulation time.<br />

![Presentation_gui_tool pptx (14)](https://user-images.githubusercontent.com/96375883/213904015-2c6ee61f-fca1-40a1-a183-14581db112c1.svg)<br />

### **Step 11:**
Finally the user starts the simulation by pressing the run simulation button.</br>

![Presentation_gui_tool pptx (15)](https://user-images.githubusercontent.com/96375883/213904013-0e62f5a7-362f-452c-891e-b12382fe7110.svg)<br />

## Result plot

<img src="https://user-images.githubusercontent.com/103938112/213894191-8e587186-c6d1-4173-9be6-25ffbb3ee784.png" width="80%" height="75%"></br>

A sample frequency vs time plot for IEEE 9 Bus under attack synthesized using our tol-chain is provided above.


