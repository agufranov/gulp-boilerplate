gulp = require 'gulp'
watch = require 'gulp-watch'
coffee = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'
lazypipe = require 'lazypipe'
path = require 'path'

module.exports = ({ srcDir, destDir }) ->
  coffeeGlob = path.join srcDir, '**', '*.coffee'
  coffeeCompile = lazypipe()
    .pipe sourcemaps.init
    .pipe coffee, bare: true
    .pipe sourcemaps.write
    .pipe gulp.dest, destDir

  gulp.task 'coffee:compile', ->
    gulp.src coffeeGlob
      .pipe coffeeCompile()

  gulp.task 'coffee:watch', ->
    watch coffeeGlob, verbose: true, name: 'Coffee'
      .pipe coffeeCompile()
