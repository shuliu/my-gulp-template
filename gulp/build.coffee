
gulp = require('gulp')
conf = require('../conf')
imagemin = require('gulp-imagemin')
runSequence = require('run-sequence').use(gulp)


gulp.task 'html', ->
  gulp.src(conf.sources.html)
  .pipe(gulp.dest(conf.destinations.html))


gulp.task 'images', ->
  gulp.src(conf.sources.img)
    .pipe(imagemin())
    .pipe(gulp.dest(conf.destinations.img))


gulp.task 'clean', ->
  gulp.src(['dist/'], {read: false}).pipe(clean())

gulp.task 'build', ->
  runSequence 'compile', ['style', 'coffee', 'html', 'images']#compile

