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
      $('body').toggleClass('mobilemenu-open');
      $('body').removeClass('mobilesearch-open');
  });

  $('.mobile-menu-close').on('click', function(event) {
      event.preventDefault();

      if ($('body').hasClass('lang-menu-open')) {
          $('body').removeClass('lang-menu-open');
      }
      else {
          $('body').removeClass('mobilemenu-open');
      }
  });

  $('.lang-menu-btn').on('click', function(event) {
      $('body').addClass('lang-menu-open');
      console.log("clicky");
  });

  $('.lang-menu').on('click', function() {
      console.log("clicky2");
  });

  var toggleFlags = function() {
    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      $(this).toggleClass('js-flag-disable-btn');
      $('.js-menu-lang-wrap').toggleClass('flags-enabled flags-disabled');

      siteData.set("flags_state", flagsState);
    });
  };


  // contentHalf background image and color preview logic function.
  var contentHalfBgPreview = function(data, contentHalf, contentHalfObj) {

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

    var contentHalfBgImageSizesContains = function(sizes, url) {
      for (var i = sizes.length; i--;) {
        if (url.indexOf(sizes[i].url.trim()) > -1) {
          return true;
        }
      }
      return false;
    };

    // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
    var handleContentHalfImageLightnessClass = function() {
      if (contentHalfBgCombinedLightness >= 0.5) {
        $(contentHalf).find('.js-background-type').addClass('light-background').removeClass('dark-background');
      } else {
        $(contentHalf).find('.js-background-type').addClass('dark-background').removeClass('light-background');
      }
    };

    // Defines the suitable image based on the viewport width.
    var suitableImage = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : 'none';

    // Defines the variables used in preview logic.
    var contentHalfBgImagePrevious = $(contentHalf).css('background-image'),
        contentHalfBgImage = (data.image && data.image !== '') ? 'url(' + suitableImage.url + ')' : 'none',
        contentHalfBgImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        contentHalfBgColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        contentHalfBgColorOpacity = (data.colorData && data.colorData !== '') ? data.colorData.a : 'none',
        contentHalfBgColorLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (contentHalfBgImageSizesContains(contentHalfBgImageSizes, contentHalfBgImagePrevious)) {
        contentHalfBgCombinedLightness = getCombinedLightness(contentHalfObj.contentHalfBgImageColor, contentHalfBgColor);
        handleContentHalfImageLightnessClass();
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/photos/g,'/photos'));
        colorExtractImage.load(function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            contentHalfObj.contentHalfBgImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            contentHalfBgCombinedLightness = getCombinedLightness(contentHalfObj.contentHalfBgImageColor, contentHalfBgColor);
            handleContentHalfImageLightnessClass();
          });
        });
      };
    } else {
      contentHalfBgCombinedLightness = getCombinedLightness('rgba(255,255,255,1)', contentHalfBgColor);
      handleContentHalfImageLightnessClass();
    };

    // Fix Safari from constantly loading a new image on Bg picker slider change
    var newContentHalfBgImage = contentHalfBgImage.split('/').pop();
    var oldContentHalfBgImage = contentHalfBgImagePrevious.split('/').pop();

    // Updates the contentHalf background image and background color.
    if (newContentHalfBgImage != oldContentHalfBgImage) {
      $(contentHalf).find('.background-image').css({'background-image' : contentHalfBgImage});
    };
    $(contentHalf).find('.background-color').css({'background-color' : contentHalfBgColor});
  };

  // contentHalf background image and color save logic function.
  var contentHalfBgCommit = function(data, dataName) {
    var commitData = $.extend(true, {}, data);
        commitData.image = data.image || '';
        commitData.imageSizes = data.imageSizes || '';
        commitData.color = data.color || 'rgba(255,255,255,0)';
        commitData.combinedLightness = contentHalfBgCombinedLightness;
        if (articlePage) {
          Edicy.articles.currentArticle.setData(dataName, commitData);
        } else {
          pageData.set(dataName, commitData);
        };
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


  // Initiations
  var initWindowResize = function() {
    $(window).resize(function() {
      // Add window resizing functions here.
    });
  };

  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
  };

  var initArticlePage = function() {
    // Add single post layout specific functions here.
  };

  var initCommonPage = function() {
    // Add common page layout specific functions here.
  };

  var initFrontPage = function() {
    // Add front page layout specific functions here.


  };

  var init = function() {
    // Add site wide functions here.


  };

  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    contentHalfBgPreview: contentHalfBgPreview,
    contentHalfBgCommit: contentHalfBgCommit,
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    initFrontPage: initFrontPage
  });

  init();
})(jQuery);

(function($) {
    $.fn.extend({
        jsPopupMenu: function(options) {
            this.each(function() {
                var $menu = $(this),
                    $btn = $menu.find('.js-popup-menu-btn'),
                    $pop = $menu.find('.js-popup-menu-popover');

                $pop.hide();
                $btn.on('click', function(event) {
                    event.preventDefault();
                    if ($pop.is(':hidden')) {
                        $pop.show();
                        $btn.addClass('open');

                        setTimeout(function() {
                            $(document).on('click.js-popup-menu-click', function() {
                                $pop.hide();
                                $btn.removeClass('open');
                                $(this).off('.js-popup-menu-click');
                            });
                        },0);

                    }
                });
            });
            return this;
        }
    });

})(jQuery);
