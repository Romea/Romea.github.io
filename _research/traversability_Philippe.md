---
title: "Energy Consumption Analysis for Agricultural robots"
header:
  teaser: assets/images/research/traversability_philippe/robot_300x200.png
---

![Robot in vegetation](/assets/images/research/traversability_philippe/robot.jpg)

We introduce a novel method for safe navigation in unstructured agricultural environments. The research focuses on enhancing the autonomy and resilience of agricultural robots by distinguishing between safely traversable and non-traversable obstacles.
The study was conducted using a teleoperated platform equipped with advanced sensors, including a Hesai Pandar XT-32 LiDAR, a Silios CMS-V VNIR multispectral camera, and an Intel Realsense D415 stereoscopic camera. Data was collected in various environments, such as a park with tall grass, untrimmed trees, and winding paths.


![plot of implements consumptions](/assets/images/research/traversability_philippe/pipeline.png)


Our analysis shows that the robot's ability to navigate safely is significantly enhanced by using multispectral metrics for vegetation detection. By integrating depth and spectral modalities, we created a mass density-augmented map that significantly improves the robot's understanding of its environment. This method allows the robot to evaluate potential paths based on the loss of velocity, ensuring safe and efficient navigation.

Furthermore, the study revealed that using the Normalized Difference Vegetation Index (NDVI) yields the most effective results in terms of detection accuracy and computational efficiency. This approach enables the robot to differentiate between dangerous and safe collisions, adapting to various UGV models and specific vehicle requirements.



{% reference philippe2024collision %}
