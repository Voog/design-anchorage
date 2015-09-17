{% capture dont_render %}
  {% assign feature_image_1 = page.data.feature_image_1 %}
  {% capture feature_1_html %}{% unless editmode %}{% content name="feature_1" %}{% endunless %}{% endcapture %}
  {% capture feature_1_size %}{{ feature_1_html | size | minus : 1 }}{% endcapture %}
  {% unless feature_1_size contains "-" %}
    {% assign feature_1_has_content = "true" %}
  {% endunless %}

  {% assign feature_image_2 = page.data.feature_image_2 %}
  {% capture feature_2_html %}{% unless editmode %}{% content name="feature_2" %}{% endunless %}{% endcapture %}
  {% capture feature_2_size %}{{ feature_2_html | size | minus : 1 }}{% endcapture %}
  {% unless feature_2_size contains "-" %}
    {% assign feature_2_has_content = "true" %}
  {% endunless %}

  {% assign feature_image_3 = page.data.feature_image_3 %}
  {% capture feature_3_html %}{% unless editmode %}{% content name="feature_3" %}{% endunless %}{% endcapture %}
  {% capture feature_3_size %}{{ feature_3_html | size | minus : 1 }}{% endcapture %}
  {% unless feature_3_size contains "-" %}
    {% assign feature_3_has_content = "true" %}
  {% endunless %}
{% endcapture %}
