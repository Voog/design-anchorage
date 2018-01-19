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
      site.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc | escape }}');
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
  </script>
{% endeditorjsblock %}
