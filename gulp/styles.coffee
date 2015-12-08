
path = require('path')
gulp = require('gulp')
conf = require('../conf')
sass = require('gulp-sass')
sourcemaps = require('gulp-sourcemaps')
autoprefixer = require("gulp-autoprefixer")
# plumber = require('gulp-plumber')
# minifycss = require("gulp-minify-css")

gulp.task 'style', ->

  gulp.src(conf.sources.sass)
    .pipe(sourcemaps.init())
    .pipe(sass({compass: true, sourcemap: true, outputStyle: 'compact', errLogToConsole: true}).on('error', sass.logError))

    # compass prefixer 功能直接用 autoprefixer取代
    .pipe(autoprefixer('last 3 versions'))
    # .pipe(minifycss())
    # .pipe(rename({suffix: '.min'}))

    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(conf.destinations.css))

