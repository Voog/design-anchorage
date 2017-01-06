{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <ul class="submenu">
      {% for subitem in item.visible_children %}
        {% if sidebar_active %}
          {% include "menu-level-2-link" %}
        {% elsif item.layout_title == product_list_layout %}
          {% unless subitem.layout_title == product_list_layout or subitem.layout_title == product_layout %}
            {% include "menu-level-2-link" %}
          {% endunless %}
        {% else %}
          {% include "menu-level-2-link" %}
        {% endif %}
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
