{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    //==========================================================================
    // Sets site custom data saving fanction variable.
    //==========================================================================
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    //==========================================================================
    // Sets variables based on page type.
    //==========================================================================
    {% if front_page %}
      pageType = 'frontPage';
    {% else %}
      {% if blog_article_page %}
        pageType = 'articlePage';
      {% else %}
        pageType = 'contentPage';
      {% endif %}
    {% endif %}

    //==========================================================================
    // Initiates the language menu mode toggleing popover.
    //==========================================================================
    var valuesObj,
        pageType;

    {% if site.data.settings_language_menu %}
      valuesObj = {{ site.data.settings_language_menu | json }};
    {% else %}
      valuesObj = {};
    {% endif %};

    site.bindLanguageMenuSettings(valuesObj);


    //==========================================================================
    // Binds image drop areas.
    //==========================================================================
    $('.js-img-dropper-area').each(function(index, imgDropperArea) {
      var dataImgKey = $(imgDropperArea).data('img-key');

      var imgDropper = new Edicy.ImgDropArea($(imgDropperArea), {
        positionable: false,
        target_width: 1280,

        change: function(data) {
          var saveObj = {};
          saveObj[dataImgKey] = data || '';
          pageData.set(saveObj);
        }
      });
    });

    //==========================================================================
    // Binds bg-pickers.
    //==========================================================================
    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var bgPickerButton = $(bgPickerArea).find('.js-background-settings'),
          dataBgKey = $(bgPickerButton).data('bg-key'),
          defaultImageColor = $(bgPickerButton).data('bg-default-image-color'),
          pictureBoolean = $(bgPickerButton).data('bg-picture-boolean'),
          targetWidth = $(bgPickerButton).data('target-width');

      var bgPicker = new Edicy.BgPicker(bgPickerButton, {
            picture: pictureBoolean,
            target_width: targetWidth,
            color: true,
            showAlpha: true,

        preview: function(data) {
          site.bgPickerPreview($(bgPickerArea), data, bgPicker, defaultImageColor);
        },

        commit: function(data) {
          site.bgPickerCommit(dataBgKey, data, bgPicker, pageType);
        }
      });
    });

    //==========================================================================
    // Binds content item boxes image functionality.
    //==========================================================================
    {% if template-tools == "item_list_page" %}
      site.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc: editor_locale | escape }}');
      site.bindContentItemImageCropToggle();
    {% endif %}

    //==========================================================================
    // Binds root page settings editor (for Product list layout).
    //==========================================================================
    var rootItemValuesObj;

    {%if site.data.settings_root_item %}
      rootItemValuesObj = {{ site.data.settings_root_item | json }};
    {% else %}
      rootItemValuesObj = {};
    {% endif %};

    site.bindRootItemSettings(rootItemValuesObj);

    //==========================================================================
    // Modular content area settings
    //==========================================================================

    {% if page.data.column_settings %}
      var valuesObj = {{ page.data.column_settings | json }};
    {% else %}
      var valuesObj = {items_count: "1"};
    {% endif %};

    var settingsBtn = document.querySelector('.js-settings-btn');

    var SettingsEditor = new Edicy.SettingsEditor(settingsBtn, {
      menuItems: [
        {
          "title": "Columns count",
          "type": "select",
          "key": "items_count",
          "list": [
            {"title": "1", "value": "1"},
            {"title": "2", "value": "2"},
            {"title": "3", "value": "3"},
            {"title": "4", "value": "4"},
            {"title": "5", "value": "5"},
            {"title": "6", "value": "6"},
            {"title": "7", "value": "7"},
            {"title": "8", "value": "8"},
          ]
        },
        {
          "title": "Min item width in px",
          "type": "number",
          "min": 1,
          "key": "min_width",
          "placeholder": "Set min row item width in px"
        },
        {
          "title": "Item padding in px",
          "type": "number",
          "min": 1,
          "key": "padding",
          "placeholder": "Set item padding in px"
        }
      ],

      values: valuesObj,

      commit: function(data) {
        pageData.set('column_settings', data, {
          success: function() {
            // reloading is necessary to rerender the content areas
            window.location.reload();
          }
        });
      }
    });
    document.querySelector('.js-settings-btn').removeAttribute('disabled');
  </script>
{% endeditorjsblock %}
