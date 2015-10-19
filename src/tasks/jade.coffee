gulp = require 'gulp'
watch = require 'gulp-watch'
jade = require 'gulp-jade'
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

  jadeGlob = path.join opts.paths.src, '**', '*.jade'

  pipeToJade = (p) ->
    p
      .pipe plumber errorHandler: onError
      .pipe jade()
      .pipe gulp.dest opts.paths.build

  gulp.task 'jade:compile', ->
    pipeToJade(gulp.src jadeGlob)

  gulp.task 'jade:watch', ['jade:compile'], ->
    pipeToJade(watch jadeGlob, verbose: true, name: 'Jade')

