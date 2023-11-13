---
permalink: /contact/
title: "Contact Us"
---
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      margin: 0;
      padding: 0;
    }

    header {
      text-align: center;
      padding: 10px;
    }

    .contact-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 20px;
    }

    .address {
      flex: 1;
      margin: 10px;
      padding: 15px;
    }

    .map {
      max-width: 600px;
      margin: 10px;
    }

    .contacts {
      flex: 1;
      margin: 10px;
      padding: 15px;
    }

    footer {
      text-align: center;
      padding: 10px;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
  </style>
</head>
<body>

<div class="contact-container">
  <div class="address">
    <h2>In person</h2>
    <p>INRAE Clermont Ferrand <br> site des Cézeaux</p>
    <p>9 Av. Blaise Pascal<br>63170 Aubière<br>France</p>
  </div>

  <div class="contacts">
    <h2>By email</h2>
    <ul>
      <li>Person 1: <a href="mailto:info@example.com">info@example.com</a></li>
      <li>Person 2: <a href="mailto:info@example.com">info@example.com</a></li>
    </ul>
  </div>
</div>

  <div class="map">
    <!-- Replace the following iframe source with your Google Maps embed code -->
    <iframe width="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=9%20Av.%20Blaise%20Pascal,%2063170%20Aubi%C3%A8re+(INRAE%20-%20Clermont%20Ferrand%20site%20des%20C%C3%A9zeaux)&amp;t=&amp;z=6&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe>
  </div>
</body>
</html>

