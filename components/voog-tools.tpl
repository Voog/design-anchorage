{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>

    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    {% if edicy-tools == "article" %}
      // Article pages custom data variable.
      var articleData = new Edicy.CustomData({
        type: 'article',
        id: '{{ article.id }}'
      });
    {% else %}
      // Article pages custom data variable.
      var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}


      var contentHalfTopBg = new Edicy.BgPicker($('.content-top .js-background-settings'), {
          picture: true,
          target_width: 600,
          color: true,
          showAlpha: true,

        preview: function(data) {
          site.contentHalfBgPreview(data, '.js-content-top', contentHalfTopBg);
        },

        commit: function(data) {
          site.contentHalfBgCommit(data, 'content_top_bg');
        }
      });



    {% comment %}/*Front page left content area background picker.*/{% endcomment %}
    var contentHalfLeftBg = new Edicy.BgPicker($('.content-left .js-background-settings'), {
        picture: true,
        target_width: 600,
        color: true,
        showAlpha: true,

      preview: function(data) {
        site.contentHalfBgPreview(data, '.js-content-left', contentHalfLeftBg);
      },

      commit: function(data) {
        site.contentHalfBgCommit(data, 'content_left_bg');
      }
    });

    {% comment %}/*Front page right content area background picker.*/{% endcomment %}
    var contentHalfRightBg = new Edicy.BgPicker($('.content-right .js-background-settings'), {
        picture: true,
        target_width: 600,
        color: true,
        showAlpha: true,

      preview: function(data) {
        site.contentHalfBgPreview(data, '.js-content-right', contentHalfRightBg);
      },

      commit: function(data) {
        site.contentHalfBgCommit(data, 'content_right_bg');
      }
    });

    {% comment %}/*Front page bottom content area background picker.*/{% endcomment %}
    var contentHalfBottomBg = new Edicy.BgPicker($('.content-bottom .js-background-settings'), {
        picture: false,
        target_width: 600,
        color: true,
        showAlpha: false,

      preview: function(data) {
        site.contentHalfBgPreview(data, '.js-content-bottom', contentHalfBottomBg);
      },

      commit: function(data) {
        site.contentHalfBgCommit(data, 'content_bottom_bg');
      }
    });

  </script>
{% endeditorjsblock %}
