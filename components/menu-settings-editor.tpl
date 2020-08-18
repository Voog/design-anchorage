{% if editmode %}
  <button class="mobile-menu-button-settings"></button>
{% endif %}

{% editorjsblock %}
  <!-- Settings popover javascript. -->
  <script
    src="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js"
  ></script>
   
  <!-- Setings popover initiation. -->
  <script>
    var siteData = new Edicy.CustomData({
      type: 'site',
    });

    {% if site.data.mobile_menu_button_settings %}
      var valuesObj = {{ site.data.mobile_menu_button_settings | json }};
    {% else %}
      var valuesObj = {};
    {% endif %};

    var mobileMenuSettingsButton = document.querySelector('.mobile-menu-button-settings');

    var SettingsEditor = new Edicy.SettingsEditor(mobileMenuSettingsButton, {
      menuItems: [
        {
          "titleI18n": "menu_positioning",
          "type": "radio",
          "key": "menu_positioning",
          "list": [
            {
              "titleI18n": "fixed_in_header",
              "value": ""
            },
            {
              "titleI18n": "always_visible",
              "value": "always-visible"
            },
            {
              "titleI18n": "visible_when_scrolling_up",
              "value": "visible-when"
            }
          ]
        },
      ],

      // Binded data object which should contain custom data object.
      values: valuesObj,

      // Style type the button.
      buttonStyle: 'default',
      // Title for the button.
      buttonTitleI18n: 'mobile_view_settings',

      commit: function(data) {
        siteData.set('mobile_menu_button_settings', data, {
        success: function() {
          window.location.reload();
          }
        });
      }
    });
  </script>
{% endeditorjsblock %}