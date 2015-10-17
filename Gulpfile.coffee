gulp = require 'gulp'
require('./gulp/browser-sync') baseDir: './build'
require('./gulp/lang') srcDir: './src', destDir: './build'

gulp.task 'default', ['browser-sync:watch', 'watch']
