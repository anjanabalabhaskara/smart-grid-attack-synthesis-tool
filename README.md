# Learning-based Attack Synthesis For Safety Falsification of Smart Grid

The tool is designed to find attack vectors for smart grid models that remain undiscovered by the detection units present in the grid. The vectors tamper the sensor and actuator data of Smart Grid. These attack vectors target specific components of the grid causing abnormal behavior like brown-outs, without getting discovered by the anomaly detectors present in the grid. We use a methodology that synthesizes attack vectors using a learning-based probabilistic engine (Reinforcement Learning (RL)) and a stochastic optimization-based formal engine (S-TaLiRo). As a first phase, an RL-based attacker agent learns to inject the most effective input load-altering attack (LAA) sequences to push the system to its transient states for an elongated period as quickly as possible without raising any alarm. The probabilistic LAA sequences thus recovered are automatically augmented in the system model. This is given as input to a well-known simulation-based falsification engine S-TaLiRo that synthesizes false data injection attack (FDIA) sequences intending to falsify the set points of the generation unit. These additional FDIA perturbations thus uncovered, are formally guaranteed to send the generator units out of synchrony with the rest of the power grid exploiting the transient characteristics induced by the RL agent while maintaining stealth.

<img src="https://user-images.githubusercontent.com/103938112/213892560-a93829cb-b429-47e9-86c2-8daefbc27ccc.png" width="90%" height="90%"></br>


## Comparison of our tool with State of the Art

1.	The attack model in [7] tampers with the circuit breaker control signal to change the power grid topology. The effect of the proposed attack on the grid frequency which is a safety-critical parameter is not discussed in that work. Therefore, the time required by such an attack to make a grid unsafe remains undiscovered. Our work, on the other hand, tampers the circuit breaker control signals to induce Load Alteration Attack (LAA) which is simultaneously accompanied by False Data Injection Attack (FDIA) on the sensor measurements. This combination of the attack vector injected through the combination of two attack surfaces pushes the grid frequency out of safety range ([-0.5 Hz, 0.5 Hz]) at 0.1 seconds from the onset of the attack while remaining undiscovered by the detection units for 0.2 Seconds.

2.	The work in [4] ignores the presence of anomaly detection units in a grid to monitor the voltage and current surges. Therefore, there exists no clear visualization of whether the attack remains stealthy or gets discovered by the detection units. Whereas, the attack induced by our model remains undiscovered by the lightweight robust anomaly detection unit developed in our work.

3. The attack model developed in [12] drives the frequency of an IEEE 9 Bus model away from the safety region ([-0.5 Hz, 0.5 Hz]) in 1.18 seconds while our attack model does the same in 0.1 seconds. The authors here consider NERC-CIP protocols for attack detection which are not effective enough against transient attacks. Because, when the transient dynamics of the power grid exceed the safety zone, the grid’s steady-state converged values reside within NERC CIP requirement limits, therefore the attack does not get discovered. While for our detection unit, the detection threshold is selected from the nominal system behavior which detects transient attacks. Our attack model however remains undetected for 0.2 seconds by our detection units which signify its effectiveness in terms of stealth.

4.	We compare the attack model developed in our work with that of [9] for IEEE (5, 9, 14, and 39) bus test cases. We use the metric Time To Emergence (TTE) to evaluate our comparison. TTE is the time from the onset of an attack sequence (0 seconds here for both the attack models) to the first time instant when the change in frequency, in a power grid is out of the safety region [-0.5 Hz, 0.5 Hz] (refer [9]). An attack is considered to be more effective if it takes minimum TTE to push the grid frequency out of the safety range. The TTE metrics for the two attack models are tabulated below.

