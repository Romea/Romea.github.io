---
title: Resources
excerpt: "Information for students and practical guides to research, scientific writing and figures."
layout: single
permalink: /resources/
---

Practical notes we share with students and colleagues.

{% for category in site.data.resource_categories %}
<h2 id="{{ category.id }}">{{ category.title }}</h2>
<ul class="resource-list">
{% assign resources = site.resources | where: 'resource_category', category.id | sort: 'order' %}
{% for resource in resources %}
  <li>
    <div class="resource-visual" aria-hidden="true"><i class="{{ resource.icon }}"></i></div>
    <div><h3><a href="{{ resource.url | relative_url }}">{{ resource.title }}</a></h3>
    <p>{{ resource.description }}</p></div>
  </li>
{% endfor %}
</ul>
{% endfor %}
