{% capture dont_render %}
  {% comment %}ASSIGN LANGUAGE MENU FLAGS STATE{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {% comment %}SITE HEADER RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% if blog_article_page %}
    {% assign header_bg = article.data.header_bg %}
  {% else %}
    {% assign header_bg = page.data.header_bg %}
  {% endif %}

  {% assign header_bg_image = header_bg.image %}
  {% assign header_bg_image_sizes = header_bg.imageSizes %}
  {% assign header_bg_color = header_bg.color %}
  {% assign header_bg_color_data = header_bg.colorData %}
  {% assign header_bg_combined_lightness = header_bg.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if header_bg %}
    {% if header_bg_combined_lightness %}
      {% if header_bg_combined_lightness > 0.5 %}
        {% assign header_bg_type = 'light-background' %}
      {% else %}
        {% assign header_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if header_bg_color_data.a >= 0.5 %}
        {% if header_bg_color_data.lightness >= 0.5 %}
          {% assign header_bg_type = 'light-background' %}
        {% else %}
          {% assign header_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign header_bg_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign header_bg_type = 'dark-background' %}
  {% endif %}

  {% if header_bg_image == nil %}
    {% if front_page %}
      {% assign header_bg_image = images_path | append: '/front-header-bg_block.jpg' %}
    {% elsif blog_article_page %}
      {% assign header_bg_image = images_path | append: '/article-header-bg_block.jpg' %}
    {% else %}
      {% assign header_bg_image = images_path | append: '/page-header-bg_block.jpg' %}
    {% endif %}
  {% endif %}

  {% if header_bg_image_sizes == nil %}
    {% if front_page %}
      {% assign header_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
    {% elsif blog_article_page %}
      {% assign header_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/article-header-bg.jpg", "width":2560, "height":1709}, {"url":"' | append: images_path | append: '/article-header-bg_huge.jpg", "width":2048, "height":1367}, {"url":"' | append: images_path | append: '/article-header-bg_large.jpg", "width":1280, "height":854}]' %}
    {% else %}
      {% assign header_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/page-header-bg.jpg", "width":2560, "height":1707}, {"url":"' | append: images_path | append: '/page-header-bg_huge.jpg", "width":2048, "height":1366}, {"url":"' | append: images_path | append: '/page-header-bg_large.jpg", "width":1280, "height":853}]' %}
    {% endif %}
  {% else %}
    {% assign header_bg_image_sizes_str = header_bg_image_sizes | json %}
  {% endif %}

  {% if header_bg_color == nil %}
    {% if front_page %}
      {% assign header_bg_color = 'rgba(0, 0, 0, 0.1)' %}
    {% elsif blog_page or blog_article_page %}
      {% assign header_bg_color = 'rgba(0, 0, 0, 0.4)' %}
    {% else %}
      {% assign header_bg_color = 'rgba(0, 0, 0, 0.1)' %}
    {% endif %}
  {% endif %}

  {% if header_bg_color_data == nil %}
    {% if front_page %}
      {% assign header_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% elsif blog_page or blog_article_page %}
      {% assign header_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.4, "lightness": 0}' %}
    {% else %}
      {% assign header_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.1, "lightness": 0}' %}
    {% endif %}
  {% else %}
    {% assign header_bg_color_data_str = header_bg_color_data | json %}
  {% endif %}


  {% comment %}FRONT PAGE CONTENT AREA 1 RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bg_1 = page.data.content_bg_1 %}

  {% assign content_bg_1_image = content_bg_1.image %}
  {% assign content_bg_1_image_sizes = content_bg_1.imageSizes %}
  {% assign content_bg_1_color = content_bg_1.color %}
  {% assign content_bg_1_color_data = content_bg_1.colorData %}
  {% assign content_bg_1_combined_lightness = content_bg_1.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if content_bg_1 %}
    {% if content_bg_1_combined_lightness %}
      {% if content_bg_1_combined_lightness > 0.5 %}
        {% assign content_bg_1_type = 'light-background' %}
      {% else %}
        {% assign content_bg_1_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if content_bg_1_color_data.a >= 0.5 %}
        {% if content_bg_1_color_data.lightness >= 0.5 %}
          {% assign content_bg_1_type = 'light-background' %}
        {% else %}
          {% assign content_bg_1_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign content_bg_1_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bg_1_type = 'dark-background' %}
  {% endif %}

  {% if content_bg_1_image == nil %}
    {% assign content_bg_1_image = '' %}
  {% endif %}

  {% if content_bg_1_image_sizes == nil %}
      {% assign content_bg_1_image_sizes_str = '' %}
  {% else %}
    {% assign content_bg_1_image_sizes_str = content_bg_1_image_sizes | json %}
  {% endif %}

  {% if content_bg_1_color == nil %}
    {% assign content_bg_1_color = '' %}
  {% endif %}

  {% if content_bg_1_color_data == nil %}
    {% assign content_bg_1_color_data_str = '' %}
  {% else %}
    {% assign content_bg_1_color_data_str = content_bg_1_color_data | json %}
  {% endif %}


  {% comment %}FRONT PAGE CONTENT AREA 2 RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bg_2 = page.data.content_bg_2 %}

  {% assign content_bg_2_image = content_bg_2.image %}
  {% assign content_bg_2_image_sizes = content_bg_2.imageSizes %}
  {% assign content_bg_2_color = content_bg_2.color %}
  {% assign content_bg_2_color_data = content_bg_2.colorData %}
  {% assign content_bg_2_combined_lightness = content_bg_2.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if content_bg_2 %}
    {% if content_bg_2_combined_lightness %}
      {% if content_bg_2_combined_lightness > 0.5 %}
        {% assign content_bg_2_type = 'light-background' %}
      {% else %}
        {% assign content_bg_2_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if content_bg_2_color_data.a >= 0.5 %}
        {% if content_bg_2_color_data.lightness >= 0.5 %}
          {% assign content_bg_2_type = 'light-background' %}
        {% else %}
          {% assign content_bg_2_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign content_bg_2_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bg_2_type = 'dark-background' %}
  {% endif %}

  {% if content_bg_2_image == nil %}
    {% assign content_bg_2_image = images_path | append: '/front-header-bg_block.jpg' %}
  {% endif %}

  {% if content_bg_2_image_sizes == nil %}
      {% assign content_bg_2_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":2560, "height":1702}, {"url":"' | append: images_path | append: '/front-header-bg_huge.jpg", "width":2048, "height":1362}, {"url":"' | append: images_path | append: '/front-header-bg_large.jpg", "width":1280, "height":851}]' %}
  {% else %}
    {% assign content_bg_2_image_sizes_str = content_bg_2_image_sizes | json %}
  {% endif %}

  {% if content_bg_2_color == nil %}
    {% assign content_bg_2_color = '' %}
  {% endif %}

  {% if content_bg_2_color_data == nil %}
    {% assign content_bg_2_color_data_str = '' %}
  {% else %}
    {% assign content_bg_2_color_data_str = content_bg_2_color_data | json %}
  {% endif %}


  {% comment %}FRONT PAGE FOOTER RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign footer_bg = page.data.footer_bg %}

  {% assign footer_bg_image = footer_bg.image %}
  {% assign footer_bg_image_sizes = footer_bg.imageSizes %}
  {% assign footer_bg_color = footer_bg.color %}
  {% assign footer_bg_color_data = footer_bg.colorData %}
  {% assign footer_bg_combined_lightness = footer_bg.combinedLightness %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if footer_bg %}
    {% if footer_bg_combined_lightness %}
      {% if footer_bg_combined_lightness > 0.5 %}
        {% assign footer_bg_type = 'light-background' %}
      {% else %}
        {% assign footer_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if footer_bg_color_data.a >= 0.5 %}
        {% if footer_bg_color_data.lightness >= 0.5 %}
          {% assign footer_bg_type = 'light-background' %}
        {% else %}
          {% assign footer_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign footer_bg_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign footer_bg_type = 'dark-background' %}
  {% endif %}

  {% if footer_bg_image == nil %}
    {% assign footer_bg_image = '' %}
  {% endif %}

  {% if footer_bg_image_sizes == nil %}
      {% assign footer_bg_image_sizes_str = '' %}
  {% else %}
    {% assign footer_bg_image_sizes_str = footer_bg_image_sizes | json %}
  {% endif %}

  {% if footer_bg_color == nil %}
    {% assign footer_bg_color = '' %}
  {% endif %}

  {% if footer_bg_color_data == nil %}
    {% assign footer_bg_color_data_str = '' %}
  {% else %}
    {% assign footer_bg_color_data_str = footer_bg_color_data | json %}
  {% endif %}
{% endcapture %}