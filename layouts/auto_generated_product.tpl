<!DOCTYPE html>
{% include "template-variables" layout_product: true %}

<html class="{{ view_mode }} {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign item_list_page = true %}
    {% include "template-variables" %}
    {% include "html-head" sidebar: true %}
    {% include "template-styles" %}
    {% include "common-page-variables" %}
  </head>

  {%- capture bottom_content_html %}
    {% unless editmode %}
      {% content bind=product name="content" %}
    {% endunless %}
  {% endcapture %}

  {% assign bottom_content_size = bottom_content_html | strip | size %}

  {% capture gallery_content_html %}
    {% unless editmode %}
      {% content bind=product name="gallery" %}
    {% endunless %}
  {% endcapture %}

  {% assign gallery_content_size = gallery_content_html | strip | size %}

  <body class="{% if sidebar_active %}common-page sidebar-active{% else %}sidebar-inactive{% endif %} item-page{% if site.data.has_header_bg_color %} header-top-with-bg{% endif %}">
    {% include "template-svg-spritesheet" %}

    <div class="site-container">
      {% include "site-header" %}
      {% include "common-page-variables" %}

      <div class="page-body js-bg-picker-area">
        <div class="js-background-type {{ body_bg_type }}">
          <div class="background-color js-background-color"></div>

          <div {% if sidebar_active %} class="sidebar-active"{% endif %}>
            {% if sidebar_active %}
              {% include "site-sidebar" %}
            {% endif %}

            <main class="page-content" role="main">
              <div class="main-inner-row content-full">
                <div class="main-content top-row">
                  <div class="wrap">
                    <div class="inner product-content">
                      {% include "menu-breadcrumbs-sd" %}
                      <div class="items-body" {{ edy_intro_edit_text }}>
                        <div class="flex-col">
                          <div class="content-illustrations">

                            {% if product.image != blank %}
                              {% assign item_image_state = "with-image" %}
                            {% else %}
                              {% assign item_image_state = "without-image" %}
                            {% endif %}

                            <div class="content-item-box {{ item_image_state }} js-content-item-box">
                              <div class="item-top">
                                {%- if product.image != blank -%}
                                  <div class="top-inner aspect-ratio-inner product-page product-image">
                                    {%- assign image_class = "item-image not-cropped" -%}
                                    {% image product.image target_width: "1280" class: image_class loading: "lazy" %}
                                  </div>
                                {%- endif -%}
                              </div>
                            </div>

                            {%- if gallery_content_size > 0 or editmode -%}
                              <div class="content-gallery content-area js-product-gallery" data-search-indexing-allowed="true">
                                {% content bind=product name="gallery" %}
                              </div>
                            {%- endif -%}
                          </div>
                        </div>

                        <div class="flex-col">
                          <div class="content-body-inner js-product-content-right">
                            <div class="content-item-title content-area">
                              <h1>{%- editable product.name -%}</h1>
                            </div>

                            <div class="product-price">
                              {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                                {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                                <span class="product-price-divider">–</span>
                              {%- endif -%}
                              {{ product.price_max_with_tax | money_with_currency: product.currency }}
                            </div>

                            <div class="content-area area-normal" data-search-indexing-allowed="true">
                              {%- if editmode or product.description != blank -%}
                                <div class="content-product-description">
                                  {%- editable product.description -%}
                                </div>
                              {% endif %}

                              <div class="js-buy-btn-content">
                                {% include "buy-button" %}
                              </div>

                              {% content bind=product %}

                            </div>
                          </div>
                        </div>
                      </div>
                      {%- if bottom_content_size > 0 or editmode -%}
                        <section
                          class="content-product-wide content-area"
                          data-search-indexing-allowed="true">
                          {% content bind=product name="content" %}
                        </section>
                      {%- endif -%}
                    </div>
                  </div>
                </div>
              </div>
            </main>
          </div>
        </div>
      </div>
      {% include "site-footer" %}
    </div>

    {% include "menu-mobile" %}
    {% include "site-signout" %}
    {% include "site-javascripts" %}
    {% include "template-tools" with "item_list_page" %}
    <script>
      if (site) {
        site.initItemsPage();
        site.initWindowResize();
        site.handleProductPageContent();

        {%- if product and editmode -%}
          site.handleProductImageClick({{ product.id }});
        {% endif -%}
      }
    </script>
  </body>
</html>
