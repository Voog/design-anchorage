{% capture dont_render %}
  {% comment %}Set variables to detect if "feature content areas" have content{% endcomment %}
  {% capture feature_left_html %}{% unless editmode %}{% content name="feature_left" %}{% endunless %}{% endcapture %}
  {% capture feature_left_size %}{{ feature_left_html | size | minus : 1 }}{% endcapture %}
  {% capture feature_center_html %}{% unless editmode %}{% content name="feature_center" %}{% endunless %}{% endcapture %}
  {% capture feature_center_size %}{{ feature_center_html | size | minus : 1 }}{% endcapture %}
  {% capture feature_right_html %}{% unless editmode %}{% content name="feature_right" %}{% endunless %}{% endcapture %}
  {% capture feature_right_size %}{{ feature_right_html | size | minus : 1 }}{% endcapture %}
  {% capture features_total_size %}{{ feature_left_size }} + {{ feature_center_size }} + {{ feature_right_size }}{% endcapture %}

  {% capture feature_picture_left %}{% unless editmode %}{{ page.data.feature_picture_left.url }}{% endunless %}{% endcapture %}
  {% capture feature_picture_left_size %}{{ feature_picture_left | size | minus : 1 }}{% endcapture %}
  {% capture feature_picture_center %}{% unless editmode %}{{ page.data.feature_picture_center.url }}{% endunless %}{% endcapture %}
  {% capture feature_picture_center_size %}{{ feature_picture_center | size | minus : 1 }}{% endcapture %}
  {% capture feature_picture_right %}{% unless editmode %}{{ page.data.feature_picture_right.url }}{% endunless %}{% endcapture %}
  {% capture feature_picture_right_size %}{{ feature_picture_right | size | minus : 1 }}{% endcapture %}

  {% assign feature_picture_left_size_num = feature_picture_left_size | plus: 0 %}
  {% assign feature_picture_center_size_num = feature_picture_center_size | plus: 0 %}
  {% assign feature_picture_right_size_num = feature_picture_right_size | plus: 0 %}

  {% assign feature_picture_total_size_num = feature_picture_left_size_num | plus: feature_picture_center_size_num | plus: feature_picture_right_size_num %}
{% endcapture %}

