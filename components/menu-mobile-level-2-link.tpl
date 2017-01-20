<li{% if level2.children? and level2.selected? %} class="with-children current-parent"{% elsif level2.children? %} class="with-children"{% elsif level2.selected? %} class="current-parent"{% endif %}>
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
</li>
