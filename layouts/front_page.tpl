<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign front_page = true %}
    {% include 'voog-tools-variables' %}
    {% include 'html-head' %}
    {% include 'voog-tools-styles' %}
    {% if editmode %}
      <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
      <style id="preview-style"></style>
    {% endif %}
  </head>

  <body class="front-page">

    <div class="site-container">
      {% include 'site-header' %}

      <main class="page-content" role="main">
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

        <div class="main-inner-row content-full content-left js-content-left">
          <div class="background-image stretch"></div>
          <div class="background-color stretch"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_left_bg_image }}" data-bg-image-sizes="{{ content_left_bg_image_sizes_str | escape }}" data-bg-color="{{ content_left_bg_color }}" data-bg-color-data="{{ content_left_bg_color_data_str | escape }}"></button>{% endif %}

          <div class="main-content">
            <div class="wrap js-background-type {{ content_left_bg_type }}">
              <div class="inner content-area">
                {% content %}
              </div>
            </div>
          </div>

          <div class="main-feature">

            <div class="wrap js-background-type {{ content_left_bg_type }}">
              <div class="feature-left inner inner-left content-area{% if editmode %} narrow-feature{% else %}{% unless feature_left_size contains '-' %} narrow-feature{% endunless %}{% endif %}">
                {% if feature_picture_total_size_num > 0 or editmode %}
                  <div class="feature-picture {% if feature_picture_left_size_num < 0 %}empty{% endif %}">
                    {% if editmode %}
                      <div id="feature-picture-left" class="cover-image editable-cover-image" data-image="{{ page.data.feature_picture_left.url }}" data-dimensions="{{ page.data.feature_picture_left.width }},{{ page.data.feature_picture_left.height }}" data-position="{{ page.data.feature_picture_left.top }},{{ page.data.feature_picture_left.left }}"></div>
                    {% else %}
                      {% if page.data.feature_picture_left.url %}
                        <div class="cover-image" style="background-image: url('{{ page.data.feature_picture_left.url }}'); background-position: {{ fp_left_width_diff_per }}% {{ fp_left_height_diff_per }}%;"></div>
                      {% elsif feature_left_size contains '' %}
                        <div class="cover-image"></div>
                      {% endif %}
                    {% endif %}
                  </div>
                {% endif %}
                {% content name="feature_left" %}
              </div>
              <div class="feature-center inner inner-center content-area{% if editmode %} narrow-feature{% else %}{% unless feature_center_size contains '-' %} narrow-feature{% endunless %}{% endif %}">
                {% if feature_picture_total_size_num > 0 or editmode %}
                  <div class="feature-picture {% if feature_picture_center_size_num < 0 %}empty{% endif %}">
                    {% if editmode %}
                      <div id="feature-picture-center" class="cover-image editable-cover-image" data-image="{{ page.data.feature_picture_center.url }}" data-dimensions="{{ page.data.feature_picture_center.width }},{{ page.data.feature_picture_center.height }}" data-position="{{ page.data.feature_picture_center.top }},{{ page.data.feature_picture_center.left }}"></div>
                    {% else %}
                      {% if page.data.feature_picture_center.url %}
                        <div class="cover-image" style="background-image: url('{{ page.data.feature_picture_center.url }}'); background-position: {{ fp_center_width_diff_per }}% {{ fp_center_height_diff_per }}%;"></div>
                      {% elsif feature_center_size contains '' %}
                        <div class="cover-image"></div>
                      {% endif %}
                    {% endif %}
                  </div>
                {% endif %}
                {% content name="feature_center" %}
              </div>
              <div class="feature-right inner inner-right content-area{% if editmode %} narrow-feature{% else %}{% unless feature_right_size contains '-' %} narrow-feature{% endunless %}{% endif %}">
                {% if feature_picture_total_size_num > 0 or editmode %}
                  <div class="feature-picture {% if feature_picture_right_size_num < 0 %}empty{% endif %}">
                    {% if editmode %}
                      <div id="feature-picture-right" class="cover-image editable-cover-image" data-image="{{ page.data.feature_picture_right.url }}" data-dimensions="{{ page.data.feature_picture_right.width }},{{ page.data.feature_picture_right.height }}" data-position="{{ page.data.feature_picture_right.top }},{{ page.data.feature_picture_right.left }}"></div>
                    {% else %}
                      {% if page.data.feature_picture_right.url %}
                        <div class="cover-image" style="background-image: url('{{ page.data.feature_picture_right.url }}'); background-position: {{ fp_right_width_diff_per }}% {{ fp_right_height_diff_per }}%;"></div>
                      {% elsif feature_right_size contains '' %}
                        <div class="cover-image"></div>
                      {% endif %}
                    {% endif %}
                  </div>
                {% endif %}
                {% content name="feature_right" %}
              </div>
            </div>

          </div>

        </div>

        <div class="blog-feed content-full content-right js-content-right">
          <div class="background-image stretch"></div>
          <div class="background-color stretch"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_right_bg_image }}" data-bg-image-sizes="{{ content_right_bg_image_sizes_str | escape }}" data-bg-color="{{ content_right_bg_color }}" data-bg-color-data="{{ content_right_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="wrap js-background-type {{ content_right_bg_type }}">
            <div class="inner content-area">
              {% content name="bottom" %}
            </div>
          </div>
        </div>

      </main>

      {% include 'site-footer' %}
    </div>

    {% include 'menu-mobile' %}
    {% include 'site-javascripts' %}
    {% include 'voog-tools' with 'front_page' %}
    <script>
      site.initFrontPage();
      site.initWindowResize();
    </script>
  </body>
</html>
