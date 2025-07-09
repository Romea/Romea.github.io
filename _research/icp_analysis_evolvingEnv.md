---
title: "When and Where Localization Fails: An Analysis of the Iterative Closest Point in Evolving Environment"
header:
  teaser: assets/images/research/icp_analysis/header.png
---

<img src="/assets/images/research/icp_analysis/header.png" alt="evolving environment" style="width:100%;">

This study explores a key challenge in autonomous robotics: how short-term environmental changes affect LiDAR-based relocalization. While long-term mapping has been well studied, weekly variations, such as vegetation growth or parked vehicles, can also disrupt localization, yet remain underexplored. To address this, we introduce a new dataset and evaluation framework to systematically analyze the robustness of ICP-based methods.

### Dataset and Methodology
Data was collected weekly from February to April 2025 in two contrasting environments: a forest trail and a semi-urban campus (680 m and 850 m). Each track was traversed bidirectionally, resulting a fully aligned map, 360° panoramical images, and GNSS and IMU poses for centimeter-level accuracy.
 
Two ICP variants. Point-to-Point (PtP) and Point-to-Plane (PtPlane), were tested using simulated LiDAR scans perturbed with translation (0.1 m), rotation (5°), and Gaussian noise (σ = 0.1 m). Each scan was registered 30 times from randomized initializations to reflect real-world variability.

### Key Findings
PtPlane consistently outperformed PtP, showing lower translation (0.1–0.2 m) and rotation errors (<1°) as presented in the following image. The use of surface normals helped PtPlane remain robust in ambiguous or sparse scenes. In contrast, PtP failed more often in dense vegetation corridors, flat terrain, or when dynamic objects disrupted local geometry.

<div>
<img src="/assets/images/research/icp_analysis/trans_error_labeled.png" alt="translation error" style="width:100%; display:block; margin:0; padding:0; border:0;">
<img src="/assets/images/research/icp_analysis/rot_error_labeled.png" alt="rotational error" style="width:100%; display:block; margin:0; padding:0; border:0;">
</div>
<br>

Natural environments showed greater change (median up to 1.81%, max 8.68%), especially when transient objects were present. Semi-urban areas were more stable, though parked vehicles still introduced significant deviations.

### Conclusion and Future Work
The study shows that short-term changes significantly impact localization accuracy and that PtPlane ICP offers better resilience. The proposed dataset and methodology provide a foundation for future work on predicting failure zones, improving robustness with segmentation, and adapting to evolving environments, key needs for autonomous systems in forestry, agriculture, and urban settings.


{% reference ardannaoui_2025_icp_analysis %}
