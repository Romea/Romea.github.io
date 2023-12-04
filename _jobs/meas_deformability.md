---
title: "PhD: Perception and estimation of objects deformability in agricultural tasks"
---
**Start date: As soon as possible**

*Supervised by: Roland Lenain (INRAE), Christophe Debain (INRAE), François Pomerleau (Laval University) and Johann Laconte (INRAE)*

Agricultural robotics is recognized as a cornerstone of the third agricultural revolution, due to its role in facilitating the agroecological transition.
Changes in farming practices, such as moving away from chemical products, demand tedious tasks that are increasingly challenging for a strained labor force. 
The use of autonomous agricultural robots capable of specific, plant-level interventions is a promising alternative. 
While robots are already in use in structured and controlled agricultural environments, challenges remain for their outdoor and unstructured counterparts, due to factors such as varying vegetation types, weather conditions, and dynamic environments.

In this context, adaptive handling of the vegetation becomes essential in the ecological transition of agriculture.
A growing number of agricultural robots are deployed on farms to meet these demands. 
However, unstructured environment inherently contain a variety of obstacles that are challenging to perceive and manipulate.
The deformable nature of crops and other objects that agricultural robots interact with makes it challenging for standard perception methods to comprehend the complexity of these interactions.

![aaa](/assets/images/jobs/meas_deformability/def_obj.jpg)

Given the rising need for autonomous robots, gaining a deeper understanding and creating models for the interaction between robots and their environment is a pivotal area of research.
Deformable objects present a significant challenge in robotics, encompassing perception, control, and estimation.
Nonetheless, objects encountered in unstructured agricultural environments tend to be comparatively rigid and exhibit simpler shapes, offering promising avenues for real-time techniques.

In that context, being able to measure in real-time the deformability of objects is paramount.
Without such techniques, futures research directions would not be able to distinguish between a leaf and a hard obstacle.

This Ph.D. proposal is dedicated to enhancing our understanding of the interaction between robots and their environment, especially in situations where interaction with the environment is necessary for tasks execution.
The core focus of this proposal lies in identifying, sensing, and modeling deformable environments.
Additionally, active perception techniques, such as relocating sensors or physically moving leaves, will be explored towards the end of the Ph.D.

## Thesis Objectives
In the realm of deformable objects, numerous considerations must be addressed before robots can attain true autonomy.
No unified framework for deformable objects is expected for a considerable time, given the diverse nature of objects and tasks within this field.
Nevertheless, in the domain of agricultural robotics, deformability can be categorized into two primary aspects: deformable crops such as leaves and branches, and deformable ground that undergoes inherent changes as high-mass robots traverse it.

Within the first aspect, the concept of deformability is somewhat relative.
Crops exhibit sufficient rigidity to counteract gravity and elevate themselves.
Therefore, an intelligent modeling of their deformability holds the potential for promising real-time perception.
%It is important to note, albeit beyond the scope of this proposal, the ultimate goal of agricultural robotics. While grass and undesirable vegetation merely require measurement to determine if the robot can safely traverse or remove them, crops demand focused attention. Consequently, the modeling must be precise enough to facilitate secure handling.
Moreover, considering the overall objective, active perception plays a vital role. Similar to a human carefully assessing the rigidity of crops by touch and manipulation, the robot must integrate this element within its control loop. This ensures that the risk of crop damage remains under control, and the measurement of deformability, balancing safety and precision, stands at the crux of the challenge.

Recent work focus on analyzing pointclouds over a relatively long time to assess the phenotype and other time-dependent quantities.
However, little work has been conducted to actively sense the deformability for agricultural tasks, such as spraying or cutting.
More precisely, the main research directions are explained below.


### Modeling of longitudinal objects
A first task will be to develop a suitable modeling of deformable objects found in unstructured and agricultural environments.
As stated before, such objects are somewhat rigid, and simple modeling can be enough to capture their behavior under interaction with the robot.

### Probabilistic Estimation of the Deformability
Upon obtaining a model for deformable objects, the next task will leverage range sensors to discern the deformability of these objects.
In this regard, the standard ICP algorithm will be adapted to accommodate point cloud deformation across different time intervals, using the *libpointmatcher* library.
Initial development will use manual manipulation of crops for simplicity, while the main objective is to establish a comprehensive strategy for autonomously sensing crops using a robotic arm and a lidar/TOF sensor.

### Management of occlusions
Ultimately, the final task will involve addressing occlusion actively during the perception of agricultural objects.
Given that crops frequently feature numerous leaves and potential obstructions, it becomes necessary to manipulate the plant for efficient measurement and task execution.
The proposed approach will fix sensors to a robotic arm capable of repositioning itself while measuring the plants.
While the direct act of actively relocating the plant to enhance sensing might exceed the scope of this Ph.D., the exploration of simply altering the viewpoint through movement already presents an interesting avenue of research.


