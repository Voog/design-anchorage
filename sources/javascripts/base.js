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
      else if ($('body').hasClass('mobile-search-open')) {
        $('body').removeClass('mobile-search-open');
      }
      else {
        $('body').removeClass('mobilemenu-open');
      }
  });

  $('.lang-menu-btn').on('click', function(event) {

      if ($('body').hasClass('lang-menu-open')) {
          $('body').removeClass('lang-menu-open');
      }
      else {
          $('body').addClass('lang-menu-open');
      }
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



  // Shows/hides the popover main menu (visible on smalles screens).
  var handleElementsClick = function() {
    $('html').click(function() {
      if ($('.js-btn').hasClass('open')) {
        $('.js-btn').removeClass('open');
      }

      if ($('.js-popover').hasClass('expanded')) {
        $('.js-popover').removeClass('expanded');
      }

      if ($('.js-search-inner').hasClass('active')) {
        $('.js-search-inner').removeClass('active');
      }
    });

    // Toggles the popover main menu (visible on smalles screens).
    $('.js-menu-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');

      if ($('.js-search-close-btn').hasClass('open')) {
        $('.js-search-close-btn').trigger('click');
      }
    });

    // Toggles the popover language menu.
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-btn').toggleClass('open');
      $('.js-menu-lang').toggleClass('expanded');
    });

    $('.js-tags-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-tags').toggleClass('expanded');
    });

    // Hides search modal on side click
    $('.js-search').click(function() {
      $('.js-search-close-btn').trigger('click');
    });

    // Opens the search modal.
    $('.js-search-open-btn').click(function(event) {
      event.stopPropagation();
      if ($('.js-menu-btn').hasClass('open')) {
        $('.js-menu-btn').trigger('click');
      }

      $(this).addClass('open');
      $('.js-search-close-btn').addClass('open');
      $('.js-search').addClass('active');
      $('.js-search-input').val('').focus();
    });

    // Closes the search modal.
    $('.js-search-close-btn').click(function(event) {
      event.stopPropagation();
      $('.js-search-open-btn, .js-search-close-btn').removeClass('open');
      $('.js-search').removeClass('active');
      $('.js-voog-search-modal').removeClass('search-results-active');
    });

    $('.js-search-form, .js-voog-search-modal').click(function(event) {
      event.stopPropagation();
    });




    // Hides mobile search modal on side click
    $('#mobile-menu .js-search').click(function() {
      $('#mobile-menu .js-mobile-search-close-btn').trigger('click');
    });

    // Opens the mobile search modal.
    $('#mobile-menu .js-mobile-search-open-btn').click(function(event) {
      event.stopPropagation();
      if ($('#mobile-menu .js-menu-btn').hasClass('open')) {
        $('#mobile-menu .js-menu-btn').trigger('click');
      }

      $(this).addClass('open');
      $('#mobile-menu .js-mobile-search-close-btn').addClass('open');
      $('body').addClass('mobile-search-open');
      $('#mobile-menu .js-search').addClass('active');
      $('#mobile-menu .js-search-input').val('').focus();
    });

    // Closes the mobile search modal.
    $('#mobile-menu .js-mobile-search-close-btn').click(function(event) {
      event.stopPropagation();
      $('#mobile-menu .js-mobile-search-open-btn, #mobile-menu .js-mobile-search-close-btn').removeClass('open');
      $('#mobile-menu .js-search').removeClass('active');
      $('body').removeClass('mobile-search-open');
      $('#mobile-menu .js-voog-search-modal').removeClass('search-results-active');
    });

    $('#mobile-menu .js-search-form, #mobile-menu .js-voog-search-modal').click(function(event) {
      event.stopPropagation();
    });




    // Opens the comments modal.
    $('.js-comments-open-btn').click(function(event) {
      event.stopPropagation();
      if ($('.js-menu-btn').hasClass('open')) {
        $('.js-menu-btn').trigger('click');
      }

      $(this).addClass('open');
      $('.js-comments-close-btn').addClass('open');
      $('.js-comments').addClass('active');
      $('.js-comments-input').val('').focus();
    });

    // Closes the comments modal.
    $('.js-comments-close-btn').click(function(event) {
      event.stopPropagation();
      $('.js-comments-open-btn, .js-comments-close-btn').removeClass('open');
      $('.js-comments').removeClass('active');
      $('.js-voog-comments-modal').removeClass('comments-results-active');
    });

    $('.js-comments-form, .js-voog-comments-modal').click(function(event) {
      event.stopPropagation();
    });
  };

  // Sets the search modal height.
  var handleSearchModalHeight = function() {
    var windowWidth = $(window).width();
        windowHeight = $(window).height(),
        searchModal = $('.js-voog-search-modal');

        if (windowWidth >= 1400 ) {
          searchModalHeight = windowHeight - 190;
        } else {
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

  var stickyFooterVarHeight = function() {
    $('.page-content').css('margin-bottom', $('.site-footer').outerHeight());
  };

  // Set article comments section the height of the document minus the header section
  var commentsHeight = function() {
    var documentHeight = $(document).height(),
        siteHeight = $('.site-container').height(),
        commentsHeight = $('.article-comments').height(),
        commentsPadTop = parseInt($('.article-comments').css('padding-top')),
        commentsPadBottom = parseInt($('.article-comments').css('padding-bottom')),
        mainHeight = $('.page-content').height(),
        headerHeight = $('.site-header').height(),
        footerHeight = $('.site-footer').height(),
        commentsTarget = (mainHeight + headerHeight + footerHeight) - headerHeight - commentsPadTop - commentsPadBottom;

    $('.article-comments').css('height', commentsTarget);
  };

  // Prevent page scroll while focused on a specific section
  $.fn.isolatedScroll = function() {
    this.bind('mousewheel DOMMouseScroll', function (e) {
        var delta = e.wheelDelta || (e.originalEvent && e.originalEvent.wheelDelta) || -e.detail,
            bottomOverflow = this.scrollTop + $(this).outerHeight() - this.scrollHeight >= 0,
            topOverflow = this.scrollTop <= 0;

        if ((delta < 0 && bottomOverflow) || (delta > 0 && topOverflow)) {
            e.preventDefault();
        }
    });
    return this;
  };

  // Prevent page scroll while scrolling comments
  $('.comments-body').isolatedScroll();

  // Initiations
  var initWindowResize = function() {
    $(window).resize(function() {
      // Add window resizing functions here.
      stickyFooterVarHeight();
      commentsHeight();
    });
  };

  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
  };

  var initArticlePage = function() {
    // Add single post layout specific functions here.
    commentsHeight();
  };

  var initCommonPage = function() {
    // Add common page layout specific functions here.
  };

  var initFrontPage = function() {
    // Add front page layout specific functions here.


  };

  var init = function() {
    // Add site wide functions here.
    handleElementsClick();
    stickyFooterVarHeight();
    toggleFlags();

  };

  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    contentHalfBgPreview: contentHalfBgPreview,
    contentHalfBgCommit: contentHalfBgCommit,
    initWindowResize: initWindowResize,
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    initFrontPage: initFrontPage,
    toggleFlags: toggleFlags
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
