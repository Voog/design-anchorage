;(function($) {
  //============================================================================
  // Helper function to detect if page viewer is in editmode.
  //============================================================================
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  // Function to limit the rate at which a function can fire.
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };


  $('.js-cart-btn').click(function () {
    if ($(this).data('product-id')) {
      Voog.ShoppingCart.addProductById($(this).data('product-id'))
    }
  });

  $('.mobile-menu-toggler').click(function(event) {
      event.preventDefault();
      $('html').toggleClass('mobilemenu-open');
      $('html').removeClass('menu-language-popover-open');
      $('body').removeClass('mobilesearch-open');
      $('#mobile-menu').removeClass('reset-touch').addClass('reset-touch');
  });

  $('.tags-toggle').click(function() {
    $(this).find('.ico-arrow').toggleClass('active');
    $('.tags-bottom').toggleClass('visible');
  });

  $('.js-toggle-sub-menu').click(function() {
    // TODO: Remove this hack if iOS Safari rendering issue is fixed.
    $('#mobile-menu').removeClass('reset-touch').addClass('reset-touch');
    $(this).toggleClass('active');
    $(this).parent('li').toggleClass('current-parent');
  });

  $('.mobile-menu-close').on('click', function() {
    event.preventDefault();

    if ($('html').hasClass('menu-language-popover-open')) {
      $('html').removeClass('menu-language-popover-open');
    } else {
      $('html').removeClass('mobilemenu-open');
    }
  });


  $('.js-lang-menu-btn').on('click', function() {
    $('html').removeClass('search-open');
    $('.js-search').removeClass('active');

    if ($('html').hasClass('menu-language-popover-open')) {
      $('html').removeClass('menu-language-popover-open');
    } else {
      bindLanguageMenuPositioning($(this));

      $('html').addClass('menu-language-popover-open');
    }
  });

  var bindLanguageMenuPositioning = function(currentButton) {
    var offsetItem = $('html').hasClass('language-flags-disabled') ? currentButton.find('.js-lang-title-inner') : currentButton,
        rightOffsetHelper = $('html').hasClass('language-flags-disabled') ? 5 : 9;
    if (offsetItem.length > 0) {
      $('.js-popup-menu-popover').css({
        top: offsetItem.offset().top + offsetItem.outerHeight() - $('.site-container').offset().top,
        right: $(window).width() - offsetItem.offset().left - offsetItem.outerWidth() - rightOffsetHelper
      });
    }
  };

  // ===========================================================================
  // Toggles language menu mode.
  // ===========================================================================
  var bindLanguageMenuSettings = function(valuesObj) {
    if (!('type' in valuesObj)) {
      valuesObj.type = 'popover';
    }

    if (!('item_state' in valuesObj)) {
      valuesObj.item_state = 'flags_and_names';
    }

    var langSettingsEditor = new Edicy.SettingsEditor($('.js-menu-language-settings-toggle').get(0), {
      menuItems: [
        {
          "titleI18n": "format_desktop_only",
          "type": "radio",
          "key": "type",
          "list": [
            {
              "titleI18n": "dropdown_menu",
              "value": "popover"
            },
            {
              "titleI18n": "expanded_menu",
              "value": "list"
            },
          ]
        },
        {
          "titleI18n": "show",
          "type": "radio",
          "key": "item_state",
          "list": [
            {
              "titleI18n": "flags_only",
              "value": "flags_only"
            },
            {
              "titleI18n": "names_only",
              "value": "names_only"
            },
            {
              "titleI18n": "flags_and_names",
              "value": "flags_and_names"
            }
          ]
        }
      ],

      buttonTitleI18n: "settings",

      values: valuesObj,

      containerClass: ['js-menu-language-settings-popover', 'js-prevent-sideclick'],

      preview: function(data) {
        var $html = $('html'),
            $languageSettingsMenuElement = $('.js-menu-language-settings');

        if (data.type === 'list') {
          $html.removeClass('language-menu-mode-popover');
          $html.removeClass('menu-language-popover-open');
          $html.addClass('language-menu-mode-list');
        } else {
          $html.removeClass('language-menu-mode-list');
          $html.addClass('language-menu-mode-popover');
          $html.addClass('menu-language-popover-open');
        }

        if (data.item_state === 'flags_only') {
          $html.removeClass('language-flags-disabled');
          $html.removeClass('language-names-enabled');
          $html.addClass('language-flags-enabled');
          $html.addClass('language-names-disabled');
        } else if (data.item_state === 'names_only') {
          $html.removeClass('language-flags-enabled');
          $html.removeClass('language-names-disabled');
          $html.addClass('language-flags-disabled');
          $html.addClass('language-names-enabled');
        } else if (data.item_state === 'flags_and_names') {
          $html.removeClass('language-flags-disabled');
          $html.removeClass('language-names-disabled');
          $html.addClass('language-flags-enabled');
          $html.addClass('language-names-enabled');
        }

        toggleLanguageSettingsLocation();
        this.setPosition();
      },

      commit: function(data) {
        siteData.set('settings_language_menu', data);
      }
    });

    toggleLanguageSettingsLocation();
  };

  var toggleLanguageSettingsLocation = function() {
    var $html = $('html'),
        $languageSettingsMenuElement = $('.js-menu-language-settings');

    if ($(window).width() <= 1024 && $languageSettingsMenuElement.closest('.js-menu-main-mobile').length === 0) {
      $languageSettingsMenuElement.appendTo('.js-menu-main-mobile');
    } else if ($(window).width() > 1024 && $languageSettingsMenuElement.closest('.js-menu-main-desktop').length === 0) {
      if ($html.hasClass('language-menu-mode-list')) {
        $languageSettingsMenuElement.appendTo('.js-menu-language-list-setting-parent');
        bindLanguageMenuPositioning($('.js-lang-menu-btn'));
      } else {
        $languageSettingsMenuElement.appendTo('.js-menu-language-popover-setting-parent');
        bindLanguageMenuPositioning($('.js-lang-menu-btn'));
      }
    }
  };

  var bindFallbackHeaderLeftWidthCalculation = function() {
    var headerWidth = $('.js-header-top-wrap').width(),
        headerRight = $('.js-header-right'),
        headerRightWidth = headerRight.width(),
        headerRightMargin = parseInt(headerRight.css('margin-left')) + 1;

    $('.js-header-left').css('min-width', headerWidth - headerRightWidth - headerRightMargin);
  };

  // Returns the suitable version of the image depending on the viewport width.
  var getImageByWidth = function(sizes, targetWidth) {
    var prevImage;

    for (var i = 0, max = sizes.length; i < max; i++) {
      if (sizes[i].width < targetWidth) {
        return prevImage || sizes[i];
      }
      prevImage = sizes[i];
    }
    // Makes sure that smallest is returned if all images bigger than targetWidth.
    return sizes[sizes.length - 1];
  };

  var bgPickerImageSizesContains = function(sizes, url) {
    for (var i = sizes.length; i--;) {
      if (url.indexOf(sizes[i].url.trim()) > -1) {
        return true;
      }
    }
    return false;
  };

  // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
  var bgPickerContentLightnessClass = function(bgPickerArea, combinedLightness) {
    if (combinedLightness > 0.6) {
      $(bgPickerArea).find('.js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $(bgPickerArea).find('.js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Header background image and color preview logic function.
  var bgPickerPreview = function(bgPickerArea, data, bgPicker, defaultImageColor) {
    // Defines the variables used in preview logic.

    var bgPickerImagePrevious = $(bgPickerArea).find('.js-background-image').css('background-image'),
        bgPickerImageSuitable = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : null,
        bgPickerImage = (data.image && data.image !== '') ? 'url(' + bgPickerImageSuitable.url + ')' : 'none',
        bgPickerImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        bgPickerColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        bgPickerColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (bgPickerImageSizesContains(bgPickerImageSizes, bgPickerImagePrevious)) {
        bgPicker.imageColor = bgPicker.imageColor ? bgPicker.imageColor : defaultImageColor;
        bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
        bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);

      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.on('load', function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            bgPicker.imageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
            bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);

          });
        });
      };
    } else {
      bgPicker.imageColor = 'rgba(255,255,255,1)';
      bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
      bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);

    };

    // Updates the bgPickerContent background image and background color.
    if (pageType === 'articlePage' && bgPickerArea.hasClass('site-header')) {
      $('#preview-style').html('.photo-article.site-header .js-background-image { background-image: ' + bgPickerImage + ' } .photo-article.site-header .js-background-color { background-color: ' + bgPickerColor + ' }');
    } else {
      $(bgPickerArea).find('.js-background-image').css({'background-image' : bgPickerImage});
      $(bgPickerArea).find('.js-background-color').css({'background-color' : bgPickerColor});
    }
  };

  var normalizeValue = function(value) {
    if (value == null || (typeof value == 'string' && value.match(/^[\\'"]+$/))) {
      return '';
    } else {
      return value;
    }
  };

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataBgKey, data, bgPicker, pageType) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = normalizeValue(data.imageSizes);
    commitData.color = data.color || '';
    commitData.combinedLightness = bgPicker.combinedLightness;

    if (pageType === 'articlePage') {
      if (dataBgKey == 'footer_bg') {
        siteData.set(dataBgKey, commitData);
      } else {
        Edicy.articles.currentArticle.setData(dataBgKey, commitData);
      }
    } else {
      if (pageType === 'contentPage' && (dataBgKey === 'footer_bg') || (dataBgKey === 'body_bg')) {
        siteData.set(dataBgKey, commitData);
      } else {
        pageData.set(dataBgKey, commitData);
      }
    }
  };

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var bgPickerColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
  };

  var setImageOrientation = function($contentItemBox, width, height) {
    var $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
        $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');

    if (width > height) {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-landscape')
      ;
    } else if (width === height) {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-square')
      ;
    } else {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-portrait')
      ;
    }

    if ($imgDropAreaTarget.hasClass('image-square')) {
      $cropToggleButton
        .removeClass('is-visible')
        .addClass('is-hidden')
      ;
    } else {
      $cropToggleButton
        .removeClass('is-hidden')
        .addClass('is-visible')
      ;
    }
  };

  var setItemImage = function($contentItemBox, $imgDropArea, itemId, imageId, itemType) {
    var apiType = itemType === 'article' ? 'articles' : 'pages',
        itemData = new Edicy.CustomData({
          type: itemType,
          id: itemId
        });

    $.ajax({
       type: 'PATCH',
       contentType: 'application/json',
       url: '/admin/api/' + apiType +'/' + itemId,
       data: JSON.stringify({'image_id': imageId}),
       dataType: 'json',
       success: function(data) {
         itemData.set('image_crop_state', 'not-cropped');
         $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
         $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 1);
         $imgDropArea.css('opacity', 1);
       },
       timeout: 30000,
       error: function(data) {
         $contentItemBox.removeClass('not-loaded is-loaded with-error').addClass('with-error');
       }
    });
  };

  // ===========================================================================
  // Binds editmode image drop areas.
  // ===========================================================================
  var bindContentItemImgDropAreas = function(placeholderText) {
    $('.js-content-item-img-drop-area').each(function(index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
          $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 1280,
        placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',
        removeBtn: '<div class="edy-img-drop-area-remove-image">' +
                      '<div class="edy-img-drop-area-remove-image-ico">' +
                        '<svg width="16" height="20" viewBox="0 0 26 30" xmlns="http://www.w3.org/2000/svg">' +
                          '<g fill-rule="nonzero" fill="currentColor">' +
                            '<g transform="translate(2 5)">' +
                              '<path d="M0 .997h2V21c0 1 1 2 2 2h14c1 0 2-1 2-2V1h2v20c0 2.25-1.75 4-4 4H4c-2.25 0-4-1.75-4-4V.997z"/>' +
                              '<rect x="10" y="4" width="2" height="16" rx="1"/>' +
                              '<rect x="5" y="4" width="2" height="16" rx="1"/>' +
                              '<rect x="15" y="4" width="2" height="16" rx="1"/>' +
                            '</g>' +
                            '<path d="M26 4v2H0V4h7V2c0-1 1-2 2-2h8c1 0 2 1 2 2v2h7zM9 4h8V3c0-.5-.5-1-1-1h-6c-.5 0-1 .5-1 1v1z"/>' +
                          '</g>' +
                        '</svg>' +
                      '</div>' +
                    '</div>',

        change: function(data) {
          var imageId;

          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
            .css('opacity', .1)
          ;

          if (data) {
            imageId = data.original_id;

            $contentItemBox
              .removeClass('without-image is-loaded with-error')
              .addClass('with-image not-loaded')
            ;

            setImageOrientation($contentItemBox, data.width, data.height);
          } else {
            imageId = null;

            $contentItemBox
              .removeClass('with-image is-loaded with-error')
              .addClass('without-image not-loaded')
            ;

            $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 0);
          }

          setItemImage($contentItemBox, $imgDropAreaTarget, itemId, imageId, itemType);
        }
      });
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindContentItemImageCropToggle = function() {
    $('.js-toggle-crop-state').on('click', function() {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
          $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          }),
          imageCropState;

      if ($imgDropAreaTarget.hasClass('is-cropped')) {
        $imgDropAreaTarget
          .removeClass('is-cropped')
          .addClass('not-cropped')
        ;

        imageCropState = 'not-cropped';
      } else {
        $imgDropAreaTarget
          .removeClass('not-cropped')
          .addClass('is-cropped')
        ;

        imageCropState = 'is-cropped';
      }

      itemData.set('image_crop_state', imageCropState);
    });
  };

  // ===========================================================================
  // Load article cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var bindContentItemImageLazyload = function() {
    $(document).ready(function() {
      setTimeout(function() {
        $('.js-content-item-box').addClass('not-loaded');
      }, 3000);
    });

    $('.js-lazyload').lazyload({
      threshold : 500,
      effect : "fadeIn",
      placeholder: 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',

      load: function() {
        var $contentItemBox = $(this).closest('.js-content-item-box');

        $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');

        setTimeout(function() {
          $contentItemBox.removeClass('not-loaded with-error');
          $contentItemBox.find('.js-loader').remove();
        }, 3000);
      }
    });
  };

  // Shows/hides the popover main menu (visible on smalles screens).
  var handleElementsClick = function() {
    $('.site-container').on('mousedown', function(event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {

        if ($('.js-btn').hasClass('open')) {
          $('.js-btn').removeClass('open');
        }

        if ($('.js-popover').hasClass('expanded')) {
          $('.js-popover').removeClass('expanded');
        }

        if ($('.js-search').hasClass('active')) {
          $('.js-search').removeClass('active');
          $('.search-btn').removeClass('open');
        }

        if ($('html').hasClass('mobilemenu-open')) {
          $('.mobile-menu-toggler').trigger('click');
        }

        if ($('html').hasClass('menu-language-popover-open')) {
          $('html').removeClass('menu-language-popover-open');
        }

        if ($('html').hasClass('comments-open')) {
          $('html').removeClass('comments-open');
          $('.js-comments-toggle-btn, .js-comments').removeClass('open');
        }

        if ($('html').hasClass('search-open')) {
          $('html').removeClass('search-open');
        }

        handleCommentsToggleing();
      }
    });

    // Toggles the popover main menu (visible on smalles screens).
    $('.js-menu-btn').click(function() {
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');
    });

    // Toggles the popover language menu.
    $('.js-menu-lang-btn').click(function() {
      $('.js-menu-lang-btn').toggleClass('open');
      $('.js-menu-lang').toggleClass('expanded');
    });

    $('.js-tags-btn').click(function() {
      $(this).toggleClass('open');
      $('.js-menu-tags').toggleClass('expanded');
    });

    // Toggles the search modal.
    $('.js-search-toggle-btn').click(function() {
      $('html').removeClass('mobilemenu-open');
      $('html').removeClass('menu-language-popover-open');
      $('.js-search').toggleClass('active');
      $('.js-search').hasClass('active') ? $('.js-search-input').focus() : '';
      $('html').toggleClass('search-open');
    });

    $('.js-search-input').on('input', function() {
      var searchCleanBtn = $(this).parent().next();

      if ($(this).val().length > 1) {
        searchCleanBtn.addClass('active');
      } else {
        searchCleanBtn.removeClass('active');
      }

      handleMobileSearchHeight();
    });

    $('.js-search-reset-btn').click(function() {
      $('html').removeClass('search-open');
      $('.js-search').removeClass('active');
    });

    // Opens the comments modal.
    $('.js-comments-toggle-btn').click(function() {
      $(this).toggleClass('open');
      $('.js-comments').toggleClass('open');
      $('html').toggleClass('comments-open');
      $('.js-comments-input').val('').focus();


      if ($(window).width() > 640) {
        handleCommentsToggleing();
      };
    });

    // Submenu lvl1 load more on mobile.
    $('.submenu-load-more-lvl1').click(function() {
      $(this).addClass('open');
      $(this).next().addClass('open');
      $(this).next().next().addClass('open');
    });

    $('.submenu-close-lvl1').click(function() {
      $(this).removeClass('open');
      $(this).prev().removeClass('open');
      $(this).next().removeClass('open');
    });

    // Submenu lvl2 load more on mobile.
    $('.submenu-load-more-lvl2').click(function() {
      $(this).addClass('open');
      $(this).next().addClass('open');
      $(this).next().next().addClass('open');
    });

    $('.submenu-close-lvl2').click(function() {
      $(this).removeClass('open');
      $(this).prev().removeClass('open');
      $(this).next().removeClass('open');
    });

    $('.js-type-btn').click(function() {
      toggleArticleType($(this));
    });

    $('.publicmode .js-slide-to-article').click(function() {
      $('html, body').animate({
        scrollTop: $('.page-content').offset().top
      }, 300);
    });
  };

  var handleCommentsToggleing = function() {
    var mainContent = $('.main-content');

    if ($('html').hasClass('comments-open')) {
      var documentHeight = $(document).outerHeight(),
          headerHeight = $('.js-site-header').outerHeight(),
          articleComments = $('.article-comments'),
          articleCommentsHeight = articleComments.outerHeight(),
          siteFooterHeight = $('.site-footer').outerHeight();

      articleComments.css('min-height', documentHeight - headerHeight);
      mainContent.css('min-height', articleCommentsHeight - siteFooterHeight);

      $('html, body').animate({
          scrollTop: $('.js-comments').offset().top
      }, 300);
    } else {
      mainContent.removeAttr('style');
    }
  };

  // Sets the search modal height.
  var handleSearchModalHeight = function() {
    var windowWidth = $(window).width();
        windowHeight = $(window).height(),
        searchModal = $('.js-voog-search-modal');

        if (windowWidth >= 1400 ) {
          searchModalHeight = windowHeight - 190;
        }
        else {
          searchModalHeight = windowHeight - 171;
        }

    searchModal.css({'max-height': searchModalHeight});
  };

  // Sets search modal height on search submit.
  var handleSearchSubmit = function() {
    $('.js-search-form').on('submit', function() {
      handleSearchModalHeight();
    });
  };

  // Set article comments section the height of the document minus the header section
  var commentsHeight = function() {
    $('.article-comments').removeAttr('style');
    var documentHeight = $(document).height(),
        siteHeight = $('.site-container').height(),
        commentsHeight = $('.article-comments').height(),
        commentsPadTop = parseInt($('.article-comments').css('padding-top')),
        commentsPadBottom = parseInt($('.article-comments').css('padding-bottom')),
        mainHeight = $('.page-content').height(),
        headerHeight = $('.site-header').height(),
        footerHeight = $('.site-footer').height(),
        commentsTarget = (mainHeight + headerHeight + footerHeight) - headerHeight - commentsPadTop - commentsPadBottom;

    if ($(window).width() > 480) {
      $('.article-comments').css('min-height', commentsTarget);
    }
  };

  /*var autoSizeFormCommentArea = function() {
    $('.comment-form .form_field_textarea').textareaAutoSize();
  };*/

  // Initiations
  var initWindowResize = function() {
    $(window).resize(debounce(function() {
      commentsHeight();
      handleMobileSearchHeight();
      toggleLanguageSettingsLocation();

      $('.js-menu-language-settings-popover').hide();
    }, 100));

    $(window).resize(debounce(function() {
      $('html').removeClass('menu-language-popover-open');
      $('.js-menu-language-settings-popover').hide();
      $('.js-menu-language-settings-toggle').removeClass('edy-cbtn-active');
    }, 25));
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  var tableWrapper = function() {
    $('body:not(.editmode) table').each(function() {
      $(this).wrap('<div class="table-holder" />');
    });
  };

  var toggleArticleType = function(currentButton) {
    $('.js-type-btn').removeClass('is-active');
    currentButton.addClass('is-active');

    if (currentButton.data('article-type') == 'photo-article') {
      $('.js-article-title').prependTo('.js-article-header-title-wrap');

      $('.js-text-article-component').addClass('is-hidden');
      $('.js-photo-article-component').removeClass('is-hidden');

      $('.js-site-header').addClass('photo-article');
      $('.js-site-header .js-background-settings').removeClass('is-hidden');

      var headerBgType = $('.js-site-header .js-background-type').data('article-bg-type');
      $('.js-site-header .js-background-type').removeClass('dark-background light-background').addClass(headerBgType);

      Edicy.articles.currentArticle.setData('photo_article_state', true);
    } else {
      $('.js-article-title').prependTo('.js-article-body-title-wrap');

      $('.js-photo-article-component').addClass('is-hidden');
      $('.js-text-article-component').removeClass('is-hidden');

      $('.js-site-header').removeClass('photo-article')
      $('.js-site-header .js-background-settings').addClass('is-hidden');

      var headerBgType = $('.js-site-header .js-background-type').data('blog-bg-type');
      $('.js-site-header .js-background-type').removeClass('dark-background light-background').addClass(headerBgType);

      Edicy.articles.currentArticle.setData('photo_article_state', false);
    }
  };

  var handleMobileSearchHeight = function() {
    if ($(window).width() <= 640) {
      $('.js-voog-search-modal').css('max-height', $(window).height() - 56);
    } else {
      $('.js-voog-search-modal').css('max-height', 'auto');
    }
  };

  // ===========================================================================
  // Change product image position on narrower screens (mobile devices)
  // ===========================================================================

  var handleProductPageContent = function () {
    $(document).ready(function () {
      changeProductImagePos();
    });

    $(window).resize(debounce(function () {
      changeProductImagePos();
    }, 25));

    var changeProductImagePos = function () {
      var productGallery = $('.js-product-gallery');
      var productImageContentBox = $('.js-content-item-box');
      var productContentRight = $('.js-product-content-right');

      if ($('.js-buy-btn-content .edy-buy-button-container').length >= 1) {
        if ($(window).width() < 640) {
          if ($('.js-buy-btn-content + .js-product-gallery').length === 0) {
            productContentRight.append(productGallery);
          }
        } else {
          if ($('.js-content-item-box + .js-product-gallery').length === 0) {
            productImageContentBox.parent().append(productGallery);
          }
        }
      }
    }
  };

  // ===========================================================================
  // Toggles product categories visibility in main menu.
  // ===========================================================================
  var bindRootItemSettings = function(rootItemValuesObj) {
    if (!('show_product_related_pages_in_main_menu' in rootItemValuesObj)) {
      rootItemValuesObj.show_product_related_pages_in_main_menu = false;
    }

    $('.js-root-item-settings-toggle').each(function(index, languageMenuSettingsButton) {
      var rootItemSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
        menuItems: [
          {
            "titleI18n": "show_in_main_menu",
            "type": "checkbox",
            "key": "show_product_related_pages_in_main_menu",
            "states": {
              "on": true,
              "off": false
            }
          }
        ],

        buttonTitleI18n: "settings",

        values: rootItemValuesObj,

        containerClass: ['js-root-item-settings-popover', 'js-prevent-sideclick'],

        preview: function(data) {
          if (!data.show_product_related_pages_in_main_menu === true) {
            $('.js-menu-item-products').addClass('is-hidden');
          } else {
            $('.js-menu-item-products').removeClass('is-hidden');
          }
        },

        commit: function(data) {
          siteData.set('settings_root_item', data);
        }
      });
    });
  };

  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
  };

  var initArticlePage = function() {
    // Add single post layout specific functions here.
    commentsHeight();

    if ($('html').hasClass('js-calculate-comments-height')) {
      handleCommentsToggleing();
    };
  };

  var initCommonPage = function() {
    // Add common page layout specific functions here.
  };

  var initFrontPage = function() {
    // Add front page layout specific functions here.
  };

  // ===========================================================================
  // Sets functions that will be initiated on items list layouts.
  // ===========================================================================
  var initItemsPage = function() {
    if (!editmode()) {
      bindContentItemImageLazyload();
    }
  };

  // ===========================================================================
  // Detects design editor changes.
  // ===========================================================================
  var detectDesignEditorChanges = function() {
    document.addEventListener('edicy:customstyles:change', function(event) {
			if (Object.keys(event.detail.changes).indexOf('--header-background-color') > -1) {
        var headerBGcolor = event.detail.changes['--header-background-color'].value,
          headerTop = $('.header-top');

				if (headerBGcolor === undefined) {
          $('body').removeClass('header-top-with-bg');
          siteData.set({
            "header_top_lightness": null,
            "has_header_bg_color": null
          });

          if (headerTop.hasClass('dark-background')) {
            headerTop.removeClass('dark-background');
          } else {
            headerTop.removeClass('light-background');
          }
				}
				else {
          $('body').addClass('header-top-with-bg');
          bindHeaderTopSettings(headerBGcolor)
        }

			}
    });
  };

  var headerTopColorSum = function(fgColor) {
    if (typeof fgColor == 'string') {
      fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
      $.each(fgColor, function(n, x) {fgColor[n] = +x;});
    }
    if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
      if (fgColor.length == 3) { fgColor.push(1.0); }
    }
    var result = [0, 0, 0, 0];
    result[3] = 1 - (1 - fgColor[3]);
    if (result[3] === 0) { result[3] = 1e-6; }
    result[0] = Math.min(fgColor[0] * fgColor[3] / result[3]);
    result[1] = Math.min(fgColor[1] * fgColor[3] / result[3]);
    result[2] = Math.min(fgColor[2] * fgColor[3] / result[3]);
    return $.map(result, function(e) { return Math.floor(e); });
  };

  var getHeaderTopCombinedColor = function(fgColor) {
    var sum = headerTopColorSum(fgColor || [255,255,255,1]);
    return sum;
  };

  var getHeaderTopLightness = function(fgColor) {
    var combinedBgColor = getHeaderTopCombinedColor(fgColor);
    var color = Math.round(((+combinedBgColor[0]) * 0.2126 + (+combinedBgColor[1]) * 0.7152 + (+combinedBgColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  // Checks the lightness sum of header top color and sets the lightness class depending on it's value.
  var bindHeaderTopSettings = function(headerTopColor) {
    headerTopLightness = getHeaderTopLightness(headerTopColor);
    if (headerTopLightness > 0.6) {
      $('.header-top').addClass('light-background').removeClass('dark-background');
    } else {
      $('.header-top').addClass('dark-background').removeClass('light-background');
    }

    siteData.set({
        "header_top_lightness": headerTopLightness,
        "has_header_bg_color": true
      },
      {
        success: function(data) {}
      }
    );
  };

  // Opens product admin view on product image click

  var handleProductImageClick = function(product_id) {
    if (editmode()) {
      $('.product-content .product-image').click(function() {
        window.open('/admin/ecommerce/products/' + product_id, '_blank').focus();
      });
    }
  };

  var init = function() {
    // Add site wide functions here.
    handleElementsClick();
    tableWrapper();
    focusFormWithErrors();
    //autoSizeFormCommentArea();
    detectDesignEditorChanges();

    if (!Modernizr.flexbox && editmode()) {
      bindFallbackHeaderLeftWidthCalculation();
    }

  };

  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function(searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        resultsContainer: $('.js-voog-search-modal').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint.
        mobileModeWidth: 640,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    }
  };

  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    bgPickerPreview: bgPickerPreview,
    bgPickerCommit: bgPickerCommit,
    bgPickerColorScheme: bgPickerColorScheme,
    initWindowResize: initWindowResize,
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    initFrontPage: initFrontPage,
    bindLanguageMenuSettings: bindLanguageMenuSettings,
    initItemsPage: initItemsPage,
    bindContentItemImgDropAreas: bindContentItemImgDropAreas,
    bindContentItemImageCropToggle: bindContentItemImageCropToggle,
    bindRootItemSettings: bindRootItemSettings,
    bindSiteSearch: bindSiteSearch,
    handleProductPageContent: handleProductPageContent,
    handleProductImageClick: handleProductImageClick
  });

  init();
})(jQuery);
