---
title: 
layout: single
permalink: /people/
locale: en
---


<!-- Sections start here -->
{% assign level = 'prof' %}
{% include  authors-grid.html %}

{% assign level = 'engineer' %}
{% include  authors-grid.html %}

{% assign level = 'postdoc' %}
{% include  authors-grid.html %}

{% assign level = 'phd' %}
{% include  authors-grid.html %}

{% assign level = 'master' %}
{% include  authors-grid.html %}

{% assign level = 'intern' %}
{% include  authors-grid.html %}

{% assign level = 'visitor' %}
{% include  authors-grid.html %}

<h1> Alumni and Past Visitors </h1>

{% for item in site.data.authors %}
	{% assign author = item[1] %}
	{% if author.end %}
		{% assign dateStart = author.start | date: '%s' %}
		{% assign dateEnd = author.end | date: '%s' %}
		{% assign dateDiffSec = dateEnd | minus: dateStart%}
		{% assign dateDiffYears = dateDiffSec | divided_by: 3600.0 | divided_by: 24.0 | divided_by: 365.0 | round: 2%}
		{% assign dateDiffMonth = dateDiffSec | divided_by: 3600.0 | divided_by: 24.0 | divided_by: 30.0 | round: 2%}
		{% assign dateDiffWeek = dateDiffSec | divided_by: 3600.0 | divided_by: 24.0 | divided_by: 7.0 | round: 2%}
		{% if dateDiffYears > 1 %}
			{% capture duration%} {{dateDiffYears | round: 1 }} years {% endcapture%}
		{% elsif dateDiffMonth > 1 %}
			{% capture duration%} {{dateDiffMonth | round }} months {% endcapture%}
		{% else %}
			{% capture duration%} {{dateDiffWeek | round: 1 }} weeks {% endcapture%}
		{% endif %}
<li>
{%if author.web %}
	{%if author.web[page.locale] contains "http" %}
		<a href="{{ author.web[page.locale] }}" title="{{author.name}}" target="_blank">
	{%else%}
		<a href="{{ site.url }}{{ author.web[page.locale] }}" title="{{author.name}}">
	{%endif%}
{%endif%}

{% assign locale = site.data.messages.locales[page.locale]%}
{% assign level = author.level%}
<h4 style="display: inline;"> {{author.name}}: </h4> {{locale[level].singular}} ({{author.end | date: '%Y'}}), {{duration}}
{% if author.info %}
- {{author.info[page.locale]}}
{% endif %}

{%if author.web %}
</a>
{%endif%}
</li>
	{% endif %}
{% endfor %}

