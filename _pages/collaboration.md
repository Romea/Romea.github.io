---
title: 
layout: collection
permalink: /collaborations/
---

<link rel="stylesheet" href="/assets/css/collaborations.css">
{% assign items = site.collaborations  | sort: 'title'%}
<h1>International Collaborations</h1>
  {% for item in items %}
  {% if item.type == 'international' %}
   <div class="wide-image">
      <a href="{{ item.url }}">
          <img src="{{ item.header.teaser }}" alt="{{ item.title }}">
          <div class="overlay-text">
            <h3>{{ item.title }}</h3>
          </div>
      </a>
    </div>
  {% endif %}
  {% endfor %}

<br>
{% assign grounds_items = site.equipment  | sort: 'title'%}
<h1>National Collaborations</h1>
  {% for item in items %}
  {% if item.type == 'national' %}
   <div class="wide-image">
      <a href="{{ item.url }}">
          <img src="{{ item.header.teaser }}" alt="{{ item.title }}">
          <div class="overlay-text">
            <h3>{{ item.title }}</h3>
          </div>
      </a>
    </div>
  {% endif %}
  {% endfor %}

