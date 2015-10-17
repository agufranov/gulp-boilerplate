gulp = require 'gulp'
watch = require 'gulp-watch'
jade = require 'gulp-jade'
lazypipe = require 'lazypipe'
path = require 'path'

module.exports = (opts) ->
  jadeGlob = path.join opts.paths.src, '**', '*.jade'
  jadeCompile = lazypipe()
    .pipe jade
    .pipe gulp.dest, opts.paths.build

  gulp.task 'jade:compile', ->
    gulp.src jadeGlob
      .pipe jadeCompile()

  gulp.task 'jade:watch', ->
    watch jadeGlob, verbose: true, name: 'Jade'
      .pipe jadeCompile()

