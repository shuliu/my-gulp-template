
gulp = require('gulp')
conf = require('../conf')

connect = require('gulp-connect')


### dev server ###
gulp.task 'connect', ->
  connect.server({
    root: './dist/',
    port: 3000,
    livereload: true,
    directoryListing: false,
    fallback: './dist/index.html'
  })

