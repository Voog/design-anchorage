<style>
  {% comment %}/* Body background image */{% endcomment %}
  {% if content_left_bg.imageSizes != nil %}
    {% if content_left_bg.imageSizes == "" %}
      .content-left .background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_left_bg.imageSizes %}
        {% if forloop.first %}
          .content-left .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-left .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}
    {% assign bg_image_prefix = images_path | append: "/front-page-left-bg" %}

    .content-left .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 600px) and (max-height: 572px) {
      .content-left .background-image {
        background-image: url("{{ bg_image_prefix }}_block.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_left_bg.color %}
    .content-left .background-color {
      background-color: {{ page.data.content_left_bg.color }};
    }
  {% else %}
    .content-left .background-color {
      background-color: {{ content_left_bg_color }};
    }
  {% endif %}

  {% comment %}/* Body background image */{% endcomment %}
  {% if content_right_bg.imageSizes != nil %}
    {% if content_right_bg.imageSizes == "" %}
      .content-right .background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_right_bg.imageSizes %}
        {% if forloop.first %}
          .content-right .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-right .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}
    {% assign bg_image_prefix = images_path | append: "/snow" %}

    .content-right .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 600px) and (max-height: 572px) {
      .content-right .background-image {
        background-image: url("{{ bg_image_prefix }}_block.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_right_bg.color %}
    .content-right .background-color {
      background-color: {{ page.data.content_right_bg.color }};
    }
  {% else %}
    .content-right .background-color {
      background-color: {{ content_right_bg_color }};
    }
  {% endif %}

  {% comment %}/* Body background image */{% endcomment %}
  {% if content_top_bg.imageSizes != nil %}
    {% if content_top_bg.imageSizes == "" %}
      .content-top .background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_top_bg.imageSizes %}
        {% if forloop.first %}
          .content-top .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-top .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}

    {% if front_page %}
      {% assign bg_image_prefix = images_path | append: "/snow" %}
    {% elsif blog_page or post_page %}
      {% assign bg_image_prefix = images_path | append: "/mountains" %}
    {% else %}
      {% assign bg_image_prefix = images_path | append: "/aurora" %}
    {% endif %}

    .content-top .background-image {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 600px) and (max-height: 572px) {
      .content-top .background-image {
        background-image: url("{{ bg_image_prefix }}_block.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_top_bg.color %}
    .content-top .background-color {
      background-color: {{ page.data.content_top_bg.color }};
    }
  {% else %}
    .content-top .background-color {
      background-color: {{ content_top_bg_color }};
    }
  {% endif %}

  {% comment %}/* Body background image */{% endcomment %}
  {% if content_bottom_bg.imageSizes != nil %}
    {% if content_bottom_bg.imageSizes == "" %}
      .content-bottom .background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_bottom_bg.imageSizes %}
        {% if forloop.first %}
          .content-bottom .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-bottom .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_bottom_bg.color %}
    .content-bottom .background-color {
      background-color: {{ page.data.content_bottom_bg.color }};
    }
  {% else %}
    .content-bottom .background-color {
      background-color: {{ content_bottom_bg_color }};
    }
  {% endif %}
</style>
