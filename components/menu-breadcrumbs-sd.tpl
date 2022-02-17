{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<ul class="menu menu-item-list">
  {%- for listItem in breadcrumbsObj.itemListElement %}
    {% if forloop.first and forloop.length > 2 %}
      {% continue %}
    {% endif %}
    <span class="menu-separator">/</span>
    <li class="menu-item{% if forloop.last %} current{% endif %}">
      <a class="menu-link" href="/{{listItem.item.id}}">{{ listItem.item.name }}</a>
    </li>
  {% endfor -%}
</ul>
