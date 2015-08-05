<nav class="menu-main visibility-lrg">
  <ul class="menu">
    {% unless site.root_item.hidden? %}
{% comment %}      <li {% if site.root_item.selected? %} class="is-active"{% endif %}>
        <a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a>
      </li>{% endcomment %}
      {% menulink site.root_item wrapper-tag="li" %}
    {% endunless %}

    {% for item in site.visible_menuitems %}
{% comment %}      <li{% if item.selected? %} class="is-active"{% endif %}{% unless item.translated? %} class="is-untranslated fci-editor-menuadd"{% endunless %}>
        {% menulink item %}
      </li>{% endcomment %}
      {% menulink item wrapper-tag="li" %}
    {% endfor %}

    {% if editmode %}
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li>{% menuadd %}</li>
    {% endif %}
  </ul>
</nav>
