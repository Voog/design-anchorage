{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if page.image == nil and front_page %}
  {% if header_bg_image_sizes != nil and header_bg_image_sizes != '' %}
    {% assign og_image = header_bg_image_sizes[0] %}
  {% elsif content_bg_1_image_sizes != nil and content_bg_1_image_sizes != '' %}
    {% assign og_image = content_bg_1_image_sizes[0] %}
  {% elsif content_bg_2_image_sizes != nil and content_bg_2_image_sizes != '' %}
    {% assign og_image = content_bg_2_image_sizes[0] %}
  {% endif %}
{% else %}
  {% if article %}
    {% if article.image? %}
      {% assign og_image = article.image %}
    {% endif %}
  {% elsif page.image? %}
    {% assign og_image = page.image %}
  {% endif %}
{% endif %}

{% if og_image %}
  {% if og_image.url %}<meta property="og:image" content="{{ og_image.url }}">{% endif %}
  {% if og_image.content_type %}<meta property="og:image:type" content="{{ og_image.content_type }}">{% endif %}
  {% if og_image.width %}<meta property="og:image:width" content="{{ og_image.width }}">{% endif %}
  {% if og_image.height %}<meta property="og:image:height" content="{{ og_image.height }}">{% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if article %}
  {% assign description = article.description %}
{% else %}
  {% assign description = page.description %}
{% endif %}

{% if description != nil and description != '' %}
  <meta property="og:description" content="{{ description | escape }}">
  <meta name="description" content="{{ description | escape }}">
{% endif %}
