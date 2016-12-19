<li class="menu-item {% if item.children? and item.selected? %} with-children current-parent{% elsif item.children? %} with-children{% elsif item.selected? %} current-parent{% endif %}{% if render_hidden_categories == true and item.layout_title == product_list_layout %}{% if hide_categories_from_main_menu %} is-hidden{% endif %} js-menu-item-category{% endif %}">
  {% menulink item %}

  {% if item.children? %}
    <button class="toggle-sub-menu js-toggle-sub-menu{% if item.selected? %} active highlighted{% endif %}">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 10" width="8px" height="10px">
        <path d="M0,10V0l8,5L0,10z"></path>
      </svg>
    </button>
  {% endif %}

  {% if editmode or item.children? %}
    <ul class="sub-menu menu-level-2">
      {% for level2 in item.visible_children %}
        <li{% if level2.children? and level2.selected? %} class="with-children current-parent"{% elsif level2.children? %} class="with-children"{% elsif level2.selected? %} class="current-parent"{% endif %}>
          {% unless level2.layout_title == product_layout %}
            {% menulink level2 %}

            {% if level2.children? %}
              <button class="toggle-sub-menu js-toggle-sub-menu{% if level2.selected? %} active highlighted{% endif %}">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 10" width="8px" height="10px">
                  <path d="M0,10V0l8,5L0,10z"></path>
                </svg>
              </button>
            {% endif %}

            {% if editmode or level2.children? %}
              <ul class="sub-menu menu-level-3">
                {% for level3 in level2.visible_children %}
                  <li>{% menulink level3 %}</li>
                {% endfor %}

                {% if editmode %}
                  {% if level2.hidden_children.size > 0 %}
                    <li class="edit-btn">{% menubtn level2.hidden_children %}</li>
                  {% endif %}
                  <li class="edit-btn">{% menuadd parent="level2" %}</li>
                {% endif %}
              </ul>
            {% endif %}
          {% endunless %}
        </li>
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
