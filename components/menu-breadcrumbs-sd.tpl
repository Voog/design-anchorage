{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<ul class="menu menu-item-list">
  {%- for listItem in breadcrumbsObj.itemListElement %}
    {%- assign pageUrl = page.url | remove_first: "/" -%}
    <span class="menu-separator">/</span>
    <li class="menu-item{% if pageUrl == listItem.item.id %} current{% endif %}">
      <a class="menu-link" href="/{{listItem.item.id}}">{{ listItem.item.name }}</a>
    </li>
  {% endfor -%}
</ul>
