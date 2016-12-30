;(function($) {
  // Global variable to detect if page is in editmode.
  var editmode = $('html').hasClass('editmode'),
      articlePage = $('body').hasClass('blog-article-page');

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


  $('.mobile-menu-toggler').click(function(event) {
      event.preventDefault();
      $('html').toggleClass('mobilemenu-open');
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

    if ($('body').hasClass('lang-menu-open')) {
      $('body').removeClass('lang-menu-open');
    } else {
      $('html').removeClass('mobilemenu-open');
    }
  });


  $('.js-lang-menu-btn').on('click', function() {
    if ($('body').hasClass('lang-menu-open')) {
      $('body').removeClass('lang-menu-open');
    } else {
      bindLanguageMenuPositioning($(this));

      $('body').addClass('lang-menu-open');
    }
  });

  var bindLanguageMenuPositioning = function(currentButton) {
    var offsetItem = currentButton.parent().hasClass('flags-disabled') ? currentButton.find('.js-lang-title-inner') : currentButton,
        rightOffsetHelper = currentButton.parent().hasClass('flags-disabled') ? 5 : 9;

    $('.js-popup-menu-popover').css({
      top: offsetItem.offset().top + offsetItem.outerHeight() + 4,
      right: $(window).width() - offsetItem.offset().left - offsetItem.outerWidth() - rightOffsetHelper
    });
  };

  var toggleFlags = function() {
    $('.js-option-toggle-flags').on('click', function() {
      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      $(this).toggleClass('js-flag-disable-btn');
      $('.js-menu-lang-wrap, .js-menu-btn-wrap').toggleClass('flags-enabled flags-disabled');

      bindLanguageMenuPositioning($('.js-lang-menu-btn'))

      siteData.set("flags_state", flagsState);
    });
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

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataBgKey, data, bgPicker, pageType) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
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
    var $imgDropAreaTarget = $contentItemBox.find('.js-img-drop-area'),
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

  var setItemImage = function(itemId, imageId, itemType) {
    var apiType;

    // console.log(itemType);

    if (itemType === 'article') {
      apiType = 'articles';
    } else {
      apiType = 'pages';
    }

    console.log(apiType);
    console.log('/admin/api/' + apiType +'/' + itemId);

    $.ajax({
       type: 'PATCH',
       contentType: 'application/json',
       url: '/admin/api/' + apiType +'/' + itemId,
       data: JSON.stringify({'image_id': imageId}),
       dataType: 'json'
    });
  };

  // ===========================================================================
  // Binds editmode backgroun picker areas.
  // ===========================================================================
  var bindContentItemBgPickers = function() {
    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var $bgPickerArea = $(bgPickerArea),
          $bgPickerButton = $bgPickerArea.find('.js-bg-picker-btn'),
          $contentItemBox = $bgPickerArea.closest('.js-content-item-box'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          dataBgKey = $bgPickerButton.data('bg-key');

      var bgPicker = new Edicy.BgPicker($bgPickerButton, {
        picture: $bgPickerButton.data('bg-picture-boolean'),
        target_width: $bgPickerButton.data('bg-target-width'),
        color: $bgPickerButton.data('bg-color-boolean'),

        preview: function(data) {
          var $contentItemBox = $bgPickerArea.closest('.js-content-item-box'),
              $imgDropArea = $bgPickerArea.find('.js-img-drop-area');

          setImageOrientation($contentItemBox, data.width, data.height);

          $bgPickerArea.eq(0).data('imgDropArea').setData({
            id: data.original_id,
            url: data.image,
            width: data.width,
            height: data.height
          });

          $imgDropArea
            .removeClass('is-cropped')
            .addClass('not-cropped')
          ;
        },

        commit: function(data) {
          setItemImage(itemId, data.original_id, itemType);
        }
      });

      $bgPickerArea.data('bgpicker', bgPicker);
    });
  };

  // ===========================================================================
  // Binds editmode image drop areas.
  // ===========================================================================
  var bindContentItemImgDropAreas = function() {
    $('.js-img-drop-area').each(function(index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
          $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
          $bgPickerArea = $contentItemBox.find('.js-bg-picker-area'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          articleData = new Edicy.CustomData({
            type: 'article',
            id: itemId
          }),
          pageData = new Edicy.CustomData({
            type: 'page',
            id: $contentItemBox.data('item-id')
          });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 1280,
        removeBtn: '',

        change: function(data) {
          var $bgPickerButton = $contentItemBox.find('.js-bg-picker-btn');

          $contentItemBox
            .addClass('with-image')
            .removeClass('without-image')
          ;

          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
          ;

          setImageOrientation($contentItemBox, data.width, data.height);


          $bgPickerArea.eq(0).data('bgpicker').setData({
            id: data.original_id,
            image: data.url,
            width: data.width,
            height: data.height
          });

          setItemImage(itemId, data.original_id, itemType);

          if (itemType === 'article') {
            articleData.set('image_crop_state', 'not-cropped');
          } else {
            pageData.set('image_crop_state', 'not-cropped');
          }
        }
      });

      $bgPickerArea.data('imgDropArea', imgDropArea);
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindContentItemImageCropToggle = function() {
    $('.js-toggle-crop-state').on('click', function() {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
          $imgDropAreaTarget = $contentItemBox.find('.js-img-drop-area'),
          itemType = $contentItemBox.data('item-type'),
          imageCropState;

      var articleData = new Edicy.CustomData({
        type: 'article',
        id: $contentItemBox.data('item-id')
      });

      var pageData = new Edicy.CustomData({
        type: 'page',
        id: $contentItemBox.data('item-id')
      });

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

      if (itemType === 'article') {
        articleData.set('image_crop_state', imageCropState);
      } else {
        pageData.set('image_crop_state', imageCropState);
      }
    });
  };

  // ===========================================================================
  // Load article cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var bindItemImageLazyload = function() {
    $(document).ready(function() {
      setTimeout(function() {
        $('.js-content-item-box').addClass('not-loaded');
      }, 3000);
    });

    $('.js-lazyload').lazyload({
      threshold : 500,
      effect : "fadeIn",
      placeholder: 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',

      load : function() {
        var $contentItemBox = $(this).closest('.js-content-item-box');

        $contentItemBox.removeClass('not-loaded').addClass('is-loaded');

        setTimeout(function() {
          $contentItemBox.removeClass('not-loaded');
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

        if ($('body').hasClass('lang-menu-open')) {
          $('body').removeClass('lang-menu-open');
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

    $('.public .js-slide-to-article').click(function() {
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
    $(window).resize(debounce(commentsHeight, 100));
    $(window).resize(debounce(handleMobileSearchHeight, 100));
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
  // Toggles product categories visibility in main menu.
  // ===========================================================================
  var bindRootItemSettings = function(valuesObj) {
    if (!('show_product_related_pages_in_main_menu' in valuesObj)) {
      valuesObj.show_product_related_pages_in_main_menu = false;
    }

    $('.js-root-item-settings-toggle').each(function(index, languageMenuSettingsButton) {
      var rootItemSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
        menuItems: [
          {
            "titleI18n": "show_in_main_menu",
            "type": "checkbox",
            "key": "show_product_related_pages_in_main_menu",
            "states": {
              "on": false,
              "off": true
            }
          }
        ],

        buttonTitleI18n: "settings",

        values: valuesObj,

        containerClass: ['js-root-item-settings-popover', 'js-prevent-sideclick'],

        preview: function(data) {
          if (data.show_product_related_pages_in_main_menu === true) {
            $.each($('.js-menu-item-products'), function() {
              $(this).addClass('is-hidden');
            });
          } else {
            $.each($('.js-menu-item-products'), function() {
              $(this).removeClass('is-hidden');
            });
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
    bindItemImageLazyload();
  };

  // ===========================================================================
  // Detects design editor changes.
  // ===========================================================================
  var detectDesignEditorChanges = function() {
    document.addEventListener('edicy:customstyles:change', function(event) {
			if (Object.keys(event.detail.changes).indexOf('--header-background-color') > -1) {
				if (event.detail.changes['--header-background-color'].value === undefined) {
          $('body').removeClass('header-top-with-bg');

          siteData.remove('has_header_bg_color');
				}
				else {
          $('body').addClass('header-top-with-bg');

          siteData.set('has_header_bg_color', true);
				}

			}
    });
  };

  var init = function() {
    // Add site wide functions here.
    handleElementsClick();
    tableWrapper();
    focusFormWithErrors();
    //autoSizeFormCommentArea();
    detectDesignEditorChanges();

    if (!Modernizr.flexbox && editmode) {
      bindFallbackHeaderLeftWidthCalculation();
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
    initItemsPage: initItemsPage,
    toggleFlags: toggleFlags,
    bindContentItemBgPickers: bindContentItemBgPickers,
    bindContentItemImgDropAreas: bindContentItemImgDropAreas,
    bindContentItemImageCropToggle: bindContentItemImageCropToggle,
    bindRootItemSettings: bindRootItemSettings
  });

    window.site = $.extend(window.site || {}, {
  });

  init();
})(jQuery);
