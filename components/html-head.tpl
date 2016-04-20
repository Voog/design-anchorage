{% comment %}IE SETTINGS{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}META INFO{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">

{% comment %}FAV ICON{% endcomment %}
{% if site.has_favicon? %}
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% endif %}

{% comment %}STYLESHEETS{% endcomment %}
{% if editmode %}
  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
{% endif %}
{% stylesheet_link "main.min.css" %}

{% comment %}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{% endcomment %}
<script src="{{ javascripts_path }}/modernizr-custom.min.js"></script>

{% customstyle %}
  {% include "template-cs-main-styles" %}
  {% include "template-cs-header" %}
  {% if sidebar %}
    {% include "template-cs-sidebar" %}
  {% endif %}
  {% include "template-cs-headings" %}
  {% include "template-cs-content" %}
  {% comment %}{% include "template-cs-list" %}{% endcomment %}
  {% include "template-cs-table" %}
{% comment %}
  {% if html-head == "blog_listing_page" %}
    {% include "template-cs-blog-list" %}
  {% endif %}
  {% include "template-cs-form" %}
  {% include "template-cs-footer" %}
{% endcomment %}

  {% include "template-cs-style-rules" %}
{% endcustomstyle %}

{% comment %}SITE TITLE{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }}{% unless page.site_title == "" %} — {{ page.site_title }}{% endunless %}{% else %}{% if site.root_item.selected? and page.site_title != "" %}{{ page.site_title }}{% else %}{{ page.title }}{% unless page.site_title == "" %} — {{ page.site_title }}{% endunless %}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% comment %}MISC{% endcomment %}
{% include "site-meta" %}
{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
