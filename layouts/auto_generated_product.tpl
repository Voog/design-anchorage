<!DOCTYPE html>
{%- assign product_page = true -%}
{%- include "template-settings" -%}
{%- include "template-variables" -%}

<html class="{{ view_mode }} {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" sidebar: true %}
    {% include "template-styles" %}
    {% include "common-page-variables" %}

    {% sd_product %}
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

  {%- capture product_social_html -%}
    {%- unless editmode -%}
      {%- xcontent name="product-social" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign product_social_size = product_social_html | strip | size -%}

  <body class="{% if sidebar_active %}common-page sidebar-active{% else %}sidebar-inactive{% endif %} item-page{% if site.data.has_header_bg_color %} header-top-with-bg{% endif %}">
    {% include "template-svg-spritesheet" %}

    <div class="site-container">
      {% include "site-header" %}
      {% include "common-page-variables" %}

      <div class="page-body js-bg-picker-area">
        <div class="js-background-type {{ product_body_bg_type }}">
          {% if editmode %}
            <button class="voog-bg-picker-btn js-background-settings"
              data-bg-key="{{ product_body_bg_key }}"
              data-bg-picture-boolean="false"
              data-bg-default-image-color="rgb(255, 255, 255)"
              data-bg-color="{{ product_body_bg_color }}"
              data-bg-color-data="{{ product_body_bg_color_data_str | escape }}">
            </button>
          {% endif %}
          <div class="background-color js-background-color"{% if product_body_bg_color != blank %} style="background-color: {{ product_body_bg_color }};"{% endif %}></div>

          <div {% if sidebar_active %} class="sidebar-active"{% endif %}>
            {% if sidebar_active %}
              {% include "site-sidebar" %}
            {% endif %}

            <main class="page-content product-content" role="main">
              <div class="main-inner-row content-full">
                <div class="main-content top-row">
                  <div class="wrap">
                    <div class="inner">
                      {% include "menu-breadcrumbs-sd" %}
                      <div class="items-body" {{ edy_intro_edit_text }}>
                        <div class="flex-col">
                          <div class="content-illustrations">

                            {%- if product.photos != blank %}
                              {% assign item_image_state = "with-images" %}
                            {% else %}
                              {% assign item_image_state = "without-images" %}
                            {% endif -%}

                            <div class="content-item-box {{ item_image_state }} js-content-item-box">
                              {%- if product.photos == blank -%}
                                <div class="item-top without-pointer"></div>
                              {%- else -%}
                                {% gallery product layout="product_slider" %}
                              {%- endif -%}
                            </div>

                            {%- if gallery_content_size > 0 or editmode -%}
                              <div class="content-gallery content-area js-product-gallery" data-search-indexing-allowed="true">
                                {%- assign gallery_title = "gallery" | lce -%}
                                {%- assign gallery_title_tooltip = "content_tooltip_additional_images" | lce -%}
                                {% content bind=product name="gallery" title=gallery_title title_tooltip=gallery_title_tooltip %}
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
                              {%- capture original_price -%}
                                {% if product.price_min_with_tax != product.price_max_with_tax -%}
                                  {{- product.price_min_with_tax | money_with_currency: product.currency -}}
                                  <span> – </span>
                                {%- endif -%}
                                {{- product.price_max_with_tax | money_with_currency: product.currency -}}
                              {%- endcapture -%}

                              {% if product.on_sale? -%}
                                <s class="product-price-original">
                                  {{- original_price -}}
                                </s>
                              {% endif -%}

                              <span class="product-price-final">
                                {%- if product.on_sale? -%}
                                  {% if product.effective_price_min_with_tax != product.effective_price_max_with_tax %}
                                    {{- product.effective_price_min_with_tax | money_with_currency: product.currency -}}
                                    <span> – </span>
                                  {%- endif -%}
                                  {{- product.effective_price_max_with_tax | money_with_currency: product.currency -}}
                                {% else %}
                                  {{ original_price }}
                                {% endif -%}
                              </span>
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

                              {%- if editmode or product_social_size > 0 -%}
                                <div class="product-cross-page-info">
                                  {%- assign cross_page_info_title = "cross_page_info" | lce  -%}
                                  {%- assign cross_page_info_title_tooltip = "content_tooltip_all_pages_same_type" | lce -%}
                                  {% xcontent name="product-social" title=cross_page_info_title title_tooltip=cross_page_info_title_tooltip %}
                                </div>
                              {%- endif -%}

                              {%- assign content_title = "content" | lce -%}
                              {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}
                              {% content bind=product title=content_title title_tooltip=content_title_tooltip %}
                            </div>
                          </div>
                        </div>
                      </div>
                      {%- if bottom_content_size > 0 or editmode -%}
                        <section
                          class="content-product-wide content-area"
                          data-search-indexing-allowed="true">
                          {%- assign bottom_content_title = "additional_content" | lce -%}
                          {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
                          {% content bind=product name="content" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}
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
    {% include "template-tools" with "product_page" %}
    <script>
      if (site) {
        site.initItemsPage();
        site.initWindowResize();
        site.handleProductPageContent();
      }
    </script>
  </body>
</html>
