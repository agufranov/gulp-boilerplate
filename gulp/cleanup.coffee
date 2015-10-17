gulp = require 'gulp'
del = require 'del'

module.exports = (opts) ->
  gulp.task 'cleanup', ->
    del [
      opts.paths.build
      opts.browserify.path
    ]
