
gulp = require('gulp')
conf = require('../conf')
gutil = require('gulp-util')
concat = require('gulp-concat')
uglify = require('gulp-uglify')
minifycss = require("gulp-minify-css")
# notify  = require('gulp-notify')

gulp.task 'compile', ['compile-js-plugins', 'compile-css-plugins']

gulp.task 'compile-js-plugins', () ->
  compileFileName = 'plugins.js'
  gulp.src conf.SCRIPTS
    .pipe concat(compileFileName)
    .pipe uglify()
    .pipe gulp.dest(conf.destinations.js)

gulp.task 'compile-css-plugins', () ->
  compileFileName = 'plugins.css'
  gulp.src conf.STYLES
    .pipe concat(compileFileName)
    .pipe minifycss()
    .pipe gulp.dest(conf.destinations.css)
    # .pipe notify("Found file: <%= file.relative %>!")
  gulp.src conf.FONTS
    .pipe gulp.dest(conf.destinations.fonts)



