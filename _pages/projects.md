---
title: Projects
excerpt: "ORICA, Johann Laconte's research programme on robotics for agroecological field operations at INRAE."
layout: single
permalink: /research/projects/
last_modified_at: 2026-11-12
---

{% for project in site.data.projects %}
## {{ project.name }}

{{ project.programme }} · Led by [{{ project.leader }}](/people/jlaconte/).

{{ project.description }}

The programme studies how robots can work in environments that change with
the seasons, vegetation growth and soil conditions.

[ORICA on the INRAE TSCF website]({{ project.url }})
{% endfor %}

[Research areas and selected studies](/research/)
