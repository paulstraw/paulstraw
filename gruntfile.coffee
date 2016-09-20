module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    grunticon:
      icons:
        files: [{
          expand: true
          cwd: 'src/img'
          src: ['*.svg', '*.png']
          dest: 'dist/img'
        }]
        options:
          template: 'src/img/css.hbs'
          customselectors:
            '*': ['.icon-$1--before:before', '.icon-$1--after:after']
          enhanceSVG: true

    sass:
      dist:
        options:
          style: 'compressed'
        files:
          'dist/css/paulstraw.css': 'src/scss/paulstraw.scss'

    postcss:
      options:
        processors: [
          require('autoprefixer-core')({browsers: 'last 2 versions'})
        ]
      dist:
        src: 'dist/css/*.css'

    coffee:
      dist:
        files:
          'dist/js/paulstraw.js': ['src/coffee/**/*.coffee']

    concat:
      dist:
        src: [
          'src/vendor/js/**/*.js'
          'dist/js/paulstraw.js'
        ]
        dest: 'dist/js/paulstraw.js'

    uglify:
      options:
        mangle: false
      dist:
        files:
          'dist/js/paulstraw.min.js': 'dist/js/paulstraw.js'

    notify:
      css:
        options:
          title: 'CSS Compiled'
          message: 'sass, postcss'
      js:
        options:
          title: 'JS Compiled'
          message: 'coffee, concat, uglify'
      icons:
        options:
          title: 'Icons Compiled'
          message: 'grunticon'

    watch:
      css:
        files: 'src/**/*.scss'
        tasks: ['sass', 'postcss']
        options:
          spawn: false
      js:
        files: ['src/coffee/**/*.coffee', 'src/vendor/js/**/*.js']
        tasks: ['coffee', 'concat', 'uglify']
        options:
          spawn: false
      icons:
        files: ['src/img/*.svg', 'src/img/*.png']
        tasks: ['grunticon:icons']
        options:
          spawn: false

  require('load-grunt-tasks')(grunt)

  grunt.registerTask('default', ['grunticon:icons', 'notify:icons', 'sass', 'postcss', 'notify:css', 'coffee', 'concat', 'uglify', 'notify:js'])
