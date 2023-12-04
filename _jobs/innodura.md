---
title: "PhD: Sensors fusion for safe autonomous navigation in agricultural environments"
---
**Start date: As soon as possible**

*Supervised by: Roland Lenain (INRAE), Marc-Antoine Malinge (Innodura), Jean Laneurit (INRAE), Maxime Robin (Innodura) and Johann Laconte (INRAE)*


The deployment of agricultural robots is hindered by a major constraint: current safety sensors are limited to measuring distances and focus solely on the geometry of the environment.
This leads to frequent unexpected stops of the machines, requiring human intervention to restart them.
The issue arises because existing solutions are mainly designed for structured environments where obstacles are uniform, and the ground is relatively flat.
However, in the agricultural sector, environments are often unstructured, with a wide variety of crops.
Therefore, current safety systems are not suitable for these specific conditions.
The need to develop new safety systems that take into account the overall agricultural environment is driven by the desire to avoid unplanned stops of agricultural machinery.
To achieve this, it is essential to develop obstacle detection and recognition techniques, as well as methods for assessing traversability.

![traversability toy example](/assets/images/jobs/innodura/traversability.jpg)

## Thesis Objectives
The main goal of this thesis is to design advanced algorithms for scene recognition and interpretation using various perception means.
The ultimate objective is to enable precise detection of humans, animals, and obstacles such as tall grass, solid obstacles, and branches, while differentiating between traversable and non-traversable areas through artificial intelligence.
This is done to adapt the robot's behavior to the evolving context and secure the movement of people.
The proposed thesis aims to construct a real-time semantic 3D map, allowing the identification or at least categorization of scene elements based on their traversability by the robot.

The work involves utilizing different types of sensors (Lidar and camera) within the Agrivia Labcom on INRAE's robotic platforms in agricultural work scenarios.
This aims to obtain a 3D representation of the environment and associate it with metrics providing information on the conditions for the robot to navigate within this area (maximum speed, control mode, tool position, etc.).

The research will initially focus on reconstructing the environment and its segmentation (clustering) to identify different scene elements through the fusion of 3D (Lidar) and visual (RGB camera or hyperspectral) sensors.
This segmentation can be based on various criteria (geometry, texture, color, etc.).

Following this, a phase of recognition and identification of these elements will be based on information.
Machine learning techniques will be employed to identify these different elements and determine a traversability map.
This map aims to determine, for each zone on the robot's probable trajectory, useful information for its control, typically the permissible forward speed in that area, based on its geometry, nature, and the robot's capabilities.


