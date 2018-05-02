<aside class="site-sidebar">

  <header class="sidebar-header">
    {% for item in site.menuitems %}
      {% if item.selected? %}
        <h1 class="sidebar-title"><a href="{{ item.url }}">{{ item.title }}</a></h1>
      {% endif %}
    {% endfor %}
  </header>

  {% include "menu-sub" %}
</aside>
