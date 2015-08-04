{% capture dont_render %}

  {% comment %}Assign language menu flags state{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}


  {% comment %}Content top. Assign variables based on page type.{% endcomment %}
  {% if blog_article_page %}
    {% assign content_top_bg = article.data.content_top_bg %}
    {% assign content_top_bg_image = article.data.content_top_bg.image %}
    {% assign content_top_bg_image_sizes = article.data.content_top_bg.imageSizes %}
    {% assign content_top_bg_color = article.data.content_top_bg.color %}
    {% assign content_top_bg_color_data = article.data.content_top_bg.colorData %}
    {% assign content_top_bg_combined_lightness = content_top_bg.combinedLightness %}
  {% else %}
    {% assign content_top_bg = page.data.content_top_bg %}
    {% assign content_top_bg_image = page.data.content_top_bg.image %}
    {% assign content_top_bg_image_sizes = page.data.content_top_bg.imageSizes %}
    {% assign content_top_bg_color = page.data.content_top_bg.color %}
    {% assign content_top_bg_color_data = page.data.content_top_bg.colorData %}
    {% assign content_top_bg_combined_lightness = content_top_bg.combinedLightness %}
  {% endif %}

  {% comment %}Content top. Sets the background type.{% endcomment %}
  {% if content_top_bg %}
    {% if content_top_bg_combined_lightness %}
      {% if content_top_bg_combined_lightness > 0.5 %}
        {% assign content_top_bg_type = 'light-background' %}
      {% else %}
        {% assign content_top_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if content_top_bg_color_data.a >= 0.5 %}
        {% if content_top_bg_color_data.lightness >= 0.5 %}
          {% assign content_top_bg_type = 'light-background' %}
        {% else %}
          {% assign content_top_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign content_top_bg_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_top_bg_type = 'dark-background' %}
  {% endif %}

  {% if content_top_bg_image == nil %}
    {% if front_page %}
      {% assign content_top_bg_image_original = images_path | append: '/front-header-bg.jpg' %}
      {% assign content_top_bg_image = images_path | append: '/front-header-bg_block.jpg' %}
    {% elsif blog_article_page %}
      {% assign content_top_bg_image_original = images_path | append: '/article-header-bg.jpg' %}
      {% assign content_top_bg_image = images_path | append: '/article-header-bg_block.jpg' %}
    {% else %}
      {% assign content_top_bg_image_original = images_path | append: '/page-header-bg.jpg' %}
      {% assign content_top_bg_image = images_path | append: '/page-header-bg_block.jpg' %}
    {% endif %}
  {% endif %}

  {% if content_top_bg_image_sizes == nil %}
    {% if front_page %}
      {% assign content_top_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-header-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/front-header-bg_block.jpg", "width":600, "height":572}]' %}
    {% elsif blog_article_page %}
      {% assign content_top_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/article-header-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/article-header-bg_block.jpg", "width":600, "height":572}]' %}
    {% else %}
      {% assign content_top_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/page-header-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/page-header-bg_block.jpg", "width":600, "height":572}]' %}
    {% endif %}
  {% else %}
    {% assign content_top_bg_image_sizes_str = content_top_bg_image_sizes | json %}
  {% endif %}

  {% if content_top_bg_color == nil %}
    {% if front_page %}
      {% assign content_top_bg_color = 'rgba(0, 0, 0, 0.1)' %}
    {% elsif blog_page or blog_article_page %}
      {% assign content_top_bg_color = 'rgba(0, 0, 0, 0.4)' %}
    {% else %}
      {% assign content_top_bg_color = 'rgba(0, 0, 0, 0.1)' %}
    {% endif %}
  {% endif %}

  {% if content_top_bg_color_data == nil %}
    {% assign content_top_bg_color_data_str = '{"r": 148, "g": 139, "b": 144, "a": 0.05, "lightness": 0.78}' %}
  {% else %}
    {% assign content_top_bg_color_data_str = content_top_bg_color_data | json %}
  {% endif %}


  {% comment %}Content left. Assign variables based on page type.{% endcomment %}
  {% assign content_left_bg = page.data.content_left_bg %}
  {% assign content_left_bg_image = page.data.content_left_bg.image %}
  {% assign content_left_bg_image_sizes = page.data.content_left_bg.imageSizes %}
  {% assign content_left_bg_color = page.data.content_left_bg.color %}
  {% assign content_left_bg_color_data = page.data.content_left_bg.colorData %}
  {% assign content_left_bg_combined_lightness = content_left_bg.combinedLightness %}

  {% comment %}Content left. Sets the background type.{% endcomment %}
  {% if content_left_bg %}
    {% if content_left_bg_combined_lightness %}
      {% if content_left_bg_combined_lightness > 0.5 %}
        {% assign content_left_bg_type = 'light-background' %}
      {% else %}
        {% assign content_left_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if content_left_bg_color_data.a >= 0.5 %}
        {% if content_left_bg_color_data.lightness >= 0.5 %}
          {% assign content_left_bg_type = 'light-background' %}
        {% else %}
          {% assign content_left_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign content_left_bg_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_left_bg_type = 'light-background' %}
  {% endif %}

  {% unless content_left_bg_image_sizes == nil %}
    {% assign content_left_bg_image_sizes_str = content_left_bg_image_sizes | json %}
  {% endunless %}

  {% if content_left_bg_color == nil %}
    {% assign content_left_bg_color = 'rgba(148, 139, 144, 0.05)' %}
  {% endif %}

  {% if content_left_bg_color_data == nil %}
    {% assign content_left_bg_color_data_str = '{"r": 148, "g": 139, "b": 144, "a": 0.05, "lightness": 0.78}' %}
  {% else %}
    {% assign content_left_bg_color_data_str = content_left_bg_color_data | json %}
  {% endif %}


  {% comment %}Content right. Assign variables based on page type.{% endcomment %}
  {% assign content_right_bg = page.data.content_right_bg %}
  {% assign content_right_bg_image = page.data.content_right_bg.image %}
  {% assign content_right_bg_image_sizes = page.data.content_right_bg.imageSizes %}
  {% assign content_right_bg_color = page.data.content_right_bg.color %}
  {% assign content_right_bg_color_data = page.data.content_right_bg.colorData %}
  {% assign content_right_bg_combined_lightness = content_right_bg.combinedLightness %}

  {% comment %}Content right. Sets the background type.{% endcomment %}
  {% if content_right_bg %}
    {% if content_right_bg_combined_lightness %}
      {% if content_right_bg_combined_lightness > 0.5 %}
        {% assign content_right_bg_type = 'light-background' %}
      {% else %}
        {% assign content_right_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if content_right_bg_color_data.a >= 0.5 %}
        {% if content_right_bg_color_data.lightness >= 0.5 %}
          {% assign content_right_bg_type = 'light-background' %}
        {% else %}
          {% assign content_right_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign content_right_bg_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_right_bg_type = 'dark-background' %}
  {% endif %}

  {% if content_right_bg_image == nil %}
    {% assign content_right_bg_image_original = images_path | append: '/front-page-right-bg.jpg' %}
    {% assign content_right_bg_image = images_path | append: '/front-page-right-bg_block.jpg' %}
  {% endif %}

  {% if content_right_bg_image_sizes == nil %}
    {% assign content_right_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-right-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/front-page-right-bg_block.jpg", "width":600, "height":572}]' %}
  {% else %}
    {% assign content_right_bg_image_sizes_str = content_right_bg_image_sizes | json %}
  {% endif %}

  {% if content_right_bg_color == nil %}
    {% if front_page %}
      {% assign content_right_bg_color = 'rgba(0, 0, 0, 0.2)' %}
    {% elsif blog_page or blog_article_page %}
      {% assign content_right_bg_color = 'rgba(0, 0, 0, 0.2)' %}
    {% else %}
      {% assign content_right_bg_color = 'rgba(0, 0, 0, 0.2)' %}
    {% endif %}
  {% endif %}

  {% if content_right_bg_color_data == nil %}
    {% assign content_right_bg_color_data_str = '{"r": 255, "g": 255, "b": 255, "a": 0, "lightness": 0.78}' %}
  {% else %}
    {% assign content_right_bg_color_data_str = content_right_bg_color_data | json %}
  {% endif %}


  {% comment %}Content bottom. Assign variables based on page type.{% endcomment %}
  {% if blog_article_page %}
    {% assign content_bottom_bg = article.data.content_bottom_bg %}
    {% assign content_bottom_bg_image = article.data.content_bottom_bg.image %}
    {% assign content_bottom_bg_image_sizes = article.data.content_bottom_bg.imageSizes %}
    {% assign content_bottom_bg_color = article.data.content_bottom_bg.color %}
    {% assign content_bottom_bg_color_data = article.data.content_bottom_bg.colorData %}
    {% assign content_bottom_bg_combined_lightness = content_bottom_bg.combinedLightness %}
  {% else %}
    {% assign content_bottom_bg = page.data.content_bottom_bg %}
    {% assign content_bottom_bg_image = page.data.content_bottom_bg.image %}
    {% assign content_bottom_bg_image_sizes = page.data.content_bottom_bg.imageSizes %}
    {% assign content_bottom_bg_color = page.data.content_bottom_bg.color %}
    {% assign content_bottom_bg_color_data = page.data.content_bottom_bg.colorData %}
    {% assign content_bottom_bg_combined_lightness = content_bottom_bg.combinedLightness %}
  {% endif %}

  {% comment %}Content bottom. Sets the background type.{% endcomment %}
  {% if content_bottom_bg %}
    {% if content_bottom_bg_combined_lightness %}
      {% if content_bottom_bg_combined_lightness > 0.5 %}
        {% assign content_bottom_bg_type = 'light-background' %}
      {% else %}
        {% assign content_bottom_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if content_bottom_bg_color_data.a >= 0.5 %}
        {% if content_bottom_bg_color_data.lightness >= 0.5 %}
          {% assign content_bottom_bg_type = 'light-background' %}
        {% else %}
          {% assign content_bottom_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign content_bottom_bg_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bottom_bg_type = 'light-background' %}
  {% endif %}

  {% if content_bottom_bg_image_sizes != nil %}
    {% assign content_bottom_bg_image_sizes_str = content_bottom_bg_image_sizes | json %}
  {% endif %}

  {% if content_bottom_bg_color == nil %}
    {% if front_page %}
      {% assign content_bottom_bg_color = 'rgba(255,255,255,1)' %}
    {% elsif blog_page or blog_article_page %}
      {% assign content_bottom_bg_color = 'rgba(233,233,233,1)' %}
    {% else %}
      {% assign content_bottom_bg_color = 'rgba(255,255,255,1)' %}
    {% endif %}
  {% endif %}

  {% if content_bottom_bg_color_data == nil %}
    {% assign content_bottom_bg_color_data_str = '{"r": 43, "g": 43, "b": 43, "a": 1, "lightness": 0.78}' %}
  {% else %}
    {% assign content_bottom_bg_color_data_str = content_bottom_bg_color_data | json %}
  {% endif %}

{% endcapture %}
