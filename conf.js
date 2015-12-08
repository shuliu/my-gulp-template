
var gutil = require('gulp-util')

// exports.paths = {
//   src: 'src',
//   dist: 'dist',
//   // tmp: '.tmp'
//   // e2e: 'e2e'
// }

module.exports = {
  paths: {
    src: 'src',
    dist: 'dist'
    // tmp: '.tmp'
    // e2e: 'e2e'
  },

  appPath: './app',
  assetsPath: './bower_components',

  sources: {
    sass: './app/assets/sass/**/*.sass',
    html: './app/*.html',
    coffee: './app/assets/coffeescripts/**/*.coffee',
    img: './app/assets/images/**',
    fonts: './app/assets/fonts/**/*.{eot,svg,ttf,woff,woff2}'
  },

  destinations: {
    html: 'dist/',
    js: 'dist/assets/javascripts/',
    css: 'dist/assets/stylesheets/',
    img: 'dist/assets/images/',
    fonts: 'dist/assets/fonts/'
  },

  SCRIPTS: [
    "./bower_components/jquery/dist/jquery.min.js",
    "./bower_components/bootstrap/dist/js/bootstrap.min.js",
    "./bower_components/gsap/src/minified/TweenlineMax.min.js",
    "./bower_components/gsap/src/minified/TweenMax.min.js",
    "./bower_components/gsap/src/minified/easing/EasePack.min.js",
    "./bower_components/gsap/src/minified/plugins/CssPlugin.min.js"
    // "./app/assets/javascripts/all.js"
  ],
  STYLES:[
    "./bower_components/bootstrap/dist/css/bootstrap.min.css",
    "./bower_components/components-font-awesome/css/font-awesome.min.css"
  ],
  FONTS: [
    "./bower_components/bootstrap/dist/fonts/*.{eot,svg,ttf,woff,woff2}",
    "./bower_components/components-font-awesome/fonts/*.{eot,svg,ttf,woff,woff2}"
  ],
  wiredep: {
    exclude: [/bootstrap.js$/, /bootstrap-sass-official\/.*\.js/, /bootstrap\.css/],
    directory: './bower_components/'
  },

  errorHandler: function(title) {
    'use strict';

    return function(err) {
      gutil.log(gutil.colors.red('[' + title + ']'), err.toString());
      this.emit('end');
    };
  }
}
