gulp = require 'gulp'
watch = require 'gulp-watch'
coffee = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
path = require 'path'

module.exports = (opts) ->
  onError = (err) ->
    filename = path.relative process.cwd(), err.filename
    at = err.location.first_line + 1
    notify.onError(
      title: "#{err.name} [#{err.message}]"
      message: "#{filename}:#{at}"
    )(err)

  coffeeGlob = path.join opts.paths.src, '**', '*.coffee'

  pipeToCoffee = (p) ->
    p
      .pipe plumber errorHandler: onError
      .pipe sourcemaps.init()
      .pipe coffee bare: true
      .pipe sourcemaps.write()
      .pipe gulp.dest opts.browserify.path

  gulp.task 'coffee:compile', ->
    pipeToCoffee(gulp.src coffeeGlob)

  gulp.task 'coffee:watch', ['build'], ->
    pipeToCoffee(watch coffeeGlob, verbose: true, name: 'Coffee')
