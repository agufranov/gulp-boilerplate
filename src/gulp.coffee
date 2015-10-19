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

  require('./lib/browser-sync') settings
  require('./lib/coffee') settings
  require('./lib/browserify') settings
  require('./lib/jade') settings
  require('./lib/cleanup') settings

  gulp.task 'default', ['browser-sync:watch', 'watch']

  gulp.task 'compile', ['browserify:compile', 'jade:compile']
  gulp.task 'watch', ['coffee:watch', 'browserify:watch', 'jade:watch']
