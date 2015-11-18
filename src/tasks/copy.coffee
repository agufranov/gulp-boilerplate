gulp = require 'gulp'
path = require 'path'

module.exports = (opts) ->
  gulp.task 'copy-lib', ->
    for libPath in opts.paths.lib
      gulp.src path.join libPath, '**', '*'
        .pipe gulp.dest path.join(opts.paths.build, path.basename libPath)
