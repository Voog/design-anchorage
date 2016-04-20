module.exports = function(grunt) {
  'use strict';

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Removes old files.
    clean: {
      reset: {
        src: ['assets', 'images', 'javascripts', 'stylesheets']
      },

      remove: {
        src: ['sources/components/custom-styles/tmp']
      }
    },

    modernizr_builder: {
      build: {
        options: {
          config: 'modernizr-config.json',
          dest: 'javascripts/modernizr-custom.min.js',
          uglify: true
        }
      }
    },

    // Concatenates the javascript source files to the javascripts folder.
    concat: {
      build: {
        src: [
          'bower_components/jquery/dist/jquery.js',
          'bower_components/textarea-autosize/dist/jquery.textarea_autosize.js',
          'sources/javascripts/concat/*.js'
        ],
        dest: 'javascripts/main.js'
      }
    },

    // Minifies the javascript files.
    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: [
            '*.js',
            '!*.min.js'
          ],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },

    // Compiles the stylesheet files.
    sass: {
      build_main: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'sources/stylesheets',
          src: 'main.scss',
          dest: 'stylesheets/',
          ext: '.css'
        }]
      },

      // Builds custom style components to temporary folder.
      build_custom_styles: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'sources/components/custom-styles',
          src: '*.scss',
          dest: 'sources/components/custom-styles/tmp',
          ext: '.css'
        }]
      }
    },

    postcss: {
      options: {
        processors: [
          require('autoprefixer')({browsers: 'last 4 versions'})
        ]
      },
      main_styles: {
        src: [
          'stylesheets/*.css',
          'stylesheets/!*.min.css'
        ]
      },
      custom_styles: {
        src: [
          'sources/components/custom-styles/tmp/*.css'
        ]
      }
    },

    // Minifies the stylesheet files.
    cssmin: {
      build: {
        expand: true,
        cwd: 'stylesheets/',
        src: [
          '*.css',
          '!*.min.css'
        ],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },

    // Minifies the image files.
    imagemin: {
      build_images: {
        files: [{
          expand: true,
          cwd: 'sources/images/minify',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      },

      build_assets: {
        files: [{
          expand: true,
          cwd: 'sources/assets/minify',
          src: '*.svg',
          dest: 'assets/'
        }]
      }
    },

    // =========================================================================
    // If custom styles can be concatenated to one component, then this
    // block here will replace the placeholder strings with proper <style> tag
    // beginning and ending.
    // =========================================================================
    // replace: {
    //   custom_styles: {
    //     src: ['sources/components/custom-styles/tmp/*.css'],
    //     overwrite: true,
    //     replacements: [
    //       {
    //         from: '/* GRUNT-REPLACE: CUSTOM-STYLES-PREPEND */',
    //         to: '{% comment %}Template custom styles definitions.{% endcomment %}\n<style data-voog-style>'
    //       },
    //       {
    //         from: '/* GRUNT-REPLACE: CUSTOM-STYLES-APPEND */',
    //         to: '</style>'
    //       }
    //     ]
    //   }
    // },

    // Copys the files from the source folders to the layout folders.
    copy: {
      assets: {
        files: [
          {
            expand: true,
            cwd: 'sources/assets/copy',
            src: '*',
            dest: 'assets/'
          }
        ]
      },

      images: {
        files: [
          {
            expand: true,
            cwd: 'sources/images/copy',
            src: '*',
            dest: 'images/'
          }
        ]
      },

      javascripts: {
        files: [
          {
            expand: true,
            cwd: 'sources/javascripts/copy',
            src: '*',
            dest: 'javascripts/'
          }
        ]
      },

      // Copies the compiled css files from temporary folder to "components"
      // folder and renames the files to ""*.tpl".
      custom_styles: {
        files: [
          {
            expand: true,
            cwd: 'sources/components/custom-styles/tmp',
            src: '*.css',
            dest: 'components',
            ext: '.tpl'
          }
        ]
      }
    },

    // Executes the Voog Kit toolkit manifest generation and file upload commands.
    exec: {
      kitmanifest: {
        cmd: function(file) {
          return 'kit manifest';
        }
      },

      kit: {
        cmd: function(file) {
          if (grunt.option('site')) {
            return 'kit push -s ' + grunt.option('site') + ' ' + file;
          } else {
            return 'kit push ' + file;
          }
        }
      }
    },

    // Watches the project for changes and recompiles the output files.
    watch: {
      modernizr: {
        files: 'modernizr-config.json',
        tasks: ['modernizr_builder:build']
      },

      js_copy: {
        files: 'sources/javascripts/copy/*.js',
        tasks: ['copy:javascripts', 'exec:kitmanifest']
      },

      js_concat: {
        files: 'sources/javascripts/concat/*.js',
        tasks: ['concat:build', 'uglify:build', 'exec:kitmanifest']
      },

      css_main: {
        files: [
          'sources/stylesheets/*.scss',
          'sources/stylesheets/*/*.scss',
        ],
        tasks: ['sass:build_main', 'postcss', 'cssmin:build', 'exec:kitmanifest']
      },

      custom_styles: {
        files: 'sources/components/custom-styles/*.scss',
        tasks: ['sass:build_custom_styles', 'postcss:custom_styles', 'copy:custom_styles', 'clean:remove', 'exec:kitmanifest']
      },

      img_copy: {
        files: 'sources/images/copy/*',
        tasks: [ 'copy:images', 'exec:kitmanifest']
      },

      img_minify: {
        files: 'sources/images/minify/*',
        tasks: ['imagemin:build_images', 'exec:kitmanifest']
      },

      assets_copy: {
        files: 'sources/assets/copy/*',
        tasks: ['copy:assets', 'exec:kitmanifest']
      },

      assets_minify: {
        files: 'sources/assets/minify/*',
        tasks: ['imagemin:build_assets', 'exec:kitmanifest']
      },


      voog: {
        files: ['javascripts/*.js', 'stylesheets/*.css', 'layouts/*.tpl', 'components/*.tpl'],
        options: {
          spawn: false
        }
      }
    },
  });

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-modernizr-builder');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-postcss');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  // Uncomment if custom styles can be concatenated to one component.
  // grunt.loadNpmTasks('grunt-text-replace');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-exec');

  // Default task with text replacement (for automatic <style> tag wrapping).
  // grunt.registerTask('default', ['clean:reset', 'modernizr_builder', 'concat', 'uglify', 'sass', 'postcss', 'cssmin', 'imagemin', 'replace', 'copy', 'clean:remove']);

  grunt.registerTask('default', ['clean:reset', 'modernizr_builder', 'concat', 'uglify', 'sass', 'postcss:main_styles', 'cssmin', 'imagemin', 'postcss:custom_styles', 'copy', 'clean:remove']);

  grunt.event.on('watch', function(action, filepath, target) {
    if (target == 'voog') {
      if (action == 'added' || action == 'deleted') {
        grunt.task.run(['exec:kitmanifest']);
      }
      if (grunt.file.exists('.voog')) {
        if (action != 'deleted') {
          grunt.task.run(['exec:kit:' + filepath]);
        }
      }
    }
  });
};
