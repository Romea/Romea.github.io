---
title: "R-LEAF <br> Robotics Laboratory for the Environment and Autonomous Farming"
layout: splash
excerpt: >-
  We study perception, navigation and robot interaction with natural environments,
  with applications in agriculture and environmental surveying.
header:
  overlay_color: "#000"
  overlay_filter: "0.45"
  overlay_image: /assets/images/splash.webp
---

R-LEAF is a robotics research group at [INRAE](https://www.inrae.fr/en), within the
[Technologies and Information Systems for Agroecosystems (TSCF)](https://tscf.clermont.hub.inrae.fr/)
research unit in Aubière, France.

<div class="section-heading">
  <h2 id="recent-publications">Recent publications</h2>
  <a href="{{ '/publications/' | relative_url }}">All publications <span aria-hidden="true">→</span></a>
</div>

<div class="grid__wrapper recent-publications">
{% for publication in site.data.home_publications %}
  <article class="grid__item archive__item">
    <a class="archive__item-teaser publication-preview{% if publication.photo %} publication-photo{% endif %}" href="{{ publication.url | escape }}" aria-label="{{ publication.title | escape }}">
      <img src="{{ publication.image | relative_url }}" alt="{{ publication.alt | escape }}" width="600" height="400" loading="lazy">
    </a>
    <p class="publication-meta">{% if publication.date %}<time datetime="{{ publication.date | date: '%Y-%m-%d' }}">{{ publication.date | date: '%B %Y' }}</time>{% else %}{{ publication.year }}{% endif %} · {{ publication.status }}</p>
    <h3 class="archive__item-title"><a href="{{ publication.url | escape }}">{{ publication.title }}</a></h3>
    <p class="archive__item-excerpt">{{ publication.description }}</p>
    <p class="publication-credit">{{ publication.byline }}{% if publication.cc_by %} · <a href="https://creativecommons.org/licenses/by/4.0/" rel="license">CC BY 4.0</a>{% endif %}</p>
  </article>
{% endfor %}
</div>

<aside aria-label="New students">
  <a class="student-note" href="{{ '/resources/newStudents/' | relative_url }}">
    <span class="resource-visual" aria-hidden="true"><i class="fas fa-compass"></i></span>
    <span><strong>Information for new students</strong><span class="student-note__text">Research tools, communication and getting started at the laboratory.</span></span>
    <i class="fas fa-arrow-right" aria-hidden="true"></i>
  </a>
</aside>
