---
title: Research
excerpt: >-
  We study perception, navigation and robot interaction with natural environments,
  with applications in agriculture and environmental surveying.
layout: single
permalink: /research/
classes: wide
header:
  overlay_color: "#000"
  overlay_filter: "0.45"
  overlay_image: /assets/images/splash.webp
---

<div class="research-areas">
{% for area in site.data.research_areas %}
  <section class="research-area">
    <img src="{{ area.image | relative_url }}" alt="{{ area.alt | escape }}" width="800" height="450" loading="lazy">
    <div><h2>{{ area.title }}</h2><p>{{ area.description }}</p></div>
  </section>
{% endfor %}
</div>

<div class="section-heading">
  <h2 id="publications">Publications</h2>
  <a href="{{ '/publications/' | relative_url }}">Full bibliography</a>
</div>

<div class="publication-list">
{% for publication in site.data.publications %}
  {% include publication.html %}
{% endfor %}
</div>

## Work with us

For internships, PhD projects or a research visit, see the
[prospective student guide](/resources/prospectiveStudents/) or
[contact Johann Laconte](/contact/).
