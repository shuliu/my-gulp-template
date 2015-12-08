
gulp = require('gulp')
conf = require('../conf')
plumber = require('gulp-plumber')
concat = require('gulp-concat')
gutil = require('gulp-util')
uglify = require('gulp-uglify')
coffeelint = require('gulp-coffeelint')
coffee = require("gulp-coffee")

isProd = gutil.env.type is 'prod'

# I put linting as a separate task so we can run it by itself if we want to
gulp.task 'lint', ->
  gulp.src(conf.sources.coffee)
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())

gulp.task 'coffee', ->
  gulp.src(conf.sources.coffee)
  .pipe(plumber())
  .pipe(coffee({bare: true}).on('error', gutil.log))
  .pipe(concat('all.js'))
  .pipe(if isProd then uglify({compress: false}) else gutil.noop())
  .pipe(gulp.dest(conf.destinations.js))
