var gulp, path;

gulp = require('gulp');

path = require('path');

module.exports = function(opts) {
  return gulp.task('copy-lib', function() {
    var i, len, libPath, ref, results;
    ref = opts.paths.lib;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      libPath = ref[i];
      results.push(gulp.src(path.join(libPath, '**', '*')).pipe(gulp.dest(path.join(opts.paths.build, path.basename(libPath)))));
    }
    return results;
  });
};
