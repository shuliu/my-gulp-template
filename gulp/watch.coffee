
gulp = require('gulp')
conf = require('../conf')
connect = require('gulp-connect')


isOnlyChange = (event) ->
  return event.type is 'changed'

gulp.task 'watch', ->
  # console.log "#{conf.sources.sass}\n"
  gulp.watch conf.sources.sass, ['style']
  gulp.watch conf.sources.app, ['lint', 'coffee', 'html', 'images']
  gulp.watch conf.sources.html, ['html']
  gulp.watch conf.sources.coffee, ['coffee']
  gulp.watch conf.sources.img, ['images']

  gulp.watch 'dist/**/*.*', (file) ->
    # browserSync.reload(file.path) if file.type is "changed"
    gulp.src ["#{conf.destinations.html}*.html", "#{conf.destinations.css}*.css", "#{conf.destinations.js}*.js"]
      .pipe connect.reload(file.path) if isOnlyChange(file)
    # console.log file




