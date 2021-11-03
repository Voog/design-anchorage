<div class="content-item-boxes">
  {% if site.root_item.selected? %}
    {% for level_1 in site.visible_menuitems_with_data %}
      {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
        {% include "product-list-item" menu_level: level_1 %}
      {% endif %}
    {% endfor %}
  {% else %}
    {% for i in (1..4) %}
      {% assign level_str = "menuitems_on_level_" | append: i %}
      {% for item in site[level_str] %}
        {% if item.selected? %}
          {% for item_child in item.visible_children_with_data %}
            {% if item.current? %}
              {% if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout %}
                {% include "product-list-item" menu_level: item_child %}
              {% endif %}
            {% endif %}
          {% endfor %}
        {% endif %}
      {% endfor %}
    {% endfor %}
  {% endif %}
</div>
