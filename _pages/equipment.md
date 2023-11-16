---
title: 
layout: collection
permalink: /equipment/
---

<link rel="stylesheet" href="/assets/css/equipment.css">
{% assign robots_items = site.equipment %}
<h2>Robotic platforms</h2>
  {% for item in robots_items %}
  {% if item.type == 'robot' %}
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

{% assign grounds_items = site.equipment %}
<h2>Experimental grounds</h2>
  {% for item in grounds_items %}
  {% if item.type == 'ground' %}
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

