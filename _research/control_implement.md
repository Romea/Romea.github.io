---
title: "A Novel Control Strategy for Offset Points Tracking in the Context of Agricultural Robotics"
header:
  teaser: assets/images/research/control_implement/teaser_300x200.jpg
---

![robot in field](/assets/images/research/control_implement/full.jpg)

This study examines control laws designed to regulate an offset point on an agricultural implement. An agricultural system consists of a carrier and an attached implement, typically connected via a three-point hitch. The carrier, treated as a robotic system in this context, ensures the movement of the entire setup. During agricultural operations, the implement is responsible for performing the agronomic task, making it essential to ensure that it follows a precise trajectory.

The objective of this study is to develop control laws centered on a specific point of the implement to achieve accurate path tracking. Two primary approaches were explored:

**Lateral Deviation Control of the Carrier:** This method relies on a control law that regulates the movement of the carrier (the robot). A desired lateral offset is applied based on the position of the point being controlled on the implement, ensuring that this point remains on the target trajectory.

**Backstepping Approach:** This technique employs a backstepping control strategy, which enables direct regulation of intermediate variables, particularly angular deviation, according to the position of the controlled point.

The study results emphasize the importance of a control law that prioritizes the implement rather than the carrier. Experiments conducted on the INRAE test field validated both offset point control approaches. While their overall performance is comparable, the backstepping control method demonstrated superior management of intermediate variable convergence.

However, the study also identified transient overshoots during trajectory curvature changes. These overshoots stem from disturbances introduced by curvature variations and are amplified by the considerable lever arm between the controlled point on the implement and the center of the carrier.

Future research will focus on predictive approaches to anticipate these disturbances and minimize transient overshoot amplitudes. This will facilitate the direct control of a point on the implement while ensuring a flexible and adaptable control law for different agricultural implements.

{% reference wembe2025 %}
