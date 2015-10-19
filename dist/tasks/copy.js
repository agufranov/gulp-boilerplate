var gulp, path;

gulp = require('gulp');

path = require('path');

module.exports = function(opts) {
  return gulp.task('copy-lib', function() {
    return gulp.src(path.join(opts.paths.lib, '**', '*')).pipe(gulp.dest(path.join(opts.paths.build, path.basename(opts.paths.lib))));
  });
};
