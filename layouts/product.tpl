<!DOCTYPE html>
{% unless page.image %}
  {% assign page_image_state = "without-image" %}
{% else %}
  {% assign page_image_state = "with-image" %}

  {% if page.image.width > page.image.height %}
    {% assign page_image_orientation = "image-landscape" %}
  {% elsif page.image.width == page.image.height %}
    {% assign page_image_orientation = "image-square" %}
  {% else %}
    {% assign page_image_orientation = "image-portrait" %}
  {% endif %}

  {% if page.data.image_crop_state %}
    {% assign page_image_crop_state = page.data.image_crop_state %}
  {% else %}
    {% assign page_image_crop_state = "not-cropped" %}
  {% endif %}
{% endunless %}

<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign item_list_page = true %}
    {% include "template-variables" %}
    {% include "html-head" %}
    {% include "template-styles" %}
  </head>

  <body class="item-page{% if site.data.has_header_bg_color %} header-top-with-bg{% endif %}">
    {% include "template-svg-spritesheet" %}

    <div class="site-container">
      {% include "site-header" %}

      <div class="page-body js-bg-picker-area">
        <div class="js-background-type {{ blog_body_bg_type }}">
          <div class="background-image js-background-image"></div>
          <div class="background-color js-background-color"></div>

          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="blog_body_bg" data-bg-picture-boolean="false" data-bg-default-image-color="rgb(255, 255, 255)" data-bg-color="{{ blog_body_bg_color }}" data-bg-color-data="{{ blog_body_bg_color_data_str | escape }}"></button>{% endif %}

          <main class="page-content" role="main">
            <div class="main-inner-row content-full">
              <div class="main-content">
                <div class="wrap">
                  {% include "product-breadcrumbs" %}

                  <div class="items-body" {{ edy_intro_edit_text }}>
                    <div class="content-illustrations">
                      {% if editmode %}
                        <div class="content-item-box {{ page_image_state }} js-content-item-box" data-item-type="page" data-item-id="{{ page.page_id }}">
                          <div class="item-top js-bg-picker-area">
                            <button class="btn bg-picker-btn js-bg-picker-btn" data-bg-key="image" data-bg-picture-boolean="true" data-bg-color-boolean="false" data-bg-image="{{ page.image.for-width-680.url }}" data-bg-target-width="680"></button>

                            <button class="btn bg-crop-btn {% if page_image_orientation == "image-square" or page.image == nil %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
                              <svg width="45" height="45" viewBox="0 0 45 45" xmlns="http://www.w3.org/2000/svg">
                                <use xlink:href="#ico-toggle"></use>
                              </svg>
                            </button>

                            <div class="top-inner aspect-ratio-inner image-drop-area {{ page_image_orientation }} {{ page_image_crop_state }} js-img-drop-area" data-image="{{ page.image.for-width-680.url }}"></div>
                          </div>
                        </div>
                      {% else %}
                        {% if page.image %}
                          <div class="content-item-box {{ page_image_state }} js-content-item-box" href="{{ page.url }}">
                            <div class="item-top">
                              <div class="top-inner aspect-ratio-inner">
                                {% if page.image %}
                                  <div class="loader js-loader"></div>
                                  <img class="item-image {{ page_image_orientation }} {{ page_image_crop_state }} js-lazyload" data-original="{{ page.image.for-width-680.url }}">
                                {% else %}
                                  <div class="item-placeholder">{{ page.title | truncate: 50 }}</div>
                                {% endif %}
                              </div>
                            </div>
                          </div>
                        {% endif %}
                      {% endif %}

                      <div class="content-gallery content-area">{% content name="gallery" %}</div>
                    </div>

                    <div class="content-body">
                      <div class="content-area area-normal" data-search-indexing-allowed="true">{% content %}</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </main>
        </div>
      </div>

      {% include "site-footer" %}
    </div>

    {% include "menu-mobile" %}
    {% include "site-javascripts" %}
    {% include "template-tools" with "item_list_page" %}
    <script>
      site.initItemsPage();
      site.initWindowResize();
    </script>
  </body>
</html>