{% capture dont_render %}
  {% comment %}Feature left picture bg position to percentage{% endcomment %}
  {% if page.data.feature_picture_left.url %}
    {% assign fp_left_width = 375 | plus: 0 %}
    {% assign fp_left_org_width = page.data.feature_picture_left.width | plus: 0 %}
    {% assign fp_left_ar = fp_left_width | times: 100 | divided_by: fp_left_org_width %}
    {% assign fp_left_mod_height = page.data.feature_picture_left.height | times: fp_left_ar | divided_by: 100 %}
    {% assign fp_left_height = 245 | plus: 0 %}
    {% assign fp_left_mod_height_overflow = fp_left_mod_height | minus: fp_left_height %}
    {% assign fp_left_height_pos = page.data.feature_picture_left.top | plus: 0 %}
    {% assign fp_left_height_diff_per = fp_left_height_pos | times: 100 | divided_by: fp_left_mod_height_overflow %}

    {% capture fp_left_height_diff_per_string %}{{ fp_left_height_diff_per }}{% endcapture %}
    {% assign fp_left_height_diff_per_string = fp_left_height_diff_per_string | replace: '-', '' %}
    {% assign fp_left_height_diff_per = fp_left_height_diff_per_string | plus: 0 %}

    {% if fp_left_height_diff_per > 100 %}
      {% assign fp_left_height_diff_per = 100 %}
    {% endif %}

    {% assign fp_left_mod_width = page.data.feature_picture_left.width | times: fp_left_ar | divided_by: 100 %}
    {% assign fp_left_mod_width_overflow = fp_left_mod_width | minus: fp_left_width %}
    {% assign fp_left_width_pos = page.data.feature_picture_left.left | plus: 0 %}
    {% assign fp_left_width_diff_per = fp_left_width_pos | times: 100 | divided_by: fp_left_mod_width_overflow %}

    {% capture fp_left_width_diff_per_string %}{{ fp_left_width_diff_per }}{% endcapture %}
    {% assign fp_left_width_diff_per_string = fp_left_width_diff_per_string | replace: '-', '' %}
    {% assign fp_left_width_diff_per = fp_left_width_diff_per_string | plus: 0 %}

    {% if fp_left_width_diff_per > 100 %}
      {% assign fp_left_width_diff_per = 100 %}
    {% endif %}
  {% endif %}

  {% comment %}Feature right picture bg position to percentage{% endcomment %}
  {% if page.data.feature_picture_center.url %}
    {% assign fp_center_width = 375 | plus: 0 %}
    {% assign fp_center_org_width = page.data.feature_picture_center.width | plus: 0 %}
    {% assign fp_center_ar = fp_center_width | times: 100 | divided_by: fp_center_org_width %}
    {% assign fp_center_mod_height = page.data.feature_picture_center.height | times: fp_center_ar | divided_by: 100 %}
    {% assign fp_center_height = 245 | plus: 0 %}
    {% assign fp_center_mod_height_overflow = fp_center_mod_height | minus: fp_center_height %}
    {% assign fp_center_height_pos = page.data.feature_picture_center.top | plus: 0 %}
    {% assign fp_center_height_diff_per = fp_center_height_pos | times: 100 | divided_by: fp_center_mod_height_overflow %}

    {% capture fp_center_height_diff_per_string %}{{ fp_center_height_diff_per }}{% endcapture %}
    {% assign fp_center_height_diff_per_string = fp_center_height_diff_per_string | replace: '-', '' %}
    {% assign fp_center_height_diff_per = fp_center_height_diff_per_string | plus: 0 %}

    {% if fp_center_height_diff_per > 100 %}
      {% assign fp_center_height_diff_per = 100 %}
    {% endif %}

    {% assign fp_center_mod_width = page.data.feature_picture_center.width | times: fp_center_ar | divided_by: 100 %}
    {% assign fp_center_mod_width_overflow = fp_center_mod_width | minus: fp_center_width %}
    {% assign fp_center_width_pos = page.data.feature_picture_center.left | plus: 0 %}
    {% assign fp_center_width_diff_per = fp_center_width_pos | times: 100 | divided_by: fp_center_mod_width_overflow %}

    {% capture fp_center_width_diff_per_string %}{{ fp_center_width_diff_per }}{% endcapture %}
    {% assign fp_center_width_diff_per_string = fp_center_width_diff_per_string | replace: '-', '' %}
    {% assign fp_center_width_diff_per = fp_center_width_diff_per_string | plus: 0 %}

    {% if fp_center_width_diff_per > 100 %}
      {% assign fp_center_width_diff_per = 100 %}
    {% endif %}
  {% endif %}

  {% comment %}Feature right picture bg position to percentage{% endcomment %}
  {% if page.data.feature_picture_right.url %}
    {% assign fp_right_width = 375 | plus: 0 %}
    {% assign fp_right_org_width = page.data.feature_picture_right.width | plus: 0 %}
    {% assign fp_right_ar = fp_right_width | times: 100 | divided_by: fp_right_org_width %}
    {% assign fp_right_mod_height = page.data.feature_picture_right.height | times: fp_right_ar | divided_by: 100 %}
    {% assign fp_right_height = 245 | plus: 0 %}
    {% assign fp_right_mod_height_overflow = fp_right_mod_height | minus: fp_right_height %}
    {% assign fp_right_height_pos = page.data.feature_picture_right.top | plus: 0 %}
    {% assign fp_right_height_diff_per = fp_right_height_pos | times: 100 | divided_by: fp_right_mod_height_overflow %}

    {% capture fp_right_height_diff_per_string %}{{ fp_right_height_diff_per }}{% endcapture %}
    {% assign fp_right_height_diff_per_string = fp_right_height_diff_per_string | replace: '-', '' %}
    {% assign fp_right_height_diff_per = fp_right_height_diff_per_string | plus: 0 %}

    {% if fp_right_height_diff_per > 100 %}
      {% assign fp_right_height_diff_per = 100 %}
    {% endif %}

    {% assign fp_right_mod_width = page.data.feature_picture_right.width | times: fp_right_ar | divided_by: 100 %}
    {% assign fp_right_mod_width_overflow = fp_right_mod_width | minus: fp_right_width %}
    {% assign fp_right_width_pos = page.data.feature_picture_right.left | plus: 0 %}
    {% assign fp_right_width_diff_per = fp_right_width_pos | times: 100 | divided_by: fp_right_mod_width_overflow %}

    {% capture fp_right_width_diff_per_string %}{{ fp_right_width_diff_per }}{% endcapture %}
    {% assign fp_right_width_diff_per_string = fp_right_width_diff_per_string | replace: '-', '' %}
    {% assign fp_right_width_diff_per = fp_right_width_diff_per_string | plus: 0 %}

    {% if fp_right_width_diff_per > 100 %}
      {% assign fp_right_width_diff_per = 100 %}
    {% endif %}
  {% endif %}
{% endcapture %}
