---
layout: people
title: Mohamed Ounally
excerpt: "Mohamed Ounally is a Ph.D. student at INRAE and Université Clermont Auvergne, studying constrained control and coordination for agricultural robots."
locale: en
permalink: /people/mounally/
author: m_ounally
header:
  og_image: /assets/people/mohamed-ounally.jpg
  og_image_alt: Mohamed Ounally presenting his work
---

Mohamed Ounally is a Ph.D. student at [INRAE](https://www.inrae.fr/en) and
[Université Clermont Auvergne](https://www.uca.fr/), in the R-LEAF team of the
TSCF research unit. He works on control, mapping and robot motion in natural
environments. He graduated top of his class in the Master's programme in
Automatic Control and Robotics at Université Clermont Auvergne in 2026,
specializing in Artificial Perception and Robotics.

## Current research

His [doctoral project](/research/agricultural_robot_control/) concerns the
coordination of an agricultural robot and its tool. The aim is to control the
point where the tool acts on the crop or soil, while respecting the constraints
of the platform and its actuators. Mechanical weeding and localized
interventions are the first applications considered. This work is supervised
by [Johann Laconte](/people/jlaconte/), Roland Lenain, Riccardo Polvara and
Florian Rançon.

His research interests also include mapping and state estimation, with an
emphasis on the measurements and motion models needed for control in the field.

## Previous research

At INRAE in 2025, he developed ROS 2 software for the Unitree B1 quadruped and
studied the influence of slope and heading on energy consumption. This work
led to an [energy prediction model](/research/energy_prediction_slopes/)
evaluated in outdoor experiments.

In 2026, he worked with INRAE and the
[Northern Robotics Laboratory](https://norlab.ulaval.ca/) at Université Laval on
the MTT-154, an articulated tracked vehicle. He developed its ROS 2 control and
measurement software, integrated lidar- and GNSS-based mapping and
teach-and-repeat navigation, and carried out field trials. He also worked on
calibration, trajectory reconstruction and motion modelling, including the
implementation and evaluation of a model accounting for the extent of track
contact with the ground. The resulting studies on
[contact-aware motion prediction](https://arxiv.org/abs/2609.23271) and
[inertial steering](https://arxiv.org/abs/2610.38888) are available as preprints.

## Teaching

He teaches at Université Clermont Auvergne, ISIMA and IUT Clermont Auvergne,
in subjects related to robotics, control and programming.

## Publications

{% bibliography --query @*[author ~= Ounally] %}
