<style>
  {% comment %}/* FRONT PAGE HEADER BACKGROUND */{% endcomment %}
  {% comment %}/* Front page header background image styles */{% endcomment %}
  {% if header_bg.imageSizes != nil %}
    {% if header_bg.imageSizes == "" %}
      .site-header .background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in header_bg.imageSizes %}
        {% if forloop.first %}
          .site-header .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% elsif imageSize.url contains "_block" %}
          {% break %}
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) {
            .site-header .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}

    {% if front_page %}
      {% assign bg_image_prefix = images_path | append: "/front-header-bg" %}
    {% elsif blog_article_page %}
      {% assign bg_image_prefix = images_path | append: "/article-header-bg" %}
    {% else %}
      {% assign bg_image_prefix = images_path | append: "/page-header-bg" %}
    {% endif %}

    .site-header .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 2048px) {
      .site-header .background-image {
        background-image: url("{{ bg_image_prefix }}_huge.jpg");
      }
    }

    @media screen and (max-width: 1280px) {
      .site-header .background-image {
        background-image: url("{{ bg_image_prefix }}_large.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Front page header background color style */{% endcomment %}
  .site-header .background-color {
    background-color: {{ header_bg_color }};
  }


  {% comment %}/* FRONT PAGE CONTENT AREA 1 RELATED STYLES. */{% endcomment %}
  {% comment %}/* Front content area 1 background image styles */{% endcomment %}
  {% if content_bg_1.imageSizes != nil %}
    {% if content_bg_1.imageSizes == "" %}
      .main-inner-row .background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in content_bg_1.imageSizes %}
        {% if forloop.first %}
          .main-inner-row .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% elsif imageSize.url contains "_block" %}
          {% break %}
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) {
            .main-inner-row .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endif %}

  {% comment %}/* Front page content area 1 background color style */{% endcomment %}
  .main-inner-row .background-color {
    background-color: {{ content_bg_1_color }};
  }


  {% comment %}/* FRONT PAGE CONTENT AREA 1 RELATED STYLES. */{% endcomment %}
  {% comment %}/* Front content area 2 background image styles */{% endcomment %}
  {% if content_bg_2.imageSizes != nil %}
    {% if content_bg_2.imageSizes == "" %}
      .blog-feed .background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in content_bg_2.imageSizes %}
        {% if forloop.first %}
          .blog-feed .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% elsif imageSize.url contains "_block" %}
          {% break %}
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) {
            .blog-feed .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}
    {% assign bg_image_prefix = images_path | append: "/front-header-bg" %}

    .blog-feed .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 2048px) {
      .blog-feed .background-image {
        background-image: url("{{ bg_image_prefix }}_huge.jpg");
      }
    }

    @media screen and (max-width: 1280px) {
      .blog-feed .background-image {
        background-image: url("{{ bg_image_prefix }}_large.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Front page content area 1 background color style */{% endcomment %}
  .blog-feed .background-color {
    background-color: {{ content_bg_2_color }};
  }


  {% comment %}/* FRONT PAGE CONTENT AREA 1 RELATED STYLES. */{% endcomment %}
  {% comment %}/* Front content area 1 background image styles */{% endcomment %}
  {% if footer_bg.imageSizes != nil %}
    {% if footer_bg.imageSizes == "" %}
      .site-footer .background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in footer_bg.imageSizes %}
        {% if forloop.first %}
          .site-footer .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% elsif imageSize.url contains "_block" %}
          {% break %}
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) {
            .site-footer .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endif %}

  {% comment %}/* Front page content area 1 background color style */{% endcomment %}
  .site-footer .background-color {
    background-color: {{ footer_bg_color }};
  }
</style>
