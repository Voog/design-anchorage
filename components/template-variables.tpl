{% capture dont_render %}
  {% comment %}ASSIGN LANGUAGE MENU FLAGS STATE{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
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
            "value": "\"Avenir Next\", \"Helvetica Neue\", \"Helvetica\", \"Segoe UI\", sans-serif"
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
            "value": "\"Montserrat\", Helvetica, Arial, sans-serif"
          },
          {
            "title": "Open Sans",
            "value": "\"Open Sans\", sans-serif"
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
            "value": "\"Arvo\", sans-serif"
          },
          {
            "title": "Crimson Text",
            "value": "\"Crimson Text\", sans-serif"
          },
          {
            "title": "Lora",
            "value": "\"Lora\", sans-serif"
          },
          {
            "title": "Noto Serif",
            "value": "\"Noto Serif\", sans-serif"
          },
          {
            "title": "Playfair Display",
            "value": "\"Playfair Display\", sans-serif"
          },
          {
            "title": "PT Serif",
            "value": "\"PT Serif\", sans-serif"
          },
          {
            "title": "Roboto Slab",
            "value": "\"Roboto Slab\", sans-serif"
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
        "title": "Left",
        "value": "left"
      },
      {
        "title": "Center",
        "value": "center"
      },
      {
        "title": "Right",
        "value": "right"
      }
    ]
  {% endcapture %}

  {% capture base_border_style_set %}
    [
      {
        "title": "Solid",
        "value": "solid"
      },
      {
        "title": "Dotted",
        "value": "dotted"
      },
      {
        "title": "Dashed",
        "value": "dashed"
      },
      {
        "title": "None",
        "value": "hidden"
      }
    ]
  {% endcapture %}
{% endcapture %}
