<aside class="site-sidebar">

  <div class="sidebar-inner">

    {% for item in site.menuitems_with_hidden %}
      {% if item.selected? %}
          <h1><a href="{{ item.url }}">{{ item.title }}</a></h1>
      {% endif %}
    {% endfor %}

    {% for item in site.menuitems_with_hidden %}
      {% if item.selected? %}
        {% if editmode or item.children? %}
          <ul class="submenu">
            {% for level2 in item.visible_children %}
              <li{% unless level2.translated? %} class="untranslated"{% endunless %}>
                <a href="{{ level2.url }}"{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a>

                {% if level2.selected? %}
                  {% if editmode or level2.children? %}
                    <ul>
                      {% for level3 in level2.visible_children %}
                        <li{% unless level3.translated? %} class="untranslated"{% endunless %}>
                          <a href="{{ level3.url }}"{% if level3.selected? %} class="active"{% endif%}>{{ level3.title }}</a>
                        </li>
                      {% endfor %}

                      {% if editmode %}
                        {% if level2.hidden_children.size > 0 %}
                          <li>{% menubtn level2.hidden_children %}</li>
                        {% endif %}
                        <li>{% menuadd parent="level2" %}</li>
                      {% endif %}

                    </ul>
                  {% endif %}
                {% endif %}

              </li>
            {% endfor %}

            {% if editmode %}
              {% if item.hidden_children.size > 0 %}
                <li>{% menubtn item.hidden_children %}</li>
              {% endif %}
              <li class="last">{% menuadd parent="item" %}</li>
            {% endif %}

          </ul>
        {% endif %}
      {% endif %}
    {% endfor %}

  </div>

</aside>
