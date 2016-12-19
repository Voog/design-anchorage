{% capture dont_render %}
  {% for item in site.menuitems_with_hidden %}
    {% if item.selected? %}
      {% if editmode %}
        {% assign sidebar_active = true %}
      {% else %}
        {% assign item_content_children_size = 0 %}

        {% for subitem in item.visible_children %}
          {% unless subitem.layout_title == product_list_layout or subitem.layout_title == product_layout %}
            {% assign item_content_children_size = item_content_children_size | plus: 1 %}
          {% endunless %}

          {% if item_content_children_size == 1 %}
            {% assign sidebar_active = true %}
            {% break %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endfor %}

  {% capture main_html %}{% unless editmode %}{% content %}{% endunless %}{% endcapture %}
  {% capture main_size %}{{ main_html | size | minus : 1 }}{% endcapture %}
  {% unless main_size contains "-" %}
    {% assign main_has_content = true %}
  {% endunless %}

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
