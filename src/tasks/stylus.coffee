gulp = require 'gulp'
watch = require 'gulp-watch'
stylus = require 'gulp-stylus'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
path = require 'path'

module.exports = (opts) ->
  onError = (err) ->
    filename = path.relative process.cwd(), err.path
    at = err.message.match(/:([\w]+)/)[1]
    notify.onError(
      title: 'Jade error'
      message: "#{filename}:#{at}"
    )(err)

  stylusGlob = path.join opts.paths.src, '**', '*.styl'

  pipeToStylus = (p) ->
    p
      .pipe plumber errorHandler: onError
      .pipe stylus()
      .pipe gulp.dest opts.paths.build

  gulp.task 'stylus:compile', ->
    pipeToStylus(gulp.src stylusGlob)

  gulp.task 'stylus:watch', ['stylus:compile'], ->
    pipeToStylus(watch stylusGlob, verbose: true, name: 'Stylus')
