{% if editmode %}
  {% assign subMenuItem = site.menuitems %}
{% else %}
  {% assign subMenuItem = site.visible_menuitems %}
{% endif %}

{% for item in subMenuItem %}
  {% if item.selected? and item.children? or editmode %}
    <ul class="submenu">
      {% for subitem in item.visible_children %}
        {% include "menu-level-2-link" %}
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
