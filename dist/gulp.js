var gulp;

gulp = require('gulp');

module.exports = function(settings) {
  require('./lib/browser-sync')(settings);
  require('./lib/coffee')(settings);
  require('./lib/browserify')(settings);
  require('./lib/jade')(settings);
  require('./lib/cleanup')(settings);
  require('./lib/copy')(settings);
  gulp.task('default', ['browser-sync:watch', 'watch']);
  gulp.task('build', ['browserify:compile', 'jade:compile', 'copy-lib']);
  return gulp.task('watch', ['coffee:watch', 'browserify:watch', 'jade:watch']);
};
