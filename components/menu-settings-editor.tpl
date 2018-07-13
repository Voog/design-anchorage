{% if editmode %}
  <button class="menu-positon-settings"></button>
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
      id: {{ site.id }}
    });

    {% if site.data.menu_position_settings %}
      var valuesObj = {{ site.data.menu_position_settings | json }};
    {% else %}
      var valuesObj = {};
    {% endif %};

    var productDescrptionBtn = document.querySelector('.menu-positon-settings');

    var SettingsEditor = new Edicy.SettingsEditor(productDescrptionBtn, {
      menuItems: [
        {
          "title": "Menu positioning",
          "type": "radio",
          "key": "menu_positioning",
          "list": [
            {
              "title": "Fixed in header",
              "value": ""
            },
            {
              "title": "Fixed & visible when scrolling up",
              "value": "visible-when"
            },
            {
              "title": "Fixed & always visible",
              "value": "always-visible"
            },
          ],

        },
      ],

      // Binded data object which should contain custom data object.
      values: valuesObj,

      // Style type the button.
      buttonStyle: 'default',
      // Title for the button.
      buttonTitle: 'menu settings',
      // Class for the button while Settings Editor is visible.
      buttonActiveClass: 'settings-popover-open',

      commit: function(data) {
        siteData.set('menu_position_settings', data);
      }
    });
  </script>
{% endeditorjsblock %}