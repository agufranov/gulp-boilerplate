gulp = require 'gulp'

# settings =
#   paths:
#     src: './src'
#     build: './build'
#   browserify:
#     path: './.browserify'
#     entries: ['js/app.js']
#     bundleName: 'all.js'

module.exports = (settings) ->

  require('./browser-sync') settings
  require('./coffee') settings
  require('./browserify') settings
  require('./jade') settings
  require('./cleanup') settings

  gulp.task 'default', ['browser-sync:watch', 'watch']

  gulp.task 'compile', ['browserify:compile', 'jade:compile']
  gulp.task 'watch', ['coffee:watch', 'browserify:watch', 'jade:watch']
