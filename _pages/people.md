---
title: People
excerpt: "Meet the researchers working on field robotics, autonomous navigation, mapping and control at R-LEAF, INRAE."
layout: single
permalink: /people/
locale: en
classes: wide
---

{% assign levels = 'prof,engineer,postdoc,phd,master,intern,visitor' | split: ',' %}
{% for level in levels %}
  {% include authors-grid.html %}
{% endfor %}

## Alumni and past visitors

<ul class="alumni-list">
{% for item in site.data.authors %}
  {% assign author = item[1] %}
  {% if author.end %}
  {% assign labels = site.data.messages.locales[page.locale][author.level] %}
  <li>
    {% if author.web %}
      {% assign author_url = author.web %}
      {% unless author.web contains '://' %}{% assign author_url = author.web | relative_url %}{% endunless %}
      <a href="{{ author_url }}">{{ author.name }}</a>
    {% else %}{{ author.name }}{% endif %}
    — {{ labels.singular }}, {{ author.start | date: '%b %Y' }} – {{ author.end | date: '%b %Y' }}
  </li>
  {% endif %}
{% endfor %}
</ul>
