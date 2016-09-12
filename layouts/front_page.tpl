<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign front_page = true %}
    {% include "template-variables" %}
    {% include "html-head" %}
    {% include "template-styles" %}
    {% include "front-page-variables" %}
  </head>

  <body class="front-page{% if site.data.has_header_bg_color %} bg-padding{% endif %}">

    <div class="site-container">
      {% include "site-header" %}

      <div class="page-body">
        <main class="page-content" role="main">
          <div class="main-inner-row content-full">
            <div class="content-full-inner js-bg-picker-area">
              <div class="background-image js-background-image"></div>
              <div class="background-color js-background-color"></div>

              {% if editmode %}
                <button class="voog-bg-picker-btn js-background-settings" data-bg-key="content_bg_1" data-bg-default-image-color="rgb(255, 255, 255)" data-bg-picture-boolean="false" data-bg-color-data="{{ content_bg_1_color_data_str | escape }}"></button>
              {% endif %}

              <div class="js-background-type {{ content_bg_1_type }}">
                {% if editmode or main_content_has_content %}
                  <div class="main-content">
                    <div class="wrap">
                      <div class="inner content-area" data-search-indexing-allowed="true">{% content %}</div>
                    </div>
                  </div>
                {% endif %}

                <div class="main-feature">
                  <div class="wrap">
                    {% if editmode or feature_image_1 or feature_1_has_content %}
                      <div class="feature">
                        <div class="feature-image{% if editmode != true and feature_image_1 == nil and feature_image_2 == nil and feature_image_3 == nil %} empty-hidden{% endif %}{% unless editmode or feature_1_has_content or feature_2_has_content or feature_3_has_content %} has-margin{% endunless %}">{% if editmode %}<div class="aspect-ratio-inner js-img-dropper-area" data-img-key="feature_image_1" data-image="{{ feature_image_1 }}"></div>{% elsif feature_image_1 != "" %}<div class="aspect-ratio-inner" style="background-image: url('{{ feature_image_1 }}')"></div>{% endif %}</div>
                        <div class="feature-content content-area" data-search-indexing-allowed="true">{% content name="feature_1" %}</div>
                      </div>
                    {% endif %}

                    {% if editmode or feature_image_2 or feature_2_has_content %}
                      <div class="feature">
                        <div class="feature-image{% if editmode != true and feature_image_1 == nil and feature_image_2 == nil and feature_image_3 == nil %} empty-hidden{% endif %}{% unless editmode or feature_1_has_content or feature_2_has_content or feature_3_has_content %} has-margin{% endunless %}">{% if editmode %}<div class="aspect-ratio-inner js-img-dropper-area" data-img-key="feature_image_2" data-image="{{ feature_image_2 }}"></div>{% elsif feature_image_2 != "" %}<div class="aspect-ratio-inner" style="background-image: url('{{ feature_image_2 }}')"></div>{% endif %}</div>
                        <div class="feature-content content-area" data-search-indexing-allowed="true">{% content name="feature_2" %}</div>
                      </div>
                    {% endif %}

                    {% if editmode or feature_image_3 or feature_3_has_content %}
                      <div class="feature">
                        <div class="feature-image{% if editmode != true and feature_image_1 == nil and feature_image_2 == nil and feature_image_3 == nil %} empty-hidden{% endif %}{% unless editmode or feature_1_has_content or feature_2_has_content or feature_3_has_content %} has-margin{% endunless %}">{% if editmode %}<div class="aspect-ratio-inner js-img-dropper-area" data-img-key="feature_image_3" data-image="{{ feature_image_3 }}"></div>{% elsif feature_image_3 != "" %}<div class="aspect-ratio-inner" style="background-image: url('{{ feature_image_3 }}')"></div>{% endif %}</div>
                        <div class="feature-content content-area" data-search-indexing-allowed="true">{% content name="feature_3" %}</div>
                      </div>
                    {% endif %}
                  </div>
                </div>
              </div>
            </div>
            {% if editmode or bottom_has_content or content_bg_2_image != "" or content_bg_2_color != "" %}
              <div class="front-page-content-bottom content-full js-bg-picker-area">
                <div class="background-image js-background-image"></div>
                <div class="background-color js-background-color"></div>

                {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="content_bg_2" data-bg-picture-boolean="true" data-bg-default-image-color="rgb(142, 156, 169)" data-target-width="600" data-bg-image="{{ content_bg_2_image }}" data-bg-image-sizes="{{ content_bg_2_image_sizes_str | escape }}" data-bg-color="{{ content_bg_2_color }}" data-bg-color-data="{{ content_bg_2_color_data_str | escape }}"></button>{% endif %}
                <div class="wrap js-background-type {{ content_bg_2_type }}">
                  <div class="inner content-area" data-search-indexing-allowed="true">{% content name="bottom" %}</div>
                </div>
              </div>
            {% endif %}
          </div>
        </main>
      </div>
      {% include "site-footer" %}
    </div>

    {% include "menu-mobile" %}
    {% include "site-javascripts" %}
    {% include "template-tools" with "front_page" %}
    <script>
      site.initFrontPage();
      site.initWindowResize();
    </script>
  </body>
</html>
