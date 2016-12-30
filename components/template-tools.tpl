{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    // Initiates language flag toggleing functionality.
    site.toggleFlags();

    {% if blog_article_page %}
      var pageType = 'articlePage';

      siteData = new Edicy.CustomData({
        type: 'site'
      });
    {% elsif front_page %}
      var pageType = 'frontPage',

      pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% else %}
      var pageType = 'contentPage',

      siteData = new Edicy.CustomData({
        type: 'site'
      });

      pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

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

    {% if template-tools == "item_list_page" %}
      site.bindContentItemBgPickers();
      site.bindContentItemImgDropAreas();
      site.bindContentItemImageCropToggle();
    {% endif %}

    {%if site.data.settings_root_item %}
      rootItemValuesObj = {{ site.data.settings_root_item | json }};
    {% else %}
      rootItemValuesObj = {};
    {% endif %};

    if (!('hide_product_related_pages_from_main_menu' in rootItemValuesObj)) {
      rootItemValuesObj.hide_product_related_pages_from_main_menu = true;
    }

    site.bindRootItemSettings(rootItemValuesObj);
  </script>
{% endeditorjsblock %}
