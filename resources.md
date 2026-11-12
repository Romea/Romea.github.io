---
title: Research
excerpt: "R-LEAF research on perception, mapping, autonomous navigation and robot interaction with natural environments."
layout: research
permalink: /research/
collection: research
entries_layout: grid
classes: wide
---

Our research concerns robots working in natural and agricultural environments.
We combine mathematical models, perception and control with field experiments.

## Research areas

<div class="grid__wrapper research-areas">
{% for area in site.data.research_areas %}
  <section class="grid__item">
    <img src="{{ area.image | relative_url }}" alt="{{ area.alt | escape }}" width="800" height="450" loading="lazy">
    <h3>{{ area.title }}</h3>
    <p>{{ area.description }}</p>
  </section>
{% endfor %}
</div>

## Projects

[ORICA](/research/projects/) is the research programme led by Johann Laconte
at INRAE. It brings together work on perception, navigation and interaction
with deformable natural environments.
