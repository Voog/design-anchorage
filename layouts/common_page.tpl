<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign common_page = true %}
    {% include 'voog-tools-variables' %}
    {% include 'html-head' %}
    {% include 'voog-tools-styles' %}
    {% if editmode %}
      <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
      <style id="preview-style"></style>
    {% endif %}
  </head>

  <body class="common-page">
    <div class="site-container">
      {% include 'site-header' %}
      {% include 'site-sidebar' %}

      <main class="page-content" role="main">
        <div class="main-inner-row content-full">

          <div class="main-content">
            <div class="wrap content-formatted">
              <div class="inner">
                <section class="content-area">
                  <header class="content-header">{% contentblock name="content_header" %}<h1>{{ page.title }}</h1>{% endcontentblock %}</header>
                  <div class="content-body">{% content %}</div>
                </section>
              </div>
            </div>
          </div>

        </div>
      </main>

      {% include 'site-footer' %}
      {% include "menu-mobile" %}
      {% include 'site-javascripts' %}
      {% include 'voog-tools' with 'common_page' %}
      <script>site.initCommonPage();</script>
    </div>
  </body>
</html>
