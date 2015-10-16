gulp = require 'gulp'
watch = require 'gulp-watch'
path = require 'path'
browserSync = require('browser-sync').create()

module.exports = ({ baseDir }) ->
  gulp.task 'browser-sync:serve', ->
    browserSync.init
      server:
        baseDir: baseDir

  gulp.task 'browser-sync:watch', ['browser-sync:serve'], ->
    watch path.join baseDir, '**', '*.*'
      .pipe browserSync.reload stream: true
