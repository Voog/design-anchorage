<nav class="menu-main visibility-lrg">
  <ul class="menu">
    {% unless site.root_item.hidden? %}
      {% menulink site.root_item wrapper-tag="li" %}
    {% endunless %}

    {% for item in site.visible_menuitems %}
      {% menulink item wrapper-tag="li" %}
    {% endfor %}
  </ul>
  {% if editmode %}
    <ul class="menu">
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li {{ edy_intro_add_page }}>{% menuadd %}</li>
    </ul>
  {% endif %}
</nav>
