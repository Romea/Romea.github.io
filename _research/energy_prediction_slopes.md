---
title: "Energy Prediction on Sloping Ground for Quadruped Robots"
excerpt: "A field study of how terrain slope and heading affect quadruped energy consumption, with a sensor-based model, paper and BibTeX."
year: 2025
reference: ounally2025energy
paper:
  authors: [Mohamed Ounally, Cyrille Pierre, Johann Laconte]
  year: 2025
  conference: "3D-Advice: Advanced 3D Vision for Complex Environments Workshop"
  pdf: /assets/papers/energy_prediction_slopes_2025.pdf
  abstract: >-
    Energy management is a fundamental challenge for legged robots in outdoor
    environments. Endurance directly constrains mission success, while efficient
    resource use reduces ecological impact. This paper investigates how terrain
    slope and heading orientation influence the energetic cost of quadruped
    locomotion. We introduce a simple energy model that relies solely on standard
    onboard sensors, avoiding specialized instrumentation and is applicable in
    previously unexplored environments. The model is identified from field runs
    on a commercial quadruped and expressed as a compact function of slope angle
    and heading. Validation on natural terrain demonstrates near-linear
    power–slope relationships, elevated costs for lateral motion, and additive
    behavior across trajectory segments, enabling efficient path-level energy
    prediction.
header:
  teaser: /assets/images/cards/energy_prediction_slopes.webp
---

<img src="/assets/images/research/energy_slopes/robot_scenario.jpg" alt="robot on slopes" style="width:100%;">

**Authors:** [Mohamed Ounally](/people/mounally/), Cyrille Pierre and [Johann Laconte](/people/jlaconte/).

**Publication:** 3D-Advice: Advanced 3D Vision for Complex Environments Workshop, 2025.

## Abstract

{{ page.paper.abstract }}

### Methodology and Setup

We used a Unitree B1 quadruped with standard sensors (battery monitor, IMU, odometry) on outdoor slopes ranging from 5° to 20°. The robot traveled at constant speed (0.3 m/s) along straight segments to minimize confounding effects.
<div style="text-align: center">
  <img src="/assets/images/research/energy_slopes/coordinate_system_new.jpg" alt="coordinate system" style="width:50%;">
</div>

The coordinate system establishes α as the slope angle and γ as the robot's heading relative to the slope direction. Energy is modeled as the integral of instantaneous power over the trajectory.

### Key Results

#### Energy Superposition Validation
The model treats energy as additive across path segments, validated through composite path experiments.
<div style="text-align: center">
  <img src="/assets/images/research/energy_slopes/superposition_new.jpg" alt="energy superposition" style="width:50%;">
</div>

#### Power-Slope Relationships
Field experiments reveal clear linear trends with opposite behaviors for uphill versus downhill motion.
<div style="text-align: center">
  <img src="/assets/images/research/energy_slopes/power_slope_filtered_new.jpg" alt="power vs slope" style="width:100%;">
</div>

Measured power as a function of slope angle shows: power increases linearly when climbing, decreases moderately when descending, and lateral motion consistently requires more energy than forward motion.

### Key Findings

- **Linear power-slope relationships** with directional asymmetry
- **Energy additivity** across segments (4-13% accuracy)  
- **Sensor-only approach** using standard onboard systems
- **Directional anisotropy** favoring forward over lateral motion

### Applications

This energy model enables energy-aware path planning for agricultural robots, mission duration prediction, and optimization strategies that exploit directional energy asymmetries.

**Read and cite:** [Workshop paper (PDF)](/assets/papers/energy_prediction_slopes_2025.pdf) · [BibTeX](/assets/papers/energy_slopes_citation.bib) · [arXiv preprint (2026)](https://arxiv.org/abs/2603.11963)

{% reference ounally2025energy %}

[All publications](/publications/) · [More research](/research/)
