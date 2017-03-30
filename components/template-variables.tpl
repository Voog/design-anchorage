{% capture dont_render %}
  {% comment %}Detects viewing mode.{% endcomment %}
  {% if editmode %}
    {% assign view_mode = "editmode" %}
  {% else %}
    {% assign view_mode = "publicmode" %}
  {% endif %}

  {% comment %}ASSIGN LANGUAGE MENU FLAGS STATE{% endcomment %}
  {% comment %}TODO: Remove when deprecated.{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {% comment %}Detects language flags visibility setting.{% endcomment %}
  {% if site.data.settings_language_menu.item_state %}
    {% if site.data.settings_language_menu.item_state == "names_only" %}
      {% assign language_flags_mode = "language-flags-disabled" %}
    {% else %}
      {% assign language_flags_mode = "language-flags-enabled" %}
    {% endif %}
  {% else %}
    {% comment %}Fallback for older flags toggle button.{% endcomment %}
    {% if site.data.language_flags_enabled == true %}
      {% assign language_flags_mode = "language-flags-enabled" %}
    {% else %}
      {% assign language_flags_mode = "language-flags-disabled" %}
    {% endif %}
  {% endif %}

  {% comment %}Detects language flags visibility setting.{% endcomment %}
  {% if site.data.settings_language_menu.item_state == "flags_only" %}
    {% assign language_names_mode = "language-names-disabled" %}
  {% else %}
    {% assign language_names_mode = "language-names-enabled" %}
  {% endif %}

  {% comment %}Detects language menu mode setting.{% endcomment %}
  {% if site.data.settings_language_menu.type == "list" %}
    {% assign language_menu_mode = "language-menu-mode-list" %}
  {% else %}
    {% assign language_menu_mode = "language-menu-mode-popover" %}
  {% endif %}

  {% comment %}SITE HEADER RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign header_bg = page.data.header_bg %}
  {% assign header_bg_image = header_bg.image %}
  {% assign header_bg_image_sizes = header_bg.imageSizes %}
  {% assign header_bg_color = header_bg.color %}
  {% assign header_bg_color_data = header_bg.colorData %}
  {% assign header_bg_combined_lightness = header_bg.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if header_bg %}
    {% if header_bg_combined_lightness %}
      {% if header_bg_combined_lightness > 0.6 %}
        {% assign header_bg_type = "light-background" %}
      {% else %}
        {% assign header_bg_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if header_bg_color_data.a >= 0.6 %}
        {% if header_bg_color_data.lightness >= 0.6 %}
          {% assign header_bg_type = "light-background" %}
        {% else %}
          {% assign header_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign header_bg_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign header_bg_type = "dark-background" %}
  {% endif %}

  {% if header_bg_image == nil %}
    {% if front_page %}
      {% assign header_bg_image = images_path | append: "/front-header-bg_block.jpg" %}
    {% else %}
      {% assign header_bg_image = images_path | append: "/page-header-bg_block.jpg" %}
    {% endif %}
  {% endif %}

  {% if header_bg_image_sizes == nil %}
    {% if front_page %}
      {% assign header_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
    {% else %}
      {% assign header_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/page-header-bg.jpg", "width":2560, "height":1707}, {"url":"' | append: images_path | append: '/page-header-bg_huge.jpg", "width":2048, "height":1366}, {"url":"' | append: images_path | append: '/page-header-bg_large.jpg", "width":1280, "height":853}]' %}
    {% endif %}
  {% else %}
    {% assign header_bg_image_sizes_str = header_bg_image_sizes | json %}
  {% endif %}

  {% if header_bg_color == nil %}
    {% assign header_bg_color = "rgba(0, 0, 0, 0.1)" %}
  {% endif %}

  {% if header_bg_color_data == nil %}
    {% assign header_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
  {% else %}
    {% assign header_bg_color_data_str = header_bg_color_data | json %}
  {% endif %}


  {% comment %}Boolean for article type.{% endcomment %}
  {% if blog_article_page and article.data.photo_article_state %}
    {% assign photo_article = true %}
  {% endif %}

  {% comment %}Assign variables for blog article.{% endcomment %}
  {% assign article_header_bg = article.data.header_bg %}
  {% assign article_header_bg_image = article_header_bg.image %}
  {% assign article_header_bg_image_sizes = article_header_bg.imageSizes %}
  {% assign article_header_bg_color = article_header_bg.color %}
  {% assign article_header_bg_color_data = article_header_bg.colorData %}
  {% assign article_header_bg_combined_lightness = article_header_bg.combinedLightness %}

  {% if blog_article_page %}
    {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
    {% if article_header_bg %}
      {% if article_header_bg_combined_lightness %}
        {% if article_header_bg_combined_lightness > 0.6 %}
          {% assign article_header_bg_type = "light-background" %}
        {% else %}
          {% assign article_header_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% if article_header_bg_color_data.a >= 0.6 %}
          {% if article_header_bg_color_data.lightness >= 0.6 %}
            {% assign article_header_bg_type = "light-background" %}
          {% else %}
            {% assign article_header_bg_type = "dark-background" %}
          {% endif %}
        {% else %}
          {% assign article_header_bg_type = "light-background" %}
        {% endif %}
      {% endif %}
    {% else %}
      {% assign article_header_bg_type = "dark-background" %}
    {% endif %}

    {% if article_header_bg_image == nil %}
      {% assign article_header_bg_image = "" %}
    {% endif %}

    {% if article_header_bg_image_sizes == nil %}
      {% assign article_header_bg_image_sizes_str = "" %}
    {% else %}
      {% assign article_header_bg_image_sizes_str = article_header_bg_image_sizes | json %}
    {% endif %}




    {% if article_header_bg_color == nil %}
      {% assign article_header_bg_color = "rgba(0, 0, 0, 0.4)" %}
    {% endif %}

    {% if article_header_bg_color_data == nil %}
      {% assign article_header_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.4, "lightness": 0}' %}
    {% else %}
      {% assign article_header_bg_color_data_str = article_header_bg_color_data | json %}
    {% endif %}
  {% endif %}


  {% comment %}FRONT PAGE CONTENT AREA 1 RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bg_1 = page.data.content_bg_1 %}

  {% assign content_bg_1_color = content_bg_1.color %}
  {% assign content_bg_1_color_data = content_bg_1.colorData %}
  {% assign content_bg_1_combined_lightness = content_bg_1.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if content_bg_1 %}
    {% if content_bg_1_combined_lightness %}
      {% if content_bg_1_combined_lightness > 0.6 %}
        {% assign content_bg_1_type = "light-background" %}
      {% else %}
        {% assign content_bg_1_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if content_bg_1_color_data.a >= 0.6 %}
        {% if content_bg_1_color_data.lightness >= 0.6 %}
          {% assign content_bg_1_type = "light-background" %}
        {% else %}
          {% assign content_bg_1_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign content_bg_1_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bg_1_type = "light-background" %}
  {% endif %}

  {% if content_bg_1_color == nil %}
    {% assign content_bg_1_color = "" %}
  {% endif %}

  {% if content_bg_1_color_data == nil %}
    {% assign content_bg_1_color_data_str = "" %}
  {% else %}
    {% assign content_bg_1_color_data_str = content_bg_1_color_data | json %}
  {% endif %}


  {% comment %}FRONT PAGE CONTENT AREA 2 RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bg_2 = page.data.content_bg_2 %}

  {% assign content_bg_2_image = content_bg_2.image %}
  {% assign content_bg_2_color = content_bg_2.color %}
  {% assign content_bg_2_color_data = content_bg_2.colorData %}
  {% assign content_bg_2_combined_lightness = content_bg_2.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if content_bg_2 %}
    {% if content_bg_2_combined_lightness %}
      {% if content_bg_2_combined_lightness > 0.6 %}
        {% assign content_bg_2_type = "light-background" %}
      {% else %}
        {% assign content_bg_2_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if content_bg_2_color_data.a >= 0.6 %}
        {% if content_bg_2_color_data.lightness >= 0.6 %}
          {% assign content_bg_2_type = "light-background" %}
        {% else %}
          {% assign content_bg_2_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign content_bg_2_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bg_2_type = "dark-background" %}
  {% endif %}

  {% if content_bg_2_image == nil %}
    {% assign content_bg_2_image = images_path | append: "/front-header-bg_block.jpg" %}
  {% endif %}

  {% if content_bg_2.imageSizes == nil %}
      {% assign content_bg_2_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
  {% else %}
    {% assign content_bg_2_image_sizes_str = content_bg_2.imageSizes | json %}
  {% endif %}

  {% if content_bg_2_color == nil %}
    {% assign content_bg_2_color = "rgba(0, 0, 0, 0.1)" %}
  {% endif %}

  {% if content_bg_2_color_data == nil %}
    {% assign content_bg_2_color_data_str = "" %}
  {% else %}
    {% assign content_bg_2_color_data_str = content_bg_2_color_data | json %}
  {% endif %}


  {% comment %}SITE MAIN CONTENT AREA RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign body_bg = site.data.body_bg %}

  {% assign body_bg_color = body_bg.color %}
  {% assign body_bg_color_data = body_bg.colorData %}
  {% assign body_bg_combined_lightness = body_bg.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if body_bg %}
    {% if body_bg_combined_lightness %}
      {% if body_bg_combined_lightness > 0.6 %}
        {% assign body_bg_type = "light-background" %}
      {% else %}
        {% assign body_bg_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if body_bg_color_data.a >= 0.6 %}
        {% if body_bg_color_data.lightness >= 0.6 %}
          {% assign body_bg_type = "light-background" %}
        {% else %}
          {% assign body_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign body_bg_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign body_bg_type = "light-background" %}
  {% endif %}

  {% if body_bg_color == nil %}
    {% assign body_bg_color = "" %}
  {% endif %}

  {% if body_bg_color_data == nil %}
    {% assign body_bg_color_data_str = "" %}
  {% else %}
    {% assign body_bg_color_data_str = body_bg_color_data | json %}
  {% endif %}


  {% comment %}SITE BLOG PAGE CONTENT AREA RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign blog_body_bg = page.data.blog_body_bg %}

  {% assign blog_body_bg_color = blog_body_bg.color %}
  {% assign blog_body_bg_color_data = blog_body_bg.colorData %}
  {% assign blog_body_bg_combined_lightness = blog_body_bg.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if blog_body_bg %}
    {% if blog_body_bg_combined_lightness %}
      {% if blog_body_bg_combined_lightness > 0.6 %}
        {% assign blog_body_bg_type = "light-background" %}
      {% else %}
        {% assign blog_body_bg_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if blog_body_bg_color_data.a >= 0.6 %}
        {% if blog_body_bg_color_data.lightness >= 0.6 %}
          {% assign blog_body_bg_type = "light-background" %}
        {% else %}
          {% assign blog_body_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign blog_body_bg_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign blog_body_bg_type = "light-background" %}
  {% endif %}

  {% if blog_body_bg_color == nil %}
    {% assign blog_body_bg_color = "" %}
  {% endif %}

  {% if blog_body_bg_color_data == nil %}
    {% assign blog_body_bg_color_data_str = "" %}
  {% else %}
    {% assign blog_body_bg_color_data_str = blog_body_bg_color_data | json %}
  {% endif %}


  {% comment %}FRONT PAGE FOOTER RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% if front_page %}
    {% assign footer_bg = page.data.footer_bg %}
  {% else %}
    {% assign footer_bg = site.data.footer_bg %}
  {% endif %}

  {% assign footer_bg_color = footer_bg.color %}
  {% assign footer_bg_color_data = footer_bg.colorData %}
  {% assign footer_bg_combined_lightness = footer_bg.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if footer_bg %}
    {% if footer_bg_combined_lightness %}
      {% if footer_bg_combined_lightness > 0.6 %}
        {% assign footer_bg_type = "light-background" %}
      {% else %}
        {% assign footer_bg_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if footer_bg_color_data.a >= 0.6 %}
        {% if footer_bg_color_data.lightness >= 0.6 %}
          {% assign footer_bg_type = "light-background" %}
        {% else %}
          {% assign footer_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign footer_bg_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign footer_bg_type = "light-background" %}
  {% endif %}

  {% if footer_bg_color == nil %}
    {% if front_page %}
      {% assign footer_bg_color = "" %}
    {% else %}
      {% assign footer_bg_color = "rgb(230,230,230)" %}
    {% endif %}
  {% endif %}

  {% if footer_bg_color_data == nil %}
    {% assign footer_bg_color_data_str = "" %}
  {% else %}
    {% assign footer_bg_color_data_str = footer_bg_color_data | json %}
  {% endif %}

  {% assign product_list_layout = "Product list" %}
  {% assign product_layout = "Product" %}

  {% assign show_product_related_pages_in_main_menu = site.data.settings_root_item.show_product_related_pages_in_main_menu %}

  {% comment %}=================================================================
  || Design editor variables.
  ============================================================= {% endcomment %}
  {% capture base_font_set %}
    [
      {
        "type": "group",
        "title": "Sans Serif",
        "list": [
          {
            "title": "Avenir Next",
            "value": "\"Avenir Next\", \"Avenir\", \"Helvetica Neue\", \"Helvetica\", \"Segoe UI\", sans-serif"
          },
          {
            "title": "Fira Sans",
            "value": "\"Fira Sans\", sans-serif"
          },
          {
            "title": "Lato",
            "value": "\"Lato\", sans-serif"
          },
          {
            "title": "Montserrat",
            "value": "\"Montserrat\", sans-serif"
          },
          {
            "title": "Open Sans",
            "value": "\"Open Sans\", sans-serif"
          },
          {
            "title": "PT Sans",
            "value": "\"PT Sans\", sans-serif"
          },
          {
            "title": "Raleway",
            "value": "\"Raleway\", sans-serif"
          },
          {
            "title": "Roboto",
            "value": "\"Roboto\", sans-serif"
          },
          {
            "title": "Source Sans Pro",
            "value": "\"Source Sans Pro\", sans-serif"
          },
          {
            "title": "Ubuntu",
            "value": "\"Ubuntu\", sans-serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Serif",
        "list": [
          {
            "title": "Arvo",
            "value": "\"Arvo\", serif"
          },
          {
            "title": "Crimson Text",
            "value": "\"Crimson Text\", serif"
          },
          {
            "title": "Georgia",
            "value": "\"Georgia\", serif"
          },
          {
            "title": "Lora",
            "value": "\"Lora\", serif"
          },
          {
            "title": "Noto Serif",
            "value": "\"Noto Serif\", serif"
          },
          {
            "title": "Playfair Display",
            "value": "\"Playfair Display\", serif"
          },
          {
            "title": "PT Serif",
            "value": "\"PT Serif\", serif"
          },
          {
            "title": "Roboto Slab",
            "value": "\"Roboto Slab\", serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Monospace",
        "list": [
          {
            "title": "Anonymous Pro",
            "value": "\"Anonymous Pro\", monospace"
          },
          {
            "title": "Cousine",
            "value": "\"Cousine\", monospace"
          },
          {
            "title": "Roboto Mono",
            "value": "\"Roboto Mono\", monospace"
          },
          {
            "title": "Ubuntu Mono",
            "value": "\"Ubuntu Mono\", monospace"
          }
        ]
      }
    ]
  {% endcapture %}

  {% capture base_alignment_set %}
    [
      {
        "titleI18n": "left",
        "value": "left"
      },
      {
        "titleI18n": "center",
        "value": "center"
      },
      {
        "titleI18n": "right",
        "value": "right"
      }
    ]
  {% endcapture %}

  {% capture base_border_style_set %}
    [
      {
        "titleI18n": "solid",
        "value": "solid"
      },
      {
        "titleI18n": "none",
        "value": "hidden"
      }
    ]
  {% endcapture %}

  {% comment %}VOOG intro popover targets. Add them where applicable popovers should appear.{% endcomment %}
  {% capture edy_intro_add_page %}{% if editmode %}data-edy-intro-popover="edy-add-page"{% endif %}{% endcapture %}
  {% capture edy_intro_add_lang %}{% if editmode %}data-edy-intro-popover="edy-add-lang"{% endif %}{% endcapture %}
  {% capture edy_intro_edit_text %}{% if editmode %}data-edy-intro-popover="edy-edit-text"{% endif %}{% endcapture %}

{% endcapture %}
