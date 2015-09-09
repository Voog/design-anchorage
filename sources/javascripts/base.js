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
      // event.stopPropagation();
      event.preventDefault();
      $('body').toggleClass('mobilemenu-open');
      $('body').removeClass('mobilesearch-open');
  });

  $('.mobile-menu-close').on('click', function(event) {
    // event.stopPropagation();
    event.preventDefault();

    if ($('body').hasClass('lang-menu-open')) {
      $('body').removeClass('lang-menu-open');
    }
    else if ($('body').hasClass('mobile-search-open')) {
      $('body').removeClass('mobile-search-open');
      $('.search-btn').removeClass('open');
    }
    else {
      $('body').removeClass('mobilemenu-open');
    }
  });


  $('.js-lang-menu-btn').on('click', function() {
      if ($('body').hasClass('lang-menu-open')) {
        $('body').removeClass('lang-menu-open');
      } else {
        bindLanguageMenuPositioning($(this), 10);

        $('body').addClass('lang-menu-open');
      }
  });

  var bindLanguageMenuPositioning = function(currentButton, whitespace) {
      if (currentButton.parent().hasClass('flags-disabled')) {
        var offsetItem = currentButton.find('.js-lang-title-inner');
      } else {
        var offsetItem = currentButton;
      }

      if ($(window).height() - offsetItem.offset().top - offsetItem.outerHeight() - whitespace - $('.js-popup-menu-popover').outerHeight() > 0) {
        $('.js-popup-menu-popover').css({
          top: offsetItem.offset().top + offsetItem.outerHeight() + whitespace,
          right: $(window).width() - offsetItem.offset().left - offsetItem.outerWidth() - 12
        });
      } else {
        $('.js-popup-menu-popover').css({
          top: offsetItem.offset().top - offsetItem.outerHeight() - $('.js-popup-menu-popover').outerHeight(),
          right: $(window).width() - offsetItem.offset().left - offsetItem.outerWidth() - 12
        });
      }
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

      bindLanguageMenuPositioning($('.js-lang-menu-btn'), 10)

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
  var bgPickerContentLightnessClass = function(bgPickerArea) {
    if (bgPickerCombinedLightness >= 0.5) {
      $(bgPickerArea).find('.js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $(bgPickerArea).find('.js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Header background image and color preview logic function.
  var bgPickerPreview = function(bgPickerArea, data, bgPicker) {
    // Defines the variables used in preview logic.

    var bgPickerImagePrevious = $(bgPickerArea).css('background-image'),
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
        bgPickerCombinedLightness = getCombinedLightness(bgPicker.bgPickerImageColor, bgPickerColor);
        bgPickerContentLightnessClass(bgPickerArea);
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/photos/g,'/photos'));
        colorExtractImage.load(function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            bgPicker.bgPickerImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bgPickerCombinedLightness = getCombinedLightness(bgPicker.bgPickerImageColor, bgPickerColor);
            bgPickerContentLightnessClass(bgPickerArea);
          });
        });
      };
    } else {
      bgPickerCombinedLightness = getCombinedLightness('rgba(255,255,255,1)', bgPickerColor);
      bgPickerContentLightnessClass(bgPickerArea);
    };

    // Updates the bgPickerContent background image and background color.
    $(bgPickerArea).find('.js-background-image').css({'background-image' : bgPickerImage});
    $(bgPickerArea).find('.js-background-color').css({'background-color' : bgPickerColor});
  };

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataBgKey, data) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
    commitData.color = data.color || 'rgba(255,255,255,0)';
    commitData.combinedLightness = bgPickerCombinedLightness;

    if (pageType === 'articlePage') {
      if (dataBgKey == 'footer_bg') {
        siteData.set(dataBgKey, commitData);
      } else {
        Edicy.articles.currentArticle.setData(dataBgKey, commitData);
      }
    } else {
      if (pageType === 'contentPage' && dataBgKey === 'footer_bg') {
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
          $('body').removeClass('mobile-search-open');
        }

        if ($('body').hasClass('mobilemenu-open')) {
          $('.mobile-menu-toggler').trigger('click');
        }

        if ($('body').hasClass('lang-menu-open')) {
          $('body').removeClass('lang-menu-open');
        }

        if ($('body').hasClass('comments-open')) {
          $('body').removeClass('comments-open');
          $('.js-comments-toggle-btn, .js-voog-comments-modal').removeClass('open');
        }
      }
    });

    // Toggles the popover main menu (visible on smalles screens).
    $('.js-menu-btn').click(function() {
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');

      if ($('.js-search-close-btn').hasClass('open')) {
        $('.js-search-close-btn').trigger('click');
      }
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

    // Hides search modal on side click
    $('.js-search').click(function() {
      $('.js-search-close-btn').trigger('click');
    });

    // Toggles the search modal.
    $('.js-search-toggle-btn').click(function() {
      $('.js-search').toggleClass('active');
      $('.js-search').hasClass('active') ? $('.js-search-input').focus() : '';
    });

    $('.js-search-input').on('input', function() {
      var searchCleanBtn = $(this).parent().next();

      if ($(this).val().length > 0) {
        searchCleanBtn.addClass('active');
      } else {
        searchCleanBtn.removeClass('active');
      }
    });

    $('.js-search-reset-btn').click(function() {
      $(this).prev().find('.js-search-input').val('').focus();
      $(this).removeClass('active');
    });

    $('.js-mobile-search-toggle-btn').click(function() {
      $('body').toggleClass('mobile-search-open');
      $('#mobile-search .js-search').toggleClass('active');
      $('#mobile-search .js-search-input').focus();
    });

    // Opens the comments modal.
    $('.js-comments-toggle-btn').click(function(event) {
      $(this).toggleClass('open');
      $('.js-comments').toggleClass('open');
      $('body').toggleClass('comments-open');
      $('.js-comments-input').val('').focus();
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

  var stickyFooterVarHeight = function() {
    if ($('.site-container').find('.page-body').hasClass('sidebar-active')) {
      $('.page-body').css('margin-bottom', $('.site-footer').outerHeight());
    }
    else {
      $('.page-content').css('margin-bottom', $('.site-footer').outerHeight());
    }
  };

  // Sets the position of the footer to the bottom of the page
  var handleContentMutations = function() {
    var MutationObserver = (function () {
      var prefixes = ['WebKit', 'Moz', 'O', 'Ms', ''];

      for(var i=0; i < prefixes.length; i++) {
        if(prefixes[i] + 'MutationObserver' in window) {
          return window[prefixes[i] + 'MutationObserver'];
        }
      }
      return false;
    }());

    if(MutationObserver) {
      var mObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver;

      // create an observer instance
      var targetFooter = document.querySelector('.site-footer'),
          config = {
            attributes: true,
            childList: true,
            subtree: true,
          };

      var observer = new mObserver(function(mutations) {
          mutations.forEach(function(mutation) {
            stickyFooterVarHeight();
          });
      });

      observer.observe(targetFooter, config);
    } else {
      setInterval(function() {
        stickyFooterVarHeight();
      }, 1000);
    }
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
      $('.article-comments').css('height', commentsTarget);
    }

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
    $(window).resize(debounce(stickyFooterVarHeight, 100));
    $(window).resize(debounce(commentsHeight, 100));
    $(window).resize(debounce(mobileResize, 100));
  };

  // Close elements not intended for the specific viewport when resizing
  var mobileResize = function() {
    if ($(window).width() >= 768) {
      $('body').removeClass('mobile-search-open');
      $('body').removeClass('mobilemenu-open');
    }

    if ($(window).width() < 768) {
      $('.site-header .js-search').removeClass('active');
    }
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
    tableWrapper();
    focusFormWithErrors();
    handleContentMutations();

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
    toggleFlags: toggleFlags
  });

    window.site = $.extend(window.site || {}, {
  });

  init();
})(jQuery);
