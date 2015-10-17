gulp = require 'gulp'
watch = require 'gulp-watch'
coffee = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
lazypipe = require 'lazypipe'
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

  coffeeCompile = lazypipe()
    .pipe sourcemaps.init
    .pipe(plumber, errorHandler: onError)
    .pipe coffee, bare: true
    .pipe sourcemaps.write
    .pipe gulp.dest, opts.browserify.path

  gulp.task 'coffee:compile', ->
    gulp.src coffeeGlob
      .pipe coffeeCompile()

  gulp.task 'coffee:watch', ['compile'], ->
    watch coffeeGlob, verbose: true, name: 'Coffee'
      .pipe coffeeCompile()
