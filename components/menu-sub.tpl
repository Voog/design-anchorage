{% for item in site.menuitems  %}
  {% if item.selected? and item.children? or editmode %}
    <ul class="submenu">
      {% for subitem in item.visible_children %}
        {% include "menu-level-2-link" %}
      {% endfor %}

      {% if editmode %}
        {% if item.hidden_children.size > 0 %}
          <li>{% menubtn item.hidden_children %}</li>
        {% endif %}
          <li class="last">
            {% if page.layout_title == product_list_layout or page.layout_title == product_layout %}
              {% menuadd parent="item" label=add_product_label lable=add_product_title layout_title="Product" %}
            {% else %}
              {% menuadd parent="item" %}
            {% endif %}
          </li>
      {% endif %}
    </ul>
  {% endif %}
{% endfor %}
