---
title: Research
excerpt: "Explore R-LEAF research on navigation, mapping, control, traversability and energy consumption in natural environments."
layout: research
permalink: /research/
collection: research
entries_layout: grid
classes: wide
---

We study how robots perceive, move through and interact with natural environments.
Agricultural work connects these questions: the ground changes under the robot,
vegetation bends on contact, and a tool must act precisely while the platform moves.

## Research areas

<div class="research-areas" markdown="1">

<section markdown="1">
### Mapping and state estimation

Maintaining useful maps as vegetation and scenes change, and understanding
when localization becomes unreliable. Our work includes
[ICP registration in evolving environments](/research/icp_analysis_evolvingEnv/).
</section>

<section markdown="1">
### Interaction with soil and vegetation

Estimating how the environment responds to contact, from soil deformation to
the resistance of plants. We study [vegetation traversability](/research/Feeling_the_Force/)
and manipulation in deformable natural environments.
</section>

<section markdown="1">
### Control and robot mobility

Coordinating the motion of mobile platforms and agricultural tools under
kinematic and actuation constraints. This includes
[implement tracking](/research/control_implement_mp/), tracked vehicle models
and [current work on robot–tool coordination](/research/agricultural_robot_control/).
</section>

<section markdown="1">
### Energy and field operations

Measuring and predicting the resources required for a task, with attention to
the terrain, tools and motion of the robot. Studies cover
[agricultural vehicles](/research/energy/) and
[quadrupeds on sloping ground](/research/energy_prediction_slopes/).
</section>

</div>

## Projects and collaborations

These research areas are developed through ORICA and collective projects within
TSCF, including NINSAR, MUSCAA and STAIRS. Joint laboratories with industry,
the CIR ITPS and international partners connect the work to agricultural
operations, experimental testing and doctoral training.

[Explore the projects, partners and programmes](/research/projects/).

## Doctoral research

{% assign members = site.data.authors | sort %}
<ul class="doctoral-research">
{% for item in members %}
  {% assign member = item[1] %}
  {% if member.level == 'phd' and member.end == nil %}
  <li>{% if member.web %}<a href="{{ member.web | relative_url }}">{{ member.name }}</a>{% else %}{{ member.name }}{% endif %} — {{ member.topics }}.</li>
  {% endif %}
{% endfor %}
</ul>

The studies below present individual results. The [publications page](/publications/)
provides the full references and links to the papers.
