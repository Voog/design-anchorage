<ul class="menu menu-item-list">
  {% for level_1 in site.menuitems %}
    {% if level_1.selected? %}
      {% if level_1.children? %}
        {% for level_2 in level_1.children %}
          {% if level_2.selected? %}
            {% menulink level_1 wrapper-tag="li" wrapper-class="menu-item" %}
            <span class="menu-separator">/</span>
            {% menulink level_2 wrapper-tag="li" wrapper-class="menu-item" %}

            {% if level_2.children? %}
              {% for level_3 in level_2.children %}
                 {%if level_3.selected? %}
                    <span class="menu-separator">/</span>
                    {% menulink level_3 wrapper-tag="li" wrapper-class="menu-item" %}
                 {% endif %}
              {% endfor %}
            {% endif %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endfor %}
</ul>
