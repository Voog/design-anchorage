:root {
  /* VoogStyle
    "pathI18n": ["custom_styles.form"],
    "titleI18n": "custom_styles.background_color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --global-form-background-color: transparent;
  /* VoogStyle
     "pathI18n": ["custom_styles.form"],
     "titleI18n": "custom_styles.padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 100,
     "unit": "px",
     "scope": "global"
  */
  --global-form-padding: 0;
  /* VoogStyle
     "pathI18n": ["custom_styles.form"],
     "titleI18n": "custom_styles.field_border_thickness",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --global-form-field-border-width: 0;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --global-form-field-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --global-form-field-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --global-form-field-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --global-form-field-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --global-form-field-text-transform: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.normal"],
    "titleI18n": "custom_styles.padding",
    "editor": "rangePicker",
    "min": 0,
    "max": 200,
    "step": 1,
    "unit": "px",
    "scope": "global"
  */
  --global-form-button-padding: 20px;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.normal"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "featured": true,
    "scope": "global",
    "boundVariables": [
      "--global-form-button-hover-font-size"
    ]
  */
  --global-form-button-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.hover"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --global-form-button-hover-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.normal"],
    "titleI18n": "custom_styles.font_size",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--global-form-button-hover-font-weight"
    ]
  */
  --global-form-button-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.hover"],
    "titleI18n": "custom_styles.font_size",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --global-form-button-hover-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.normal"],
    "titleI18n": "custom_styles.font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--global-form-button-hover-font-style"
    ]
  */
  --global-form-button-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.hover"],
    "titleI18n": "custom_styles.font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --global-form-button-hover-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.normal"],
    "titleI18n": "custom_styles.text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--global-form-button-hover-text-decoration"
    ]
  */
  --global-form-button-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.hover"],
    "titleI18n": "custom_styles.text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --global-form-button-hover-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.normal"],
    "titleI18n": "custom_styles.text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--global-form-button-hover-text-transform"
    ]
  */
  --global-form-button-text-transform: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.button", "custom_styles.hover"],
    "titleI18n": "custom_styles.text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --global-form-button-hover-text-transform: none;
}