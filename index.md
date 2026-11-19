---
title: "R-LEAF <br> Robotics Laboratory for the Environment and Autonomous Farming"
layout: splash
excerpt: >-
  We study perception, navigation and robot interaction with natural environments,
  with applications in agriculture and environmental surveying.
description: >-
  R-LEAF is an agricultural and field robotics research group at INRAE in Aubière,
  near Clermont-Ferrand, France: perception, mapping, navigation and control of
  robots in natural environments, with information for prospective PhD students and interns.
header:
  overlay_color: "#000"
  overlay_filter: "0.45"
  overlay_image: /assets/images/splash.webp
---

R-LEAF is an agricultural and field robotics research group at [INRAE](https://www.inrae.fr/en), within the
[Technologies and Information Systems for Agroecosystems (TSCF)](https://tscf.clermont.hub.inrae.fr/)
research unit in Aubière, near Clermont-Ferrand, France.

<div class="section-heading">
  <h2 id="recent-publications">Recent publications</h2>
  <a href="{{ '/publications/' | relative_url }}">All publications</a>
</div>

<div class="recent-publications">
{% for publication in site.data.home_publications %}
  {% include publication.html compact=true %}
{% endfor %}
</div>

<aside class="student-links" aria-label="Student information">
  <a class="student-note" href="{{ '/resources/prospectiveStudents/' | relative_url }}">
    <span class="resource-visual" aria-hidden="true"><i class="fas fa-user-graduate"></i></span>
    <span><strong>Join the group</strong><span class="student-note__text">How to contact us about an internship, PhD project or research visit.</span></span>
  </a>
  <a class="student-note" href="{{ '/resources/newStudents/' | relative_url }}">
    <span class="resource-visual" aria-hidden="true"><i class="fas fa-compass"></i></span>
    <span><strong>New students</strong><span class="student-note__text">Tools, reading and practical information for your first weeks here.</span></span>
  </a>
</aside>
