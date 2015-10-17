gulp = require 'gulp'

settings =
  paths:
    src: './src'
    build: './build'
  browserify:
    path: './.browserify'
    entries: ['js/app.js']
    bundleName: 'all.js'

require('./gulp/browser-sync') settings
require('./gulp/coffee') settings
require('./gulp/browserify') settings
require('./gulp/jade') settings
require('./gulp/cleanup') settings

gulp.task 'default', ['browser-sync:watch', 'watch']

gulp.task 'compile', ['browserify:compile', 'jade:compile']
gulp.task 'watch', ['coffee:watch', 'browserify:watch', 'jade:watch']
