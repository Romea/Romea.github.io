---
title: "Feeling the Force: A Nuanced Physics-based Traversability Sensor for Navigation in Unstructured Vegetation"
year: 2025
reference: khizar2025feeling
author: z_khizar
publication_date: "2025-09"
publication_type: conference
publication_status: published
venue: ECMR
image_credit: true
image_alt: Robot fitted with a force sensor moving through tall grass
excerpt: "Measuring the resistance of vegetation with a force sensor mounted on a robot."
header:
  teaser: /assets/images/publications/feeling-the-force.webp
---

![Vegetation in a field environment](/assets/images/research/feeling_the_force/teaser.jpg)

Vegetation can be traversable even when it appears as an obstacle in a geometric
map. This study measures the resistance exerted by plants on a moving robot,
providing information about contact that cameras and lidar do not directly measure.

## Force sensing

A tensioned wire mounted at the front of the robot moves when vegetation pushes
against it. Displacement measurements and a mechanical model are used to estimate
the contact force. The design limits internal friction so that small changes in
resistance remain measurable.

![Force sensor mounted on the robot](/assets/images/research/feeling_the_force/fig2_sensor_mounted.png)

## Field measurements

Experiments with grass and a sapling demonstrate the sensor's response to
vegetation contact. Combining these measurements with the robot trajectory
produces a spatial map of the forces encountered during traversal.

![Measured vegetation resistance along a robot trajectory](/assets/images/research/feeling_the_force/fig6_force_field_map.png)

The measurements can support the evaluation of traversability and future
navigation methods that account for plant resistance. The paper reports the
sensor design, model and experimental evaluation.

{% reference khizar2025feeling %}
