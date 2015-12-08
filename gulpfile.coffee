
'use strict'

gulp = require('gulp')
wrench = require('wrench')
runSequence = require('run-sequence')
gutil = require('gulp-util')


### config ###
isProd = gutil.env.type is 'prod'

sourcemap = true

### tasks ###
wrench.readdirSyncRecursive('./gulp').filter((file) ->
  return (/\.(js|coffee)$/i).test(file)
).map((file) ->
  require('./gulp/' + file)
)



# start
gulp.task('default', [ 'build', 'watch', 'connect'])

