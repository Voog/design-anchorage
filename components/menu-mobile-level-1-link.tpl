<li class="menu-item {% if item.children? and item.selected? %} with-children current-parent{% elsif item.children? %} with-children{% elsif item.selected? %} current-parent{% endif %}{% if render_hidden_categories == true and item.layout_title == product_list_layout or item.layout_title == product_layout %}{% unless show_product_related_pages_in_main_menu %} is-hidden{% endunless %} js-menu-item-products{% endif %}">
  {% menulink item %}

  {% if item.children? or editmode %}
    {% if editmode %}
      {% assign sub_menu_toggler = true %}
    {% elsif item.layout_title == product_list_layout %}
      {% assign item_content_children_size = 0 %}

      {% for subitem in item.visible_children %}
        {% unless subitem.layout_title == product_list_layout or subitem.layout_title == product_layout %}
          {% assign item_content_children_size = item_content_children_size | plus: 1 %}
        {% endunless %}

        {% if item_content_children_size == 1 %}
          {% assign sub_menu_toggler = true %}
          {% break %}
        {% endif %}
      {% endfor %}
    {% else %}
      {% if item.visible_children.size > 0 %}
        {% assign sub_menu_toggler = true %}
      {% endif %}
    {% endif %}

    {% if sub_menu_toggler %}
      <button class="toggle-sub-menu js-toggle-sub-menu{% if item.selected? %} active highlighted{% endif %}">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 10" width="8px" height="10px">
          <path d="M0,10V0l8,5L0,10z"></path>
        </svg>
      </button>
    {% endif %}

    {% assign sub_menu_toggler = false %}
  {% endif %}

  {% if editmode or item.children? %}
    <ul class="sub-menu menu-level-2">
      {% for level2 in item.visible_children %}
        {% if item.layout_title == product_list_layout %}
          {% unless level2.layout_title == product_list_layout or level2.layout_title == product_layout %}
            {% include "menu-mobile-level-2-link" %}
          {% endunless %}
        {% else %}
          {% include "menu-mobile-level-2-link" %}
        {% endif %}
      {% endfor %}

      {% if editmode %}
        {% if item.hidden_children.size > 0 %}
          <li class="edit-btn">{% menubtn item.hidden_children %}</li>
        {% endif %}
        <li class="edit-btn">{% menuadd parent="item" %}</li>
      {% endif %}
    </ul>
  {% endif %}
</li>
