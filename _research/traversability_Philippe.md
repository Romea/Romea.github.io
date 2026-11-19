---
title: "Traversability Analysis in Natural Environments"
year: 2025
reference: philippe2024collision
author: j_laconte
publication_date: "2025-05"
publication_type: conference
publication_status: published
venue: ICRA
image_alt: Mobile robot driving through a grassy field
excerpt: "Estimating where a robot can drive using geometry and multispectral measurements."
header:
  teaser: /assets/images/publications/traversability.webp
---

![Robot collecting measurements in vegetation](/assets/images/research/traversability_philippe/robot.jpg)

This study examines how geometric and multispectral measurements can help a
robot distinguish vegetation from rigid obstacles. The aim is to assess the
consequences of contact when planning a route through an agricultural environment.

A teleoperated platform collects lidar, depth and multispectral observations.
The method combines these observations in a map augmented with estimates of
vegetation mass density, then evaluates traversal through the predicted loss
of vehicle velocity.

![Pipeline combining geometric and multispectral observations](/assets/images/research/traversability_philippe/pipeline.png)

The evaluation compares vegetation detection metrics, including the Normalized
Difference Vegetation Index (NDVI). It studies how the resulting representation
can inform collision-aware path assessment for different vehicle properties.
The paper describes the sensing pipeline, model and experimental conditions.

{% reference philippe2024collision %}
