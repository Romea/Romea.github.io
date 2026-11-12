---
title: "R-LEAF <br> Robotics Laboratory for the Environment and Autonomous Farming"
layout: splash
excerpt: >-
  We develop autonomous robots for agriculture and environmental surveying,
  with research in navigation, mapping, control and interaction with natural environments.
header:
  overlay_color: "#000"
  overlay_filter: "0.45"
  overlay_image: /assets/images/splash.webp
featured:
  - wembe2026
  - khizar2025feeling
  - ardannaoui_2025_icp_analysis
---

We are part of [INRAE](https://www.inrae.fr/en), the French National Research
Institute for Agriculture, Food and the Environment, within the
[Technologies and Information Systems for Agroecosystems (TSCF)](https://tscf.clermont.hub.inrae.fr/)
research unit in Aubière, France.

## Research

Our research covers mapping and state estimation, interaction with soil and
vegetation, robot and implement control, and energy use in field operations.
We combine modelling, software development and experiments on real robots.

Work within TSCF connects these topics through research programmes, joint
laboratories with industry and international collaborations.
The [projects and collaborations](/research/projects/) page presents this wider context.

<div class="grid__wrapper">
{% for key in page.featured %}
  {% assign post = site.research | where: 'reference', key | first %}
  {% include archive-single.html type='grid' %}
{% endfor %}
</div>

[Research areas and studies](/research/) · [Publications](/publications/)

## Resources

Information for [prospective students](/resources/prospectiveStudents/),
a [guide for new students](/resources/newStudents/) and
[practical notes on research and writing](/resources/).
