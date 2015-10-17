gulp = require 'gulp'
watch = require 'gulp-watch'
jade = require 'gulp-jade'
lazypipe = require 'lazypipe'
path = require 'path'

module.exports = ({ srcDir, destDir }) ->
  jadeGlob = path.join srcDir, '**', '*.jade'
  jadeCompile = lazypipe()
    .pipe jade
    .pipe gulp.dest, destDir

  gulp.task 'jade:compile', ->
    gulp.src jadeGlob
      .pipe jadeCompile()

  gulp.task 'jade:watch', ->
    watch jadeGlob, verbose: true, name: 'Jade'
      .pipe jadeCompile()

