{% if editmode %}
<div class="article-settings-wrap">
  <button class="article-settings-editor"></button>
</div>
{% endif %}

{% editorjsblock %}
  <!-- Settings popover javascript. -->
  <script
    src="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js"
  ></script>

  <!-- Setings popover initiation. -->
  <script>
    var articleData = new Edicy.CustomData({
      type: 'article',
      id: {{ article.id }}
    });

    {% if article.data.article_settings %}
      var articleDataValues = {{ article.data.article_settings | json }};
    {% else %}
      var articleDataValues = {}
    {% endif %};

    {% if site.data.article_settings %}
      var globalDataValues = {{ site.data.article_settings | json }};
    {% else %}
       var globalDataValues = {}
    {% endif %};

    var show_comments, show_date, show_author;

    if (articleDataValues.show_comments !==  null && articleDataValues.show_comments !==  '') {
      show_comments = Boolean(articleDataValues.show_comments)
    } else if (globalDataValues.show_comments !==  null && globalDataValues.show_comments !==  '') {
      show_comments = Boolean(globalDataValues.show_comments)
    } else {
      show_comments = true;
    }

    if (articleDataValues.show_date !==  null && articleDataValues.show_date !==  '') {
      show_date = Boolean(articleDataValues.show_date)
    } else if (globalDataValues.show_dates !==  null && globalDataValues.show_dates !==  '') {
      show_date = Boolean(globalDataValues.show_dates)
    } else {
      show_date = true;
    }

    if (articleDataValues.show_author !==  null && articleDataValues.show_author !==  '') {
      show_author = Boolean(articleDataValues.show_author)
    } else if (globalDataValues.show_authors !==  null && globalDataValues.show_authors !==  '') {
      show_author = Boolean(globalDataValues.show_authors)
    } else {
      show_author = true;
    }

    var valuesObj = {
      show_comments: show_comments,
      show_date: show_date,
      show_author: show_author
    }
    var articleSettingsButton = document.querySelector('.article-settings-editor');

    var SettingsEditor = new Edicy.SettingsEditor(articleSettingsButton, {
      menuItems: [
       {
          "titleI18n": "comments",
          "type": "toggle",
          "key": "show_comments",
          "tooltipI18n": "toggle_current_article_comments",
          "states": {
            "on": true,
            "off": false
          },
        },
        {
          "titleI18n": "publishing_date",
          "type": "toggle",
          "key": "show_date",
          "tooltipI18n": "toggle_current_article_date",
          "states": {
            "on": true,
            "off": false
          },
        },
        {
          "titleI18n": "article_author",
          "type": "toggle",
          "key": "show_author",
          "tooltipI18n": "toggle_all_authors",
          "states": {
            "on": true,
            "off": false
          },
        },
      ],

      // Binded data object which should contain custom data object.
      values: valuesObj,

       // Style type the button.
      buttonStyle: 'default',
      // Title for the button.
      buttonTitleI18n: "article_settings",

      preview: function(data) {
       var $articleComment = $('.comments-title'),
        $articleDate = $('.article-date'),
        $articleAuthor = $('.article-author'),
        $dateSeparator = $('.date-separator');

        if (data.show_date == true) {
          $articleDate.removeClass('hide-article-date');
          $articleDate.addClass('show-article-date');
        } else if (data.show_date == false) {
          $articleDate.removeClass('show-article-date');
          $articleDate.addClass('hide-article-date');
        }

        if (data.show_author == true) {
          $articleAuthor.removeClass('hide-article-author');
          $articleAuthor.addClass('show-article-author');
          $dateSeparator.removeClass('hide-separator');
        } else if (data.show_author == false) {
          $articleAuthor.removeClass('show-article-author');
          $articleAuthor.addClass('hide-article-author');
          $dateSeparator.addClass('hide-separator');
        }

        if (data.show_comments == true) {
          $articleComment.removeClass('hide-article-comments');
          $articleComment.addClass('show-article-comments');
        } else if (data.show_comments == false) {
          $articleComment.removeClass('show-article-comments');
          $articleComment.addClass('hide-article-comments');
        }
      },

      commit: function(data) {
        articleData.set('article_settings', data);
      }
    });
  </script>
{% endeditorjsblock %}