![DAC1](https://user-images.githubusercontent.com/103938112/213914550-1db95379-f3c2-4efb-a019-fb181a5970c5.png)

**The frequency deviation of power grid along with the TTE for the two attack models are demonstrated below**</br> 

   <img src="https://user-images.githubusercontent.com/103938112/214034470-8e6a029e-24dd-4402-b2dd-46720f216fc7.png" width="85%" height="80%"></br>
   
   In Fig1 we plot the change in frequency of an IEEE 5 bus power grid model. The green (with square markers), blue (with big circle markers), red (with small circle markers), and orange (with down triangle markers) denote the change in grid frequency under the influence of our attack model, change in grid frequency under the influence of attack model developed in [9], upper safety limit of change in frequency and lower safety limit of change in frequency respectively. As can be seen in this figure the TTE1 is 2.5 seconds and TTE2 is 0.7 seconds. This indicates that our attack model is capable of pushing the grid frequency beyond its safety limit faster as compared to [9].</br>

   <img src="https://user-images.githubusercontent.com/103938112/214040624-f1745863-2e37-4436-9e26-346a1bfb6fd9.png" width="85%" height="80%"></br>
   
   In Fig2 we plot the change in frequency of an IEEE 9 bus power grid model. The green (with square markers), blue (with big circle markers), red (with small circle markers), and orange (with down triangle markers) denote the change in grid frequency under the influence of our attack model, change in grid frequency under the influence of attack model developed in [9], upper safety limit of change in frequency and lower safety limit of change in frequency respectively. As can be seen in this figure the TTE1 is 0.7 seconds and TTE2 is 0.1 seconds. This indicates that our attack model is capable of pushing the grid frequency beyond its safety limit faster as compared to [9].</br>
 
   <img src="https://user-images.githubusercontent.com/103938112/214040890-f6bbc927-de7b-4b15-b632-41a0fcae6566.png" width="85%" height="80%"></br>
   
  In Fig3 we plot the change in frequency of an IEEE 14 bus power grid model. The green (with square markers), blue (with big circle markers), red (with small circle markers), and orange (with down triangle markers) denote the change in grid frequency under the influence of our attack model, change in grid frequency under the influence of attack model developed in [9], upper safety limit of change in frequency and lower safety limit of change in frequency respectively. As can be seen in this figure the TTE1 is 1.93 seconds and TTE2 is 0.1 seconds. This indicates that our attack model is capable of pushing the grid frequency beyond its safety limit faster as compared to [9].</br>
   
   <img src="https://user-images.githubusercontent.com/103938112/214041174-2279ae3e-c4f7-4926-9861-e86f9721ddec.png" width="85%" height="80%"></br>

In Fig4 we plot the change in frequency of an IEEE 39 bus power grid model. The green (with square markers), blue (with big circle markers), red (with small circle markers), and orange (with down triangle markers) denote the change in grid frequency under the influence of our attack model, change in grid frequency under the influence of attack model developed in [9], upper safety limit of change in frequency and lower safety limit of change in frequency respectively. As can be seen in this figure the TTE1 is 41.75 seconds and TTE2 is 34.08 seconds. This indicates that our attack model is capable of pushing the grid frequency beyond its safety limit faster as compared to [9].</br>


**The above comparisons show that the attack vectors synthesized using our tool-chain**
- is more effective in making a power grid unsafe compared to the state-of-the-art, 
- explores a combinations of possible vulnerable points in a power grid model, 
- formally ensures the minimum robustness of the system towards the desired safety property (also, scalable).

## Prerequisites (for running the tool):

* Platform: 32/64 bit Windows Operating System.
* External Tools: Matlab R2021a.
* Other Requirements: S-taliro tool-box https://sites.google.com/a/asu.edu/s-taliro/s-taliro , Matlab Reinforcement Learning Toolbox.
* For uploading the designed power grid model for an attack to the Graphical User Interface (GUI) tool the user is required to insert an RL agent block in his/her Simulink model. The user then labels the attack points for FDIA and LAA in the model through ports available in Simulink. (The RL agent induces LAA by manipulating the circuit breaker switching signal and S-Taliro induces FDIA by tampering with the reference set point of the generator unit). The user also needs to collect the output parameter he/she is interested to view the waveforms into a vector and connect it to the suitable port.

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

In the above figure, r1 represents the upper safety limit for grid frequency and r2 represents the lower safety limit for grid frequency. r3 represents the threshold value for the residue-based detection unit.

### **Step 3:**
In the predicate settings tab, the user maps the logic specification in step 2 to the predicates over the output space of the model.
For example, suppose there are two outputs x = [y1,y2]. Here y1 is the frequency of a generator in the grid, and y2 is the residue value of the detection unit attached to that generator.
 Predicate r1 checks if y1 < = b1 (b1 is a constraint),therefore matrix A = [1 0] such that Ax <= b1
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
Here in InputMin and InputMax the user specifies the input range for false-data injection, in the Control Points tab the samples points for false-data injection, are selected by the user, in interpolation type the user specifies how to insert false-data in the simulation time.<br />

![Presentation_gui_tool pptx (14)](https://user-images.githubusercontent.com/96375883/213904015-2c6ee61f-fca1-40a1-a183-14581db112c1.svg)<br />

### **Step 11:**
Finally the user starts the simulation by clicking the run simulation button.</br>

![Presentation_gui_tool pptx (15)](https://user-images.githubusercontent.com/96375883/213904013-0e62f5a7-362f-452c-891e-b12382fe7110.svg)<br />

## Result plot

![frequency_comparison_9_bus](https://user-images.githubusercontent.com/96375883/213973704-ecfa6f10-b98d-47bd-8b10-2a8b001d41fa.svg)

A sample output plot for IEEE 9 Bus case is provided above.


