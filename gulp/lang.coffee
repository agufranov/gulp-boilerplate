gulp = require 'gulp'

module.exports = (settings) ->
  require('./coffee') settings
  require('./jade') settings

  gulp.task 'compile', ['coffee:compile', 'jade:compile']
  gulp.task 'watch', ['coffee:watch', 'jade:watch']
