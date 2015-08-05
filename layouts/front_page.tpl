<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign front_page = true %}
    {% include 'template-variables' %}
    {% include 'html-head' %}
    {% include 'template-styles' %}
  </head>

  <body class="front-page">

    <div class="site-container">
      {% include 'site-header' %}

      <main class="page-content" role="main">
        {% include "front-page-variables" %}

        <div class="main-inner-row content-full js-bg-picker-area">
          <div class="background-image js-background-image"></div>
          <div class="background-color js-background-color"></div>

          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="content_bg_1" data-bg-picture-boolean="true" data-bg-image="{{ content_bg_1_image }}" data-bg-image-sizes="{{ content_bg_1_image_sizes_str | escape }}" data-bg-color="{{ content_bg_1_color }}" data-bg-color-data="{{ content_bg_1_color_data_str | escape }}"></button>{% endif %}
          <div class="main-content">
            <div class="wrap js-background-type {{ content_bg_1_type }}">
              <div class="inner content-area">
                {% content %}
              </div>
            </div>
          </div>

          <div class="main-feature">

            <div class="wrap">
              <div class="feature-left inner inner-left content-area{% if editmode %} narrow-feature{% else %}{% unless feature_left_size contains '-' %} narrow-feature{% endunless %}{% endif %}">
                {% if feature_picture_total_size_num > 0 or editmode %}
                  <div class="feature-picture {% if feature_picture_1_size_num < 0 %}empty{% endif %}">
                    {% if editmode %}
                      <div class="cover-image editable-cover-image js-img-dropper-area" data-img-key="feature_picture_1" data-image="{{ page.data.feature_picture_1.url }}" data-dimensions="{{ page.data.feature_picture_1.width }},{{ page.data.feature_picture_1.height }}" data-position="{{ page.data.feature_picture_1.top }},{{ page.data.feature_picture_1.left }}"></div>
                    {% else %}
                      {% if page.data.feature_picture_1.url %}
                        <div class="cover-image" style="background-image: url('{{ page.data.feature_picture_1.url }}'); background-position: {{ fp_left_width_diff_per }}% {{ fp_left_height_diff_per }}%;"></div>
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
                  <div class="feature-picture {% if feature_picture_2_size_num < 0 %}empty{% endif %}">
                    {% if editmode %}
                      <div class="cover-image editable-cover-image js-img-dropper-area" data-img-key="feature_picture_2" data-image="{{ page.data.feature_picture_2.url }}" data-dimensions="{{ page.data.feature_picture_2.width }},{{ page.data.feature_picture_2.height }}" data-position="{{ page.data.feature_picture_2.top }},{{ page.data.feature_picture_2.left }}"></div>
                    {% else %}
                      {% if page.data.feature_picture_2.url %}
                        <div class="cover-image" style="background-image: url('{{ page.data.feature_picture_2.url }}'); background-position: {{ fp_center_width_diff_per }}% {{ fp_center_height_diff_per }}%;"></div>
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
                  <div class="feature-picture {% if feature_picture_3_size_num < 0 %}empty{% endif %}">
                    {% if editmode %}
                      <div class="cover-image editable-cover-image js-img-dropper-area" data-img-key="feature_picture_3" data-image="{{ page.data.feature_picture_3.url }}" data-dimensions="{{ page.data.feature_picture_3.width }},{{ page.data.feature_picture_3.height }}" data-position="{{ page.data.feature_picture_3.top }},{{ page.data.feature_picture_3.left }}"></div>
                    {% else %}
                      {% if page.data.feature_picture_3.url %}
                        <div class="cover-image" style="background-image: url('{{ page.data.feature_picture_3.url }}'); background-position: {{ fp_right_width_diff_per }}% {{ fp_right_height_diff_per }}%;"></div>
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

        <div class="blog-feed content-full js-bg-picker-area">
          <div class="background-image js-background-image"></div>
          <div class="background-color js-background-color"></div>

          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="content_bg_2" data-bg-picture-boolean="true" data-bg-image="{{ content_bg_2_image }}" data-bg-image-sizes="{{ content_bg_2_image_sizes_str | escape }}" data-bg-color="{{ content_bg_2_color }}" data-bg-color-data="{{ content_bg_2_color_data_str | escape }}"></button>{% endif %}
          <div class="wrap js-background-type {{ content_bg_2_type }}">
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
    {% include 'template-tools' with 'front_page' %}
    <script>
      site.initFrontPage();
      site.initWindowResize();
    </script>
  </body>
</html>
