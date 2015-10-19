var gulp;

gulp = require('gulp');

module.exports = function(settings) {
  require('./lib/browser-sync')(settings);
  require('./lib/coffee')(settings);
  require('./lib/browserify')(settings);
  require('./lib/jade')(settings);
  require('./lib/cleanup')(settings);
  gulp.task('default', ['browser-sync:watch', 'watch']);
  gulp.task('compile', ['browserify:compile', 'jade:compile']);
  return gulp.task('watch', ['coffee:watch', 'browserify:watch', 'jade:watch']);
};
