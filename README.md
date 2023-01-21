# Counter Example Guided Attack Synthesis Tool For Smart Grid
We have developed a tool to find stealthy-attack vectors that tamper the sensor and actuator data of Smart Grid. These attack vectors target specific components of the grid causing abnormal behavior like brown-outs, without getting discovered by the anomaly detectors present in the grid. We use a methodology that synthesizes attack vectors using a learning-based probabilistic engine (Reinforcement Learning (RL)) and a stochastic optimization-based formal engine (S-Taliro). As a first phase, a RL-based attacker agent learns to inject the most effective input load altering attack (LAA) sequences  to push the system to its transient states for an elongated period as quickly as possible without raising any alarm. The probabilistic LAA sequences thus recovered are automatically augmented in the system model. This is given as input to a well-known simulation-based falsification engine S-TaLiRo that synthesizes false data injection attack (FDIA) sequences with the aim to falsify the set points of the generation unit. These additional FDIA perturbations thus uncovered, are formally guaranteed to send the generator units out of synchrony with the rest of the power grid exploiting the transient characteristics induced by the RL agent while maintaining stealth.
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
* Install S-Taliro matlab tool-box from https://sites.google.com/a/asu.edu/s-taliro/s-taliro
* 

