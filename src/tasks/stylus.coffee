gulp = require 'gulp'
watch = require 'gulp-watch'
stylus = require 'gulp-stylus'
sourcemaps = require 'gulp-sourcemaps'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
path = require 'path'

module.exports = (opts) ->
  onError = (err) ->
    filename = path.relative process.cwd(), err.message.split(':')[0]
    at = err.message.match(/:([\w]+)/)[1]
    notify.onError(
      title: 'Stylus error'
      message: "#{filename}:#{at}"
    )(err)

  stylusGlob = path.join opts.paths.src, '**', '*.styl'

  pipeToStylus = (p) ->
    p
      .pipe plumber errorHandler: onError
      .pipe sourcemaps.init()
      .pipe stylus()
      .pipe sourcemaps.write()
      .pipe gulp.dest opts.paths.build

  gulp.task 'stylus:compile', ->
    pipeToStylus(gulp.src stylusGlob)

  gulp.task 'stylus:watch', ['stylus:compile'], ->
    pipeToStylus(watch stylusGlob, verbose: true, name: 'Stylus')
