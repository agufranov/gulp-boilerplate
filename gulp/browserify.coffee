gulp = require 'gulp'
watch = require 'gulp-watch'
sourcemaps = require 'gulp-sourcemaps'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
uglify = require 'gulp-uglify'
lazypipe = require 'lazypipe'
path = require 'path'

module.exports = (opts) ->
  watchGlob = path.join opts.browserify.path, '**', '*.js'
  entries = opts.browserify.entries.map (p) -> path.join opts.browserify.path, p

  makeBundle = ->
    browserify
      entries: entries
      debug: true
    .bundle()
    .pipe source opts.browserify.bundleName
    .pipe buffer()
    .pipe sourcemaps.init loadMaps: true
    .pipe uglify()
    .pipe sourcemaps.write()
    .pipe gulp.dest opts.paths.build

  gulp.task 'browserify:compile', ['coffee:compile'], makeBundle

  gulp.task 'browserify:watch', ->
    watch watchGlob, verbose: true, name: 'Browserify', makeBundle
