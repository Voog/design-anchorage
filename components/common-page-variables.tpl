{% capture dont_render %}
  {% for item in site.menuitems_with_hidden %}
    {% if item.selected? %}
      {% if editmode or item.children? %}
        {% assign sidebar_active = true %}
      {% endif %}
    {% endif %}
  {% endfor %}

  {% capture left_html %}{% unless editmode %}{% content name="left" %}{% endunless %}{% endcapture %}
  {% capture left_size %}{{ left_html | size | minus : 1 }}{% endcapture %}
  {% unless left_size contains "-" %}
    {% assign left_has_content = true %}
  {% endunless %}

  {% capture right_html %}{% unless editmode %}{% content name="right" %}{% endunless %}{% endcapture %}
  {% capture right_size %}{{ right_html | size | minus : 1 }}{% endcapture %}
  {% unless right_size contains "-" %}
    {% assign right_has_content = true %}
  {% endunless %}
{% endcapture %}
