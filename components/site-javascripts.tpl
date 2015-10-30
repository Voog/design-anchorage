{% comment %}SITE WIDE JAVASCRIPTS{% endcomment %}
<script src="{{ javascripts_path }}/main.min.js"></script>
{% sitejs_include %}

{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 10,
      lang: '{{ page.language_code }}',
      resultsContainer: $('.js-voog-search-modal').get(0),
      sideclick: true,
      mobileModeWidth: 480,
      updateOnKeypress: true
    });
  </script>
{% endif %}

{% if editmode %}
  <script type="text/javascript">
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: 'Button', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  </script>
{% endif %}

{% comment %}GOOGLE ANALYTICS INITIATION{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
