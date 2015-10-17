gulp = require 'gulp'
watch = require 'gulp-watch'
coffee = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'
lazypipe = require 'lazypipe'
path = require 'path'

module.exports = (opts) ->
  coffeeGlob = path.join opts.paths.src, '**', '*.coffee'
  coffeeCompile = lazypipe()
    .pipe sourcemaps.init
    .pipe coffee, bare: true
    .pipe sourcemaps.write
    .pipe gulp.dest, opts.browserify.path

  gulp.task 'coffee:compile', ->
    gulp.src coffeeGlob
      .pipe coffeeCompile()

  gulp.task 'coffee:watch', ->
    watch coffeeGlob, verbose: true, name: 'Coffee'
      .pipe coffeeCompile()
