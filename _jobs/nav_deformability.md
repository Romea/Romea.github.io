---
title: "PhD: Traversability analysis for safe navigation in deformable environments"
---
**Start date: As soon as possible**

*Supervised by: Romuald Aufrère (Institut Pascal), Roland Lenain (INRAE) and Johann Laconte (INRAE)*


In the pursuit of understanding the deformability of its surroundings, the mechanical team at INRAE-robotics engineered specialized bumpers, capable of gauging the malleability of obstacles. 
The primary objective of this Ph.D. research is to leverage this novel type of sensor and propose a probabilistic estimation technique for assessing the deformability of encountered obstacles.

![Bumpers on robots](/assets/images/jobs/nav_deformability/bumpers.JPG)

In the realm of agricultural robotics, machines frequently operate in unfamiliar and uncharted territories. 
Consequently, the robot must possess the capability to assess the navigability of its environment while actively exploring it. 
This necessitates the development of path planning algorithms that can control a delicate balance between exploration and task execution, all the while maintaining an acceptable level of risk. 

In this context, related works have proposed methods to learn the traversability of the environment via experience and learning.
However, such methods assume that the robot is always able to safely learn via experience, which is not always the case.
Getting stuck in loose soil, or colliding with a high mass obstacle, often rhyme with the end of the mission and possibly the loss of the robot.
Also, in the context of agricultural robotics, one must be able to sense the crops without actually driving on them.
Thus, we propose to design and use a sensor that is able to preemptively feel the deformability from a distance, hence not putting the robot at risk.
Using this novel sensor, the robot will be able to safely explore and map the environment.

The key contributions of the thesis are detailed in the following.

## Thesis Objectives
### Probabilistic Estimation of the Deformability
Dealing with deformable obstacles remains a relatively uncharted territory within the field of robotics.
Unlike rigid obstacles, deformable ones directly respond to the robot's actions, necessitating a more intricate approach to modeling their structural characteristics and interaction with the robot during traversal.
As such, more complex modeling of their structural properties are needed to effectively predict the interaction between them and the robot during traversal.
To address this challenge, the initial objective of this research is to establish a suitable model for characterizing the deformability of obstacles commonly encountered in agricultural environments, a ranging from tall grass to dense bushes and crops.
This modeling will serve as the foundation for developing a probabilistic mapping framework of the robot's surroundings.
Exteroceptive sensors, such as lidars, will be employed to measure both the position and deformability of the surrounding environment.

Prior works focus on learning-based traversability from prior experiences. 
However, such techniques inherently induce risk on the robot and failure are expected.
Furthermore, the deformability of the environment is never directly measured with a sensor, but derived from the robot's state during traversal.
As such, using bumper-like sensors would allow a safer, more robust way of measuring the traversability of an environment.

### Risk-Aware Path Planning Algorithms
After obtaining a deformability map of the environment, the subsequent task involves utilizing this information to generate safe trajectories within the surroundings.
The primary objective is to develop a planning approach that can yield meaningful metrics by considering the structural characteristics of both the robot and the environment.
For instance, a robust and durable robot would possess a higher capability for traversal compared to a smaller indoor counterpart.

Furthermore, while the security of the robot is crucial, preserving the environment is also paramount.
Consideration must be given to factors such as crops; even if the robot can navigate through a field, such behavior is obviously detrimental to the final goal of farming.
Therefore, both the risks of damaging the robot or the environment should be taken into account as one, unified framework.

### Navigation in Unknown Environment
In the face of an unfamiliar environment, it is imperative to devise an intelligent exploration strategy for the robot.
Initially, the robot's task might be limited to exploring and mapping the world, with the ultimate aim of providing this map to less agile, more energy-consuming robots designed for specific farming tasks.
In this context, a full exploration of the working environment is needed, while keeping the risk of such exploration below an acceptable threshold.
Second, there might be scenarios where the robot needs to explore its surroundings locally while simultaneously executing a working task.
Achieving a delicate equilibrium between exploration and task completion becomes crucial, enabling the robot to execute its work safely and efficiently.

Toward this end, path planning strategies that fully make use of the particular shape of the mustache sensor will be developed.
The unique protuberance of the sensor requires the development of new planning approaches that map the environment while driving on safe ground.


