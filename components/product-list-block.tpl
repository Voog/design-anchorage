<div class="content-item-boxes">
  {% for item in page.menuitem.visible_children_with_data %}
      {% if item.layout_title == product_list_layout or item.layout_title == product_layout %}
        {% include "product-list-item" menu_level: item %}
      {% endif %}
    {% endfor %}
</div>
