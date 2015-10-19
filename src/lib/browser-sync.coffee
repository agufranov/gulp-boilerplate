gulp = require 'gulp'
watch = require 'gulp-watch'
path = require 'path'
browserSync = require('browser-sync').create()

module.exports = (opts) ->
  gulp.task 'browser-sync:serve', ['build'], ->
    browserSync.init
      server:
        baseDir: opts.paths.build

  gulp.task 'browser-sync:watch', ['browser-sync:serve'], ->
    watch path.join opts.paths.build, '**', '*.*'
      .pipe browserSync.reload stream: true
