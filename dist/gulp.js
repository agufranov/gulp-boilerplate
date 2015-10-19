var gulp;

gulp = require('gulp');

module.exports = function(settings) {
  require('./tasks/browser-sync')(settings);
  require('./tasks/coffee')(settings);
  require('./tasks/browserify')(settings);
  require('./tasks/jade')(settings);
  require('./tasks/cleanup')(settings);
  require('./tasks/copy')(settings);
  gulp.task('serve', ['browser-sync:watch', 'watch']);
  gulp.task('build', ['browserify:compile', 'jade:compile', 'copy-lib']);
  return gulp.task('watch', ['coffee:watch', 'browserify:watch', 'jade:watch']);
};
