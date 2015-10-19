(function() {
  var del, gulp;

  gulp = require('gulp');

  del = require('del');

  module.exports = function(opts) {
    return gulp.task('cleanup', function() {
      return del([opts.paths.build, opts.browserify.path]);
    });
  };

}).call(this);
