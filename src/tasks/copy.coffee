gulp = require 'gulp'
path = require 'path'

module.exports = (opts) ->
  gulp.task 'copy-lib', ->
    gulp.src path.join opts.paths.lib, '**', '*'
      .pipe gulp.dest path.join(opts.paths.build, path.basename opts.paths.lib)
