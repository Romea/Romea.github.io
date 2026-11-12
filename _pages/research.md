---
title: Resources
excerpt: "Information for students and practical guides to research, scientific writing and figures."
layout: single
permalink: /resources/
---

Information for students joining the laboratory, followed by notes on reading,
writing and presenting research.

<ul class="resource-list">
{% assign paths = 'prospectiveStudents,newStudents,paper,figures,books' | split: ',' %}
{% for path in paths %}
  {% assign resource = site.resources | where: 'slug', path | first %}
  <li>
    <div class="resource-visual" aria-hidden="true">
      {% case path %}
        {% when 'prospectiveStudents' %}<i class="fas fa-user-graduate"></i>
        {% when 'newStudents' %}<i class="fas fa-compass"></i>
        {% when 'paper' %}<i class="far fa-file-lines"></i>
        {% when 'figures' %}<i class="fas fa-chart-line"></i>
        {% when 'books' %}<i class="fas fa-book-open"></i>
      {% endcase %}
    </div>
    <div><h2><a href="{{ resource.url | relative_url }}">{{ resource.title }}</a></h2>
    <p>{{ resource.description }}</p></div>
  </li>
{% endfor %}
</ul>

## Software

The [Romea organisation on GitHub](https://github.com/Romea) hosts the laboratory's
robotics software, including ROS 2 packages for localisation, path following and
robot interfaces. [CropCraft](https://github.com/Romea/cropcraft) provides tools
for generating agricultural environments for robot simulation.
