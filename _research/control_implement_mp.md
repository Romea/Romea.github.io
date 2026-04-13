---
title: "A Predictive Control Strategy to Offset-Point Tracking for Agricultural Mobile Robots"
header:
  teaser: assets/images/research/control_implement_mpc/teaser_300x200.jpg
---

![robot in field](/assets/images/research/control_implement_mpc/full.jpg)

This work extends previous results on the control of an offset point attached to an agricultural implement
(see https://rleaf.mathnum.inrae.fr/research/control_implement/
), where significant tracking errors were observed, particularly during transient phases. These errors are critical in agricultural applications, as they may directly lead to unintended interactions with crops.

A central result of this paper is to formalize a structural limitation of the problem: for rigidly attached implements, exact tracking of a reference trajectory is generally not achievable. The same path cannot be followed identically for different implement configurations due to geometric constraints and lever-arm effects. Consequently, the objective is not to eliminate tracking errors, but to reduce them as effectively as possible.
The analysis highlights a characteristic convergence behavior of the system. In particular, when the control point is located at the rear of the robot, the implement initially deviates away from the reference path before converging. This behavior arises from the system kinematics and must be taken into account in the controller design.

![convergence of the implement](/assets/images/research/control_implement_mpc/convergence.png)

To address this, a predictive control strategy is proposed. The method relies on anticipating the evolution of the tracking error over a finite horizon and selecting the control input that minimizes this error with respect to a desired convergence profile. Unlike standard model predictive control approaches, the formulation admits a closed-form solution, which avoids the use of numerical solvers and improves computational reliability.

The approach is evaluated in both simulation and real-world experiments with multiple implement configurations. The results show a reduction of median tracking errors between 24% and 56%, as well as a decrease in peak errors during curvature transitions of up to 70% . These improvements are particularly relevant during transient phases, where the largest deviations typically occur.

Furthermore, the experiments show that tracking performance is strongly influenced by the position of the implement. In particular, rear-mounted configurations exhibit larger errors due to the combined effects of the lever arm and the infeasibility of certain reference trajectories. In contrast, front-mounted configurations benefit from a form of anticipatory behavior induced by their geometry.

The proposed method provides a practical approach to reducing tracking errors in scenarios where exact tracking is not achievable, thereby improving the reliability of agricultural operations involving rigidly attached implements.

{% reference wembe2026 %}
