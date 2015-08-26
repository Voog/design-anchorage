{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <ul class="submenu">
      {% for subitem in item.visible_children %}
        <li>
          {% menulink subitem %}
          {% if subitem.selected? and subitem.children? or editmode %}
            <ul class="submenu-lvl2">
              {% for level_3 in subitem.visible_children %}
                {% menulink level_3 wrapper-tag="li" %}
              {% endfor %}

              {% if editmode %}
                {% if subitem.hidden_children.size > 0 %}
                  <li>{% menubtn subitem.hidden_children %}</li>
                {% endif %}
                <li class="last">{% menuadd parent="subitem" %}</li>
              {% endif %}
            </ul>
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
{% endfor %}
