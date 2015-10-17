gulp = require 'gulp'
watch = require 'gulp-watch'
sourcemaps = require 'gulp-sourcemaps'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
uglify = require 'gulp-uglify'

module.exports = ->
  gulp.task 'browserify', ->
    browserify
      entries: './build/a.js'
      debug: true
    .bundle()
    .pipe source 'bundle.js'
    .pipe buffer()
    .pipe sourcemaps.init loadMaps: true
    .pipe uglify()
    .pipe sourcemaps.write()
    .pipe gulp.dest 'build'
