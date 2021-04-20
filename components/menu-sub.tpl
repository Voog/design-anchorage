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
          {%- if item.layout_title == product_list_layout -%}
            {% menuadd parent=item layout_title=product_layout %}
          {%- else -%}
            {% menuadd parent=item %}
          {%- endif -%}
        </li>
      {% endif %}
    </ul>
  {% endif %}
{% endfor %